#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "eyes.h"

int main(void) {
	eyesInit();
	
	// Enable Global Interrupts
	sei();
	
  //eyesTest();
	
  for (;;) {
    setEyesAngry ();
    _delay_ms(1000);
    setEyesCircle ();
    _delay_ms(1000);
    setEyesCircleMiddle ();
    _delay_ms(1000);
    setEyesUpDown ();
    _delay_ms(1000);
    setEyesBlink ();
    _delay_ms(1000);
    setEyesWink_d ();
    _delay_ms(1000);
    setEyesWink_i ();
    _delay_ms(1000);
    setEyesTired ();
    _delay_ms(1000);
    setEyesOn();
    _delay_ms(1000);
    setEyesOff();
    _delay_ms(1000);
	}
	
	return 0;
}
