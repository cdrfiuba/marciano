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

#if (12 * TLC5940_N > 255)
#define dcData_t uint16_t
#else
#define dcData_t uint8_t
#endif

#if (24 * TLC5940_N > 255)
#define gsData_t uint16_t
#else
#define gsData_t uint8_t
#endif

#define dcDataSize ((dcData_t)12 * TLC5940_N)
#define gsDataSize ((gsData_t)24 * TLC5940_N)

uint8_t dcData[12 * TLC5940_N] = {
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,	
};

uint8_t gsData[24 * TLC5940_N] = {
	0b00000000,
	0b00000000,
	0b00000000,
	0b00000000,
	0b00000000,
	0b00000001,
	0b00000000,
	0b00100000,
	0b00000100,
	0b00000000,
	0b10000000,
	0b00010000,
	0b00000010,
	0b00000000,
	0b01000000,
	0b00001000,
	0b00000001,
	0b00000000,
	0b00100000,
	0b00000100,
	0b00000000,
	0b10000000,
	0b00001111,
	0b11111111,
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

	// Enable SPI, Master, set clock rate fck/2
	SPCR = (1 << SPE) | (1 << MSTR);
	SPSR = (1 << SPI2X);

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
	
	for (dcData_t i = 0; i < dcDataSize; i++) {
		// Start transmission
		SPDR = dcData[i];
		// Wait for transmission complete
		while (!(SPSR & (1 << SPIF)));
	}
	pulse(XLAT_PORT, XLAT_PIN);
}

ISR(TIMER0_COMPA_vect) {
	static uint8_t xlatNeedsPulse = 0;
	
	setHigh(BLANK_PORT, BLANK_PIN);
	
	if (outputState(VPRG_PORT, VPRG_PIN)) {
		setLow(VPRG_PORT, VPRG_PIN);
		if (xlatNeedsPulse) {
			pulse(XLAT_PORT, XLAT_PIN);
			xlatNeedsPulse = 0;
		}
		pulse(SCLK_PORT, SCLK_PIN);
	} else if (xlatNeedsPulse) {
		pulse(XLAT_PORT, XLAT_PIN);
		xlatNeedsPulse = 0;
	}
	
	setLow(BLANK_PORT, BLANK_PIN);
	
	// Below this we have 4096 cycles to shift in the data for the next cycle
	for (gsData_t i = 0; i < gsDataSize; i++) {
		SPDR = gsData[i];
		while (!(SPSR & (1 << SPIF)));
	}
	xlatNeedsPulse = 1;
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
