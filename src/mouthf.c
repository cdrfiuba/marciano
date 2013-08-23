#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdbool.h>
#include "tlc5940.h"
#include "mouthf.h"


typedef enum MouthS_t {
  M_OFF,
  M_ON,
  M_OPEN,
  M_CLOSE,
  M_FADE,
  M_TALK,
  M_TESTLINE
} MouthS_t;

volatile MouthS_t mouthState;
volatile uint16_t iterate;
volatile bool upstate;
void MouthInit(void){
	TLC5940_Init();
	
	// CTC with OCR1A as TOP
	//TCCR1A = (1 << WGM11);
	// clk_io/1024 (From prescaler)
	TCCR1B = ((1<<WGM12)|(1 << CS12) | (0 << CS11)| (1 << CS10));
	// Generate an interrupt every 'TICKER_MS' ms
	OCR1A = (18*TICKER_MS);
	// Enable Timer/Counter0 Compare Match A interrupt
	TIMSK1 |= (1 << OCIE1A);

	TLC5940_SetAllDC(63);
	TLC5940_ClockInDC();
  
  mouthState = M_OFF;
	// Default all channels to off
	TLC5940_SetAllGS(0);
}


ISR(TIMER1_COMPA_vect){
  switch (mouthState) {
    case M_OFF:
      break;
    case M_ON:
      break;
    case M_OPEN:
      break;
    case M_CLOSE:
      break;
    case M_FADE:
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
    case M_TALK:
      if (iterate==0) SetMouthOpen();
      else if (iterate == (TALK_PULSE/2)) SetMouthClose();
      iterate++;
      if (iterate == TALK_PULSE) iterate = 0;
      break;
    case M_TESTLINE:
	    while(gsUpdateFlag);	// wait until we can modify gsData
	    TLC5940_SetAllGS(0);
      TLC5940_SetGS(indexorden[iterate], MAX_BRIGHT);
   	  TLC5940_SetGSUpdateFlag();
      iterate++;
      if (iterate>NUMCHANNELS) iterate = 0;
      break;
    default:
      break;
  }
}

void SetMouthFade(void){
  mouthState = M_FADE;
  upstate = true;
  iterate = 0;
}

void SetMouthTalk(void){
  mouthState = M_TALK;
  iterate = 0;
}

void TestChannels(void) {
  mouthState = M_TESTLINE;
  iterate = 0;
}

void SetMouthOpen(void) {
  uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(0);
  for (i=0;i<19;i++) TLC5940_SetGS(indexorden[i], MAX_BRIGHT);
  for (i=29;i<36;i++) TLC5940_SetGS(indexorden[i], MAX_BRIGHT);
	TLC5940_SetGSUpdateFlag();
}

void SetMouthOn() {
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(MAX_BRIGHT);
  TLC5940_SetGSUpdateFlag();
}

void SetMouthOff() {
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(0);
  TLC5940_SetGSUpdateFlag();
}

void SetMouthClose(void) {
  uint8_t i;
	while(gsUpdateFlag);	// wait until we can modify gsData
	TLC5940_SetAllGS(0);
  for (i=18;i<30;i++) TLC5940_SetGS(indexorden[i], MAX_BRIGHT);
	TLC5940_SetGSUpdateFlag();
}

