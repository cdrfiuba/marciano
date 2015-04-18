#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdbool.h>
#include "tlc5940.h"
#include "eyes.h"


//        Vista desde adelante
//
//      5                        26
//        7                    24
//   2  6   10  12       19  21  25  29
//  1  4  8  11  14     17  20 23  27  30
// 0  3   9   13  15   16  18  22   28  31


//uint8_t indexorden[numChannels];
uint8_t t; //tiempo;
uint8_t contando;


typedef enum EyesS_t {
  E_OFF,
  E_ON,
  E_ANGRY,
  E_CIRCLE,
  E_CIRCLEMIDDLE,
  E_UPDOWN,
  E_BLINK,
  E_WINK_D,
  E_WINK_I,
  E_TIRED,
  E_TESTLEDS
} EyesS_t;

volatile EyesS_t eyesState;
volatile uint16_t iterate;
volatile bool upstate;


void EyesAngry (void);

void EyesCircle_d (uint8_t num);
void EyesCircle_i (uint8_t num);

void EyesBlink_d (uint8_t num);
void EyesBlink_i (uint8_t num);

void EyesUpDown_d (uint8_t num);
void EyesUpDown_i (uint8_t num);

void EyesCircleMiddle_d (uint8_t num);
void EyesCircleMiddle_i (uint8_t num);

void EyesWink_d (uint8_t num);

void EyesWink_i (uint8_t num);

void EyesTired (uint8_t num);

void eyesInit(void){
  TLC5940_Init();

#if (TLC5940_MANUAL_DC_FUNCS)
  TLC5940_SetAllDC(63);
  TLC5940_ClockInDC();
#endif


  // CTC with OCR1A as TOP
  //TCCR1A = (1 << WGM11);
  // clk_io/1024 (From prescaler)
  TCCR1B = ((1<<WGM12)|(1 << CS12) | (0 << CS11)| (1 << CS10));
  // Generate an interrupt every 'TICKER_MS' ms
  OCR1A = (25*TICKER_MS);
  // Enable Timer/Counter0 Compare Match A interrupt
  TIMSK1 |= (1 << OCIE1A);

  eyesState = E_OFF;
  // Default all channels to off
  TLC5940_SetAllGS(0);
}


ISR(TIMER1_COMPA_vect){
  switch (eyesState) {
    case E_ON:
      break;

    case E_OFF:
      break;

    case E_ANGRY:
      break;

    case E_CIRCLE:
      if (t==25) {
        EyesCircle_d (iterate);
        EyesCircle_i (iterate);
        iterate = (iterate + 1) % 4;
        t=0;
      }
      t++;
      break;

    case E_CIRCLEMIDDLE:
      if (t==25) {
        EyesCircleMiddle_d (iterate);
        EyesCircleMiddle_i (iterate);
        iterate = (iterate + 1) % 4;
        t=0;
      }
      t++;
      break;

    case E_BLINK:
      if (t==25) {
        EyesBlink_d (iterate);
        EyesBlink_i (iterate);
        iterate = (iterate + 1) % 5;
        t=0;
      }
      t++;
      break;

    case E_UPDOWN:
      if (t==25) {
        EyesUpDown_d (iterate);
        EyesUpDown_i (iterate);
        iterate = (iterate + 1) % 3;
        t=0;
      }
      t++;
      break;

    case E_WINK_I:
      if (t==25) {
        EyesWink_i (iterate);
        iterate = (iterate + 1) % 3;
        t=0;
      }
      t++;
      break;

    case E_WINK_D:
      if (t==25) {
        EyesWink_d (iterate);
        iterate = (iterate + 1) % 3;
        t=0;
      }
      t++;
      break;

    case E_TIRED:
      if (t==1) {
        EyesTired (iterate);
        if (contando==0) {
          iterate = (iterate + 1);
          if (iterate==255){
            contando=1;
            }
          }
        else {
          iterate = (iterate - 1);
          if (iterate==0) {
            contando=0;
            }
          }
               
        t=0;
      }
      t++;
      break;

    case E_TESTLEDS:
      while(gsUpdateFlag);	// wait until we can modify gsData
      TLC5940_SetAllGS(0);
      TLC5940_SetGS(iterate, MAX_BRIGHT);
      //  	  TLC5940_SetGSUpdateFlag();
      iterate = (iterate + 1) % numChannels;
      break;

    default:
      break;
  }
  TLC5940_SetGSUpdateFlag();
}

