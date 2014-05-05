#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "eyes.h"
#include "usart.h"

#define CANT_MODES  10

int main (void)
{
  eyesInit();

  // Enable Interrupts
  sei();

  USART0Setup(BAUD_PRESCALER(115200), USART_CHARSIZE_8BIT,
    USART_PARITY_DIS, USART_STOP_1BIT, USART_MODE_ASYNC);

  unsigned char letter;
  uint8_t counter = 0 ;
  DDRC |= 1<<3;

  for(;;) {
    letter = USART0Receive();
    if (letter == 'n') {
      PINC |= 1<<3;
      if (counter < (CANT_MODES -1))
        counter++;
      else
        counter = 0;
    }
    if (letter == 'p') {
      if (counter > 0)
        counter--;
      else
        counter = CANT_MODES -1;
    }

    counter = counter >= CANT_MODES ? 0 : counter;
    counter = counter < 0 ? CANT_MODES-1 : counter;

    if (counter == 0)
      setEyesAngry();
    if (counter == 1)
      setEyesCircle();
    if (counter == 2)
      setEyesCircleMiddle();
    if (counter == 3)
      setEyesUpDown();
    if (counter == 4)
      setEyesBlink();
    if (counter == 5)
      setEyesWink_d();
    if (counter == 6)
      setEyesWink_i();
    if (counter == 7)
      setEyesTired();
    if (counter == 8)
      setEyesOn();
    if (counter == 9)
      setEyesOff();
  }
}
