#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "eyes.h"
#include "usart.h"

#define CANT_MODES  10

int main (void)
{
  _delay_ms(2000);
  eyesInit();

  USART0Setup(BAUD_PRESCALER(9600), USART_CHARSIZE_8BIT,
    USART_PARITY_DIS, USART_STOP_1BIT, USART_MODE_ASYNC);

  // Enable Interrupts
  sei();

  unsigned char letter;
  uint8_t counter = 0 ;
  setEyesAngry();
  //DDRC |= 1<<3;
  DDRC |= 1<<5;

  for(;;) {
    letter = USART0Receive();
    if (letter == 'n') {
      PINC |= 1<<3; //si recive una N, se invierte el led 0 de la placa (ademas el led 1 se invierte con cualquier dato nuevo).
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

    if (letter == '1') 
      setEyesAngry();
    if (letter == '2') 
      setEyesWink_d();
    if (letter == '3') 
      setEyesBlink();
    if (letter == '4') 
      setEyesCircle();
    if (letter == '5') 
      setEyesUpDown();
    if (letter == 'A') 
      setEyesOn();
    if (letter == 'B') 
      setEyesOff();
    USART0Transmit(letter);
    USART0Transmit('0');

/*
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


*/
  }
}
