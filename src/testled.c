#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "tlc5940.h"

int main(void) {
	TLC5940_Init();
	
#if (TLC5940_MANUAL_DC_FUNCS)
	TLC5940_SetAllDC(63);
	TLC5940_ClockInDC();
#endif

	// Default all channels to off
	TLC5940_SetAllGS(0);
	
	// Enable Global Interrupts
	sei();
	
	channel_t i = 0;
	for (;;) {
		while(gsUpdateFlag);	// wait until we can modify gsData
		TLC5940_SetAllGS(0);
//		TLC5940_SetAllGS(4095);
		TLC5940_SetGS(i, 4095);
		TLC5940_SetGSUpdateFlag();
		_delay_ms(100);
		i = (i + 1) % numChannels;
	}
	
	return 0;
}
