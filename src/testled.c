#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "tlc5940.h"

int main(void) {
	// Enable Global Interrupts
	TLC5940_Init();
	TLC5940_SetAllDC(63);
	TLC5940_ClockInDC();
  
  
	// Default all channels to off
	TLC5940_SetAllGS(0);
	sei();
	
	for (;;) {
	  TLC5940_SetAllGS(0);
   	  TLC5940_SetGSUpdateFlag();
    _delay_ms(1000);
	  TLC5940_SetAllGS(2055);
   	  TLC5940_SetGSUpdateFlag();
    _delay_ms(1000);
	}
	
	return 0;
}