void eyesTestLeds(void) {
  eyesState = E_TESTLEDS;
  iterate = 0;
}

void setEyesOn(void) {
  eyesState = E_ON;
  while(gsUpdateFlag);	// wait until we can modify gsData
  TLC5940_SetAllGS(MAX_BRIGHT);
  TLC5940_SetGSUpdateFlag();
}

void setEyesOff(void) {
  eyesState = E_OFF;
  while(gsUpdateFlag);	// wait until we can modify gsData
  TLC5940_SetAllGS(0);
  TLC5940_SetGSUpdateFlag();
}

void setEyesAngry (void) {
  eyesState = E_ANGRY;
  EyesAngry();
}

void EyesAngry (void) {
  while(gsUpdateFlag);	// wait until we can modify gsData
  TLC5940_SetGS(5, MAX_BRIGHT);
  TLC5940_SetGS(7, MAX_BRIGHT);
  TLC5940_SetGS(10, MAX_BRIGHT);
  TLC5940_SetGS(11, MAX_BRIGHT);
  TLC5940_SetGS(12, MAX_BRIGHT);
  TLC5940_SetGS(13, MAX_BRIGHT);
  TLC5940_SetGS(14, MAX_BRIGHT);
  TLC5940_SetGS(15, MAX_BRIGHT);
  TLC5940_SetGS(2, MAX_BRIGHT);
  TLC5940_SetGS(6, MAX_BRIGHT);
  TLC5940_SetGS(8, MAX_BRIGHT);
  TLC5940_SetGS(24, MAX_BRIGHT);
  TLC5940_SetGS(21, MAX_BRIGHT);
  TLC5940_SetGS(26, MAX_BRIGHT);
  TLC5940_SetGS(20, MAX_BRIGHT);
  TLC5940_SetGS(18, MAX_BRIGHT);
  TLC5940_SetGS(19, MAX_BRIGHT);
  TLC5940_SetGS(17, MAX_BRIGHT);
  TLC5940_SetGS(16, MAX_BRIGHT);
  TLC5940_SetGS(25, MAX_BRIGHT);
  TLC5940_SetGS(29, MAX_BRIGHT);
  TLC5940_SetGS(23, MAX_BRIGHT);
  TLC5940_SetGSUpdateFlag();
}

void setEyesCircle (void) {
  eyesState = E_CIRCLE;
  iterate=0;
  t=0;
}

void EyesCircle_d (uint8_t num) {
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);

  if (num == 0) {
    TLC5940_SetGS(0, MAX_BRIGHT);
    TLC5940_SetGS(1, MAX_BRIGHT);
    TLC5940_SetGS(4, MAX_BRIGHT);
    TLC5940_SetGS(3, MAX_BRIGHT);
  }

  else if (num == 1) {
    TLC5940_SetGS(4, MAX_BRIGHT);
    TLC5940_SetGS(3, MAX_BRIGHT);
    TLC5940_SetGS(9, MAX_BRIGHT);
    TLC5940_SetGS(8, MAX_BRIGHT);
  }

  else if (num == 2) {
    TLC5940_SetGS(8, MAX_BRIGHT);
    TLC5940_SetGS(9, MAX_BRIGHT);
    TLC5940_SetGS(11, MAX_BRIGHT);
    TLC5940_SetGS(13, MAX_BRIGHT);
  }

  else if (num == 3) {
    TLC5940_SetGS(13, MAX_BRIGHT);
    TLC5940_SetGS(11, MAX_BRIGHT);
    TLC5940_SetGS(14, MAX_BRIGHT);
    TLC5940_SetGS(15, MAX_BRIGHT);
  }
  //	TLC5940_SetGSUpdateFlag();
}

