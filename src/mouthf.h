#ifndef __MOUTH_H_
#define __MOUTH_H_

#include "tlc5940.h"

// define cada cuantos mili segundos se llama a la interrupcion de leds
#define TICKER_MS   10
#define FADE_STEP   5
#define MAX_FADE    MAX_BRIGTH
#define TALK_PULSE  40 //ciclos de TICKER_MS

void MouthInit(void);
void TestChannels(void);
void SetMouthClose(void);
void SetMouthOpen(void);
void SetMouthTalk(void);
void SetMouthFade(void);
void SetMouthOn(void);
void SetMouthOff(void);

#endif
