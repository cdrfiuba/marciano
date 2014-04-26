#ifndef __EYES_H_
#define __EYES_H_

#include "tlc5940.h"

// define cada cuantos mili segundos se llama a la interrupcion de leds
#define TICKER_MS   10
#define FADE_STEP   5
#define MAX_FADE    MAX_BRIGTH
#define TALK_PULSE  40 //ciclos de TICKER_MS

void eyesInit(void);
void eyesTestLeds(void);
void setEyesClose(void);
void setEyesOpen(void);
void setEyesTalk(void);
void setEyesFade(void);
void setEyesOn(void);
void setEyesOff(void);

#endif
