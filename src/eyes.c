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


uint8_t indexorden[numChannels];
uint8_t t; //tiempo;


typedef enum EyesS_t {
  E_OFF,
  E_ON,
  E_OPEN,
  E_CLOSE,
  E_FADE,
  E_TALK,
  E_TESTLEDS,
  E_TEST
} EyesS_t;

volatile EyesS_t eyesState;
volatile uint16_t iterate;
volatile bool upstate;

void setEyesAngry (void);
void setEyesCircle_d (uint8_t num);
void setEyesCircle_i (uint8_t num);
void setEyesBlinck_d (uint8_t num);
void setEyesBlinck_i (uint8_t num);
void setEyesUpDown_d (uint8_t num);
void setEyesUpDown_i (uint8_t num);
void setEyesCircleMiddle_d (uint8_t num);
void setEyesCircleMiddle_i (uint8_t num);
void setEyesWink_d (uint8_t num);
void setEyesWink_i (uint8_t num);
void setEyesTired (uint8_t num);

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

	TLC5940_SetAllDC(63);
	TLC5940_ClockInDC();
  
  eyesState = E_OFF;
	// Default all channels to off
	TLC5940_SetAllGS(0);
}


ISR(TIMER1_COMPA_vect){
  switch (eyesState) {
    case E_OFF:
      break;
    case E_ON:
      break;
    case E_OPEN:
      break;
    case E_CLOSE:
      break;
    case E_FADE:
	    while(gsUpdateFlag);	// wait until we can modify gsData
    	TLC5940_SetAllGS(iterate);
   	  TLC5940_SetGSUpdateFlag();
      if (upstate) {
        iterate += FADE_STEP;
        if (iterate > MAX_BRIGHT) upstate = false;
      }
      else {
        iterate -= FADE_STEP;
        if (iterate == 0) upstate = true;
      }
      break;
    case E_TALK:
      if (iterate==0) setEyesOpen();
      else if (iterate == (TALK_PULSE/2)) setEyesClose();
      iterate++;
      if (iterate == TALK_PULSE) iterate = 0;
      break;
    case E_TESTLEDS:
	    while(gsUpdateFlag);	// wait until we can modify gsData
	    TLC5940_SetAllGS(0);
      TLC5940_SetGS(iterate, MAX_BRIGHT);
 //  	  TLC5940_SetGSUpdateFlag();
      iterate = (iterate + 1) % numChannels;
      break;
    case E_TEST:
	if (t==1) {
	setEyesTired (iterate);
	iterate = (iterate + 1);
	t=0;
	}
	t++;
      break;
    default:
      break;
  }
  TLC5940_SetGSUpdateFlag();
}

void setEyesFade(void){
  eyesState = E_FADE;
  upstate = true;
  iterate = 0;
}

void setEyesTalk(void){
  eyesState = E_TALK;
  iterate = 0;
}

void eyesTestLeds(void) {
  eyesState = E_TESTLEDS;
  iterate = 0;
}

void eyesTest(void) {
  eyesState = E_TEST;
  iterate = 0;
  t=0;
}

void setEyesOpen(void) {
  uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(0);
  for (i=0;i<19;i++) TLC5940_SetGS(indexorden[i], MAX_BRIGHT);
  for (i=29;i<36;i++) TLC5940_SetGS(indexorden[i], MAX_BRIGHT);
	TLC5940_SetGSUpdateFlag();
}

void setEyesOn() {
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(MAX_BRIGHT);
  TLC5940_SetGSUpdateFlag();
}

void setEyesOff() {
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(0);
  TLC5940_SetGSUpdateFlag();
}

void setEyesClose(void) {
  uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(0);
  for (i=18;i<30;i++) TLC5940_SetGS(indexorden[i], MAX_BRIGHT);
	TLC5940_SetGSUpdateFlag();
}

void setEyesAngry (void) {
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

void setEyesCircle_d (uint8_t num) {
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

void setEyesCircle_i (uint8_t num) {
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

void setEyesBlink_d (uint8_t num) {
	uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
  	for (i=0;i<16;i++) TLC5940_SetGS(i, MAX_BRIGHT);

	if (num == 0) {
	TLC5940_SetGS(5, MAX_BRIGHT*0);
	TLC5940_SetGS(7, MAX_BRIGHT*0);
	}

	else if (num == 1) {
	TLC5940_SetGS(2, MAX_BRIGHT*0);
	TLC5940_SetGS(6, MAX_BRIGHT*0);
	TLC5940_SetGS(10, MAX_BRIGHT*0);
	TLC5940_SetGS(12, MAX_BRIGHT*0);
	}

	else if (num == 2) {
	TLC5940_SetGS(1, MAX_BRIGHT*0);
	TLC5940_SetGS(11, MAX_BRIGHT*0);
	TLC5940_SetGS(14, MAX_BRIGHT*0);
	TLC5940_SetGS(8, MAX_BRIGHT*0);
	TLC5940_SetGS(4, MAX_BRIGHT*0);
	}

	else if (num == 3) {
	TLC5940_SetGS(0, MAX_BRIGHT*0);
	TLC5940_SetGS(3, MAX_BRIGHT*0);
	TLC5940_SetGS(9, MAX_BRIGHT*0);
	TLC5940_SetGS(13, MAX_BRIGHT*0);
	TLC5940_SetGS(15, MAX_BRIGHT*0);
	}
	
}

void setEyesBlink_i (uint8_t num) { //terminar
	uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
  	for (i=16;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT);

	if (num == 0) {
	TLC5940_SetGS(26, MAX_BRIGHT*0);
	TLC5940_SetGS(24, MAX_BRIGHT*0);
	}

	else if (num == 1) {
	TLC5940_SetGS(19, MAX_BRIGHT*0);
	TLC5940_SetGS(21, MAX_BRIGHT*0);
	TLC5940_SetGS(25, MAX_BRIGHT*0);
	TLC5940_SetGS(29, MAX_BRIGHT*0);
	}

	else if (num == 2) {
	TLC5940_SetGS(17, MAX_BRIGHT*0);
	TLC5940_SetGS(20, MAX_BRIGHT*0);
	TLC5940_SetGS(23, MAX_BRIGHT*0);
	TLC5940_SetGS(27, MAX_BRIGHT*0);
	TLC5940_SetGS(30, MAX_BRIGHT*0);
	}

	else if (num == 3) {
	TLC5940_SetGS(16, MAX_BRIGHT*0);
	TLC5940_SetGS(18, MAX_BRIGHT*0);
	TLC5940_SetGS(22, MAX_BRIGHT*0);
	TLC5940_SetGS(28, MAX_BRIGHT*0);
	TLC5940_SetGS(31, MAX_BRIGHT*0);
	}
}

void setEyesUpDown_d (uint8_t num) { //sube y baja los ojos
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

void setEyesUpDown_i (uint8_t num) { //
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

void setEyesCircleMiddle_d (uint8_t num) { //OJO A LA ALTURA MEDIA DERECHA A IZQUIERDA
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

void setEyesCircleMiddle_i (uint8_t num) { //OJO A LA ALTURA MEDIA DERECHA A IZQUIERDA
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

void setEyesWink_d (uint8_t num) { //GUIÑA OJO DERECHO
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

void setEyesWink_i (uint8_t num) { //GUIÑA OJO IZQUIERDO
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

void setEyesTired (uint8_t num) { //FALTA TERMINAR!!!!
	uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
  	
	for (i=0;i<32;i++) TLC5940_SetGS(i, MAX_BRIGHT*(1-num/255.0));
}

