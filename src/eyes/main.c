#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "eyes.h"
#include "usart.h"

#define CANT_MODES  6

int main (void)
{
  eyesInit();

  // Enable Interrupts
  sei();

  uint16_t baudrate = BAUD_PRESCALER(9600);
  USART0Setup(baudrate, USART_CHARSIZE_8BIT,
    USART_PARITY_DIS, USART_STOP_1BIT, USART_MODE_ASYNC);

  unsigned char letter;
  uint16_t counter;

  for(;;) {
    letter = USART0Receive();
    if (letter == 'n')
      counter++;
    if (letter == 'p')
      counter--;

    counter = counter >= CANT_MODES ? 0 : counter;
    counter = counter < 0 ? CANT_MODES-1 : counter;

    if (counter == 0)
      setEyesClose();
    if (counter == 1)
      setEyesOpen();
    if (counter == 2)
      setEyesTalk();
    if (counter == 3)
      setEyesFade();
    if (counter == 4)
      setEyesOn();
    if (counter == 5)
      setEyesOff();
  }
}