void EyesCircle_i (uint8_t num) {
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);

  if (num == 0) {
    TLC5940_SetGS(17, MAX_BRIGHT);
    TLC5940_SetGS(16, MAX_BRIGHT);
    TLC5940_SetGS(18, MAX_BRIGHT);
    TLC5940_SetGS(20, MAX_BRIGHT);
  }

  else if (num == 1) {
    TLC5940_SetGS(20, MAX_BRIGHT);
    TLC5940_SetGS(18, MAX_BRIGHT);
    TLC5940_SetGS(23, MAX_BRIGHT);
    TLC5940_SetGS(22, MAX_BRIGHT);
  }

  else if (num == 2) {
    TLC5940_SetGS(23, MAX_BRIGHT);
    TLC5940_SetGS(22, MAX_BRIGHT);
    TLC5940_SetGS(27, MAX_BRIGHT);
    TLC5940_SetGS(28, MAX_BRIGHT);
  }

  else if (num == 3) {
    TLC5940_SetGS(27, MAX_BRIGHT);
    TLC5940_SetGS(28, MAX_BRIGHT);
    TLC5940_SetGS(30, MAX_BRIGHT);
    TLC5940_SetGS(31, MAX_BRIGHT);
  }
  //	TLC5940_SetGSUpdateFlag();
}

void setEyesBlink (void) {
  eyesState = E_BLINK;
  iterate=0;
  t=0;
}

void EyesBlink_d (uint8_t num) {
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT);

  if (num == 0) {
  }
  
  if (num == 1) {
    TLC5940_SetGS(5, MAX_BRIGHT*0);
    TLC5940_SetGS(7, MAX_BRIGHT*0);
  }

  else if (num == 2) {
    TLC5940_SetGS(5, MAX_BRIGHT*0);
    TLC5940_SetGS(7, MAX_BRIGHT*0);
    
    TLC5940_SetGS(2, MAX_BRIGHT*0);
    TLC5940_SetGS(6, MAX_BRIGHT*0);
    TLC5940_SetGS(10, MAX_BRIGHT*0);
    TLC5940_SetGS(12, MAX_BRIGHT*0);
  }

  else if (num == 3) {
    TLC5940_SetGS(5, MAX_BRIGHT*0);
    TLC5940_SetGS(7, MAX_BRIGHT*0);
    
    TLC5940_SetGS(2, MAX_BRIGHT*0);
    TLC5940_SetGS(6, MAX_BRIGHT*0);
    TLC5940_SetGS(10, MAX_BRIGHT*0);
    TLC5940_SetGS(12, MAX_BRIGHT*0);
    
    TLC5940_SetGS(1, MAX_BRIGHT*0);
    TLC5940_SetGS(11, MAX_BRIGHT*0);
    TLC5940_SetGS(14, MAX_BRIGHT*0);
    TLC5940_SetGS(8, MAX_BRIGHT*0);
    TLC5940_SetGS(4, MAX_BRIGHT*0);
  }

  else if (num == 4) {
    TLC5940_SetGS(5, MAX_BRIGHT*0);
    TLC5940_SetGS(7, MAX_BRIGHT*0);
    
    TLC5940_SetGS(2, MAX_BRIGHT*0);
    TLC5940_SetGS(6, MAX_BRIGHT*0);
    TLC5940_SetGS(10, MAX_BRIGHT*0);
    TLC5940_SetGS(12, MAX_BRIGHT*0);
    
    TLC5940_SetGS(1, MAX_BRIGHT*0);
    TLC5940_SetGS(11, MAX_BRIGHT*0);
    TLC5940_SetGS(14, MAX_BRIGHT*0);
    TLC5940_SetGS(8, MAX_BRIGHT*0);
    TLC5940_SetGS(4, MAX_BRIGHT*0);
    
    TLC5940_SetGS(0, MAX_BRIGHT*0);
    TLC5940_SetGS(3, MAX_BRIGHT*0);
    TLC5940_SetGS(9, MAX_BRIGHT*0);
    TLC5940_SetGS(13, MAX_BRIGHT*0);
    TLC5940_SetGS(15, MAX_BRIGHT*0);
  }

}

