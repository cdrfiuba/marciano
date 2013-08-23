#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define GSCLK_DDR DDRB
#define GSCLK_PORT PORTB
#define GSCLK_PIN PB0

#define SIN_DDR DDRB
#define SIN_PORT PORTB
#define SIN_PIN PB3

#define SCLK_DDR DDRB
#define SCLK_PORT PORTB
#define SCLK_PIN PB5

#define BLANK_DDR DDRB
#define BLANK_PORT PORTB
#define BLANK_PIN PB2

#define DCPRG_DDR DDRD
#define DCPRG_PORT PORTD
#define DCPRG_PIN PD4

#define VPRG_DDR DDRD
#define VPRG_PORT PORTD
#define VPRG_PIN PD7

#define XLAT_DDR DDRB
#define XLAT_PORT PORTB
#define XLAT_PIN PB1

#define TLC5940_N 1

#define setOutput(ddr, pin) ((ddr) |= (1 << (pin)))
#define setLow(port, pin) ((port) &= ~(1 << (pin)))
#define setHigh(port, pin) ((port) |= (1 << (pin)))
#define pulse(port, pin) do { \
                         	setHigh((port), (pin)); \
                         	setLow((port), (pin)); \
                         } while (0)
#define outputState(port, pin) ((port) & (1 << (pin)))

uint8_t dcData[96 * TLC5940_N] = {
// MSB            LSB
	1, 1, 1, 1, 1, 1,			// Channel 15
	1, 1, 1, 1, 1, 1,			// Channel 14
	1, 1, 1, 1, 1, 1,			// Channel 13
	1, 1, 1, 1, 1, 1, 			// Channel 12
	1, 1, 1, 1, 1, 1,			// Channel 11
	1, 1, 1, 1, 1, 1,			// Channel 10
	1, 1, 1, 1, 1, 1,			// Channel 9
	1, 1, 1, 1, 1, 1, 			// Channel 8
	1, 1, 1, 1, 1, 1, 			// Channel 7
	1, 1, 1, 1, 1, 1,			// Channel 6
	1, 1, 1, 1, 1, 1,			// Channel 5
	1, 1, 1, 1, 1, 1, 			// Channel 4
	1, 1, 1, 1, 1, 1, 			// Channel 3
	1, 1, 1, 1, 1, 1, 			// Channel 2
	1, 1, 1, 1, 1, 1, 			// Channel 1
	1, 1, 1, 1, 1, 1, 			// Channel 0
};

uint8_t gsData[192 * TLC5940_N] = {
// MSB                              LSB
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 		// Channel 15
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			// Channel 14
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			// Channel 13
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,			// Channel 12
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,			// Channel 11
	0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,			// Channel 10
	0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,			// Channel 9
	0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,			// Channel 8
	0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,			// Channel 7
	0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,			// Channel 6
	0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,			// Channel 5
	0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,			// Channel 4
	0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,			// Channel 3
	0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			// Channel 2
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			// Channel 1
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,			// Channel 0
};

void TLC5940_Init(void) {
	setOutput(GSCLK_DDR, GSCLK_PIN);
	setOutput(SCLK_DDR, SCLK_PIN);
	setOutput(DCPRG_DDR, DCPRG_PIN);
	setOutput(VPRG_DDR, VPRG_PIN);
	setOutput(XLAT_DDR, XLAT_PIN);
	setOutput(BLANK_DDR, BLANK_PIN);
	setOutput(SIN_DDR, SIN_PIN);
	
	setLow(GSCLK_DDR, GSCLK_PIN);
	setLow(SCLK_PORT, SCLK_PIN);
	setLow(DCPRG_PORT, DCPRG_PIN);
	setHigh(VPRG_PORT, VPRG_PIN);
	setLow(XLAT_PORT, XLAT_PIN);
	setHigh(BLANK_PORT, BLANK_PIN);

	// CTC with OCR0A as TOP
	TCCR0A = (1 << WGM01);
	// clk_io/1024 (From prescaler)
	TCCR0B = ((1 << CS02) | (1 << CS00));
	// Generate an interrupt every 4096 clock cycles
	OCR0A = 3;
	// Enable Timer/Counter0 Compare Match A interrupt
	TIMSK0 |= (1 << OCIE0A);
}

void TLC5940_ClockInDC(void) {
	setHigh(DCPRG_PORT, DCPRG_PIN);
	setHigh(VPRG_PORT, VPRG_PIN);

	uint8_t Counter = 0;
	
	for (;;) {
		if (Counter > TLC5940_N * 96 - 1) {
			pulse(XLAT_PORT, XLAT_PIN);
			break;
		} else {
			if (dcData[Counter])
				setHigh(SIN_PORT, SIN_PIN);
			else
				setLow(SIN_PORT, SIN_PIN);
			pulse(SCLK_PORT, SCLK_PIN);
			Counter++;
		}
	}
}

ISR(TIMER0_COMPA_vect) {
	uint8_t firstCycleFlag = 0;
	static uint8_t xlatNeedsPulse = 0;

	setHigh(BLANK_PORT, BLANK_PIN);

	if (outputState(VPRG_PORT, VPRG_PIN)) {
		setLow(VPRG_PORT, VPRG_PIN);
		firstCycleFlag = 1;
	}

	if (xlatNeedsPulse) {
		pulse(XLAT_PORT, XLAT_PIN);
		xlatNeedsPulse = 0;
	}
	
	if (firstCycleFlag)
		pulse(SCLK_PORT, SCLK_PIN);
	
	setLow(BLANK_PORT, BLANK_PIN);
	
	// Below this we have 4096 cycles to shift in the data for the next cycle
	uint8_t Data_Counter = 0;
	for (;;) {
		if (!(Data_Counter > TLC5940_N * 192 - 1)) {
			if (gsData[Data_Counter])
				setHigh(SIN_PORT, SIN_PIN);
			else
				setLow(SIN_PORT, SIN_PIN);
			pulse(SCLK_PORT, SCLK_PIN);
			Data_Counter++;
		} else {
			xlatNeedsPulse = 1;
			break;
		}
	}
}

int main(void) {
	TLC5940_Init();
	TLC5940_ClockInDC();
	
	// Enable Global Interrupts
	sei();

	for (;;) {
	}
	
	return 0;
}
