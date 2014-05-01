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

//  uint16_t baudrate = BAUD_PRESCALER(9600);
//  USART0Setup(baudrate, USART_CHARSIZE_8BIT,
//    USART_PARITY_DIS, USART_STOP_1BIT, USART_MODE_ASYNC);

  unsigned char letter;
  uint16_t counter = 0 ;

  DDRC |= 1<<3;

  for(;;) {
//    letter = USART0Receive();
//    if (letter == 'n')
//      PINC |= 1<<3;
//      counter++;
//    if (letter == 'p')
//      counter--;

//    counter = counter >= CANT_MODES ? 0 : counter;
//    counter = counter < 0 ? CANT_MODES-1 : counter;

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
      
    _delay_ms(5000);
    counter = (counter +1) %10;
  }
}