void EyesBlink_i (uint8_t num) { //terminar
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT);

  if (num == 0) {
  }

  if (num == 1) {
    TLC5940_SetGS(26, MAX_BRIGHT*0);
    TLC5940_SetGS(24, MAX_BRIGHT*0);
  }

  else if (num == 2) {
    TLC5940_SetGS(26, MAX_BRIGHT*0);
    TLC5940_SetGS(24, MAX_BRIGHT*0);
  
    TLC5940_SetGS(19, MAX_BRIGHT*0);
    TLC5940_SetGS(21, MAX_BRIGHT*0);
    TLC5940_SetGS(25, MAX_BRIGHT*0);
    TLC5940_SetGS(29, MAX_BRIGHT*0);
  }

  else if (num == 3) {
    TLC5940_SetGS(26, MAX_BRIGHT*0);
    TLC5940_SetGS(24, MAX_BRIGHT*0);
  
    TLC5940_SetGS(19, MAX_BRIGHT*0);
    TLC5940_SetGS(21, MAX_BRIGHT*0);
    TLC5940_SetGS(25, MAX_BRIGHT*0);
    TLC5940_SetGS(29, MAX_BRIGHT*0);  
  
    TLC5940_SetGS(17, MAX_BRIGHT*0);
    TLC5940_SetGS(20, MAX_BRIGHT*0);
    TLC5940_SetGS(23, MAX_BRIGHT*0);
    TLC5940_SetGS(27, MAX_BRIGHT*0);
    TLC5940_SetGS(30, MAX_BRIGHT*0);
  }

  else if (num == 4) {
    TLC5940_SetGS(26, MAX_BRIGHT*0);
    TLC5940_SetGS(24, MAX_BRIGHT*0);
  
    TLC5940_SetGS(19, MAX_BRIGHT*0);
    TLC5940_SetGS(21, MAX_BRIGHT*0);
    TLC5940_SetGS(25, MAX_BRIGHT*0);
    TLC5940_SetGS(29, MAX_BRIGHT*0);  
  
    TLC5940_SetGS(17, MAX_BRIGHT*0);
    TLC5940_SetGS(20, MAX_BRIGHT*0);
    TLC5940_SetGS(23, MAX_BRIGHT*0);
    TLC5940_SetGS(27, MAX_BRIGHT*0);
    TLC5940_SetGS(30, MAX_BRIGHT*0);  
  
    TLC5940_SetGS(16, MAX_BRIGHT*0);
    TLC5940_SetGS(18, MAX_BRIGHT*0);
    TLC5940_SetGS(22, MAX_BRIGHT*0);
    TLC5940_SetGS(28, MAX_BRIGHT*0);
    TLC5940_SetGS(31, MAX_BRIGHT*0);
  }
}

void setEyesUpDown (void) {
  eyesState = E_UPDOWN;
  iterate=0;
  t=0;
}

void EyesUpDown_d (uint8_t num) { //sube y baja los ojos
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);

  if (num == 0) {
    TLC5940_SetGS(5, MAX_BRIGHT);
    TLC5940_SetGS(7, MAX_BRIGHT);
    TLC5940_SetGS(6, MAX_BRIGHT);
    TLC5940_SetGS(10, MAX_BRIGHT);
  }

  else if (num == 1) {
    TLC5940_SetGS(6, MAX_BRIGHT);
    TLC5940_SetGS(10, MAX_BRIGHT);
    TLC5940_SetGS(8, MAX_BRIGHT);
    TLC5940_SetGS(11, MAX_BRIGHT);
  }

  else if (num == 2) {
    TLC5940_SetGS(8, MAX_BRIGHT);
    TLC5940_SetGS(11, MAX_BRIGHT);
    TLC5940_SetGS(9, MAX_BRIGHT);
    TLC5940_SetGS(13, MAX_BRIGHT);
  }

  //	TLC5940_SetGSUpdateFlag();
}

void EyesUpDown_i (uint8_t num) { //
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);

  if (num == 0) {
    TLC5940_SetGS(26, MAX_BRIGHT);
    TLC5940_SetGS(24, MAX_BRIGHT);
    TLC5940_SetGS(21, MAX_BRIGHT);
    TLC5940_SetGS(25, MAX_BRIGHT);
  }

  else if (num == 1) {
    TLC5940_SetGS(21, MAX_BRIGHT);
    TLC5940_SetGS(25, MAX_BRIGHT);
    TLC5940_SetGS(23, MAX_BRIGHT);
    TLC5940_SetGS(20, MAX_BRIGHT);
  }

  else if (num == 2) {
    TLC5940_SetGS(23, MAX_BRIGHT);
    TLC5940_SetGS(20, MAX_BRIGHT);
    TLC5940_SetGS(22, MAX_BRIGHT);
    TLC5940_SetGS(18, MAX_BRIGHT);
  }

  //	TLC5940_SetGSUpdateFlag();
}

