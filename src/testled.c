#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "eyes.h"

int main(void) {
	eyesInit();
	
	// Enable Global Interrupts
	sei();
	
  eyesTest();
	
  for (;;) {
	}
	
	return 0;
}
