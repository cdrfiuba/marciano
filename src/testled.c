#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "tlc5940.h"
#include "mouthf.h"

int main(void) {
	MouthInit();
	// Enable Global Interrupts
	sei();
	
	for (;;) {
    SetMouthOff();
    _delay_ms(100);
    TestChannels();
    _delay_ms(5000);
    SetMouthTalk();
    _delay_ms(5000);
    SetMouthFade();
    _delay_ms(5000);
	}
	
	return 0;
}