void setEyesCircleMiddle (void) {
  eyesState = E_CIRCLEMIDDLE;
  iterate=0;
  t=0;
}

void EyesCircleMiddle_d (uint8_t num) { //OJO A LA ALTURA MEDIA DERECHA A IZQUIERDA
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);

  if (num == 0) {
    TLC5940_SetGS(2, MAX_BRIGHT);
    TLC5940_SetGS(1, MAX_BRIGHT);
    TLC5940_SetGS(4, MAX_BRIGHT);
    TLC5940_SetGS(6, MAX_BRIGHT);
  }

  else if (num == 1) {
    TLC5940_SetGS(4, MAX_BRIGHT);
    TLC5940_SetGS(2, MAX_BRIGHT);
    TLC5940_SetGS(6, MAX_BRIGHT);
    TLC5940_SetGS(8, MAX_BRIGHT);
  }

  else if (num == 2) {
    TLC5940_SetGS(8, MAX_BRIGHT);
    TLC5940_SetGS(6, MAX_BRIGHT);
    TLC5940_SetGS(11, MAX_BRIGHT);
    TLC5940_SetGS(10, MAX_BRIGHT);
  }

  else if (num == 3) {
    TLC5940_SetGS(10, MAX_BRIGHT);
    TLC5940_SetGS(11, MAX_BRIGHT);
    TLC5940_SetGS(14, MAX_BRIGHT);
    TLC5940_SetGS(12, MAX_BRIGHT);
  }
  //	TLC5940_SetGSUpdateFlag();
}

void EyesCircleMiddle_i (uint8_t num) { //OJO A LA ALTURA MEDIA DERECHA A IZQUIERDA
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData
  for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);

  if (num == 0) {
    TLC5940_SetGS(17, MAX_BRIGHT);
    TLC5940_SetGS(19, MAX_BRIGHT);
    TLC5940_SetGS(21, MAX_BRIGHT);
    TLC5940_SetGS(20, MAX_BRIGHT);
  }

  else if (num == 1) {
    TLC5940_SetGS(20, MAX_BRIGHT);
    TLC5940_SetGS(19, MAX_BRIGHT);
    TLC5940_SetGS(23, MAX_BRIGHT);
    TLC5940_SetGS(21, MAX_BRIGHT);
  }

  else if (num == 2) {
    TLC5940_SetGS(23, MAX_BRIGHT);
    TLC5940_SetGS(21, MAX_BRIGHT);
    TLC5940_SetGS(27, MAX_BRIGHT);
    TLC5940_SetGS(25, MAX_BRIGHT);
  }

  else if (num == 3) {
    TLC5940_SetGS(27, MAX_BRIGHT);
    TLC5940_SetGS(25, MAX_BRIGHT);
    TLC5940_SetGS(30, MAX_BRIGHT);
    TLC5940_SetGS(29, MAX_BRIGHT);
  }
  //	TLC5940_SetGSUpdateFlag();
}

void setEyesWink_d (void) { //GUIÑA OJO DERECHO
  eyesState = E_WINK_D;
  iterate=0;
  t=0;
}

void EyesWink_d (uint8_t num) { //GUIÑA OJO DERECHO
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData

  if (num == 0) {
    for (i=0;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT);
  }

  if (num == 1) {
    for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);
  }

  if (num == 2) {
    for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT);
  }
  //	TLC5940_SetGSUpdateFlag();
}

void setEyesWink_i (void) {
  eyesState = E_WINK_I;
  iterate=0;
  t=0;
}

void EyesWink_i (uint8_t num) { //GUIÑA OJO IZQUIERDO
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData

  if (num == 0) {
    for (i=0;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT);
  }

  if (num == 1) {
    for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT*0);
  }

  if (num == 2) {
    for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT);
  }

  //	TLC5940_SetGSUpdateFlag();
}

void setEyesTired (void) {
  eyesState = E_TIRED;
  iterate=0;
  contando=0;
  t=0;
}

void EyesTired (uint8_t num) { 
  uint8_t i;
  while(gsUpdateFlag);	// wait until we can modify gsData

  for (i=0;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT*(1-num/255.0));
}

