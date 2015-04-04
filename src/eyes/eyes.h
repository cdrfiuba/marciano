#ifndef __EYES_H_
#define __EYES_H_

#include "tlc5940.h"

// define cada cuantos mili segundos se llama a la interrupcion de leds
#define TICKER_MS   10
#define FADE_STEP   5
#define MAX_FADE    MAX_BRIGTH
#define TALK_PULSE  40 //ciclos de TICKER_MS

void eyesInit(void);
void setTestLeds(void);

void setEyesAngry (void);
void setEyesCircle (void);
void setEyesCircleMiddle (void);
void setEyesUpDown (void);
void setEyesBlink (void);
void setEyesWink_d (void);
void setEyesWink_i (void);
void setEyesTired (void);
void setEyesOn(void);
void setEyesOff(void);

#endif
