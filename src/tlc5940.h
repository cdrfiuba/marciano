/*
 
 tlc5940.h
  
 Copyright 2010 Matthew T. Pandina. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY MATTHEW T. PANDINA "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL MATTHEW T. PANDINA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 */
#ifndef __TLC5940_H_
#define __TLC5940_H_
//#pragma once

#include <stdint.h>
#include <avr/io.h>

#define SIN_DDR DDRC
#define SIN_PORT PORTC
#define SIN_PIN PC4

#define SCLK_DDR DDRC
#define SCLK_PORT PORTC
#define SCLK_PIN PC5

#define BLANK_DDR DDRC
#define BLANK_PORT PORTC
#define BLANK_PIN PC3

#define DCPRG_DDR DDRC
#define DCPRG_PORT PORTC
#define DCPRG_PIN PC2

#define VPRG_DDR DDRC
#define VPRG_PORT PORTC
#define VPRG_PIN PC0

#define XLAT_DDR DDRB
#define XLAT_PORT PORTB
#define XLAT_PIN PB1

#define TLC5940_N 3

#define setOutput(ddr, pin) ((ddr) |= (1 << (pin)))
#define setLow(port, pin) ((port) &= ~(1 << (pin)))
#define setHigh(port, pin) ((port) |= (1 << (pin)))
#define pulse(port, pin) do { \
                         	setHigh((port), (pin)); \
                         	setLow((port), (pin)); \
                         } while (0)
#define outputState(port, pin) ((port) & (1 << (pin)))

#if (12 * TLC5940_N > 255)
#define dcData_t uint16_t
#else
#define dcData_t uint8_t
#endif

#if (24 * TLC5940_N > 255)
#define gsData_t uint16_t
#else
#define gsData_t uint8_t
#endif

#if (16 * TLC5940_N > 255)
#define channel_t uint16_t
#else
#define channel_t uint8_t
#endif

#define dcDataSize ((dcData_t)12 * TLC5940_N)
#define gsDataSize ((gsData_t)24 * TLC5940_N)
#define numChannels ((channel_t)16 * TLC5940_N)

extern uint8_t dcData[dcDataSize];
extern uint8_t gsData[gsDataSize];
extern volatile uint8_t gsUpdateFlag;

static inline void TLC5940_SetGSUpdateFlag(void) {
	__asm__ volatile ("" ::: "memory");
	gsUpdateFlag = 1;
}

void TLC5940_SetDC(channel_t channel, uint8_t value);
void TLC5940_SetAllDC(uint8_t value);
void TLC5940_ClockInDC(void);

void TLC5940_SetGS(channel_t channel, uint16_t value);
void TLC5940_SetAllGS(uint16_t value);
void TLC5940_Init(void);

#define MAX_BRIGHT 2000
#define NUMCHANNELS 37
extern uint8_t indexorden[];
enum orden {
  OUT14=0, OUT35, OUT25, OUT26, OUT29, OUT27, OUT28, OUT13,
  OUT15, OUT16, OUT17, OUT12, OUTN0, OUTN1, OUTN2, OUT34,
  OUT00, OUT01, OUT02, OUT03, OUT04, OUT05, OUT06, OUT07,
  OUT08, OUT18, OUT19, OUT20, OUT21, OUT22, OUT23, OUT24,
  OUT33, OUT11, OUT10, OUT09, OUT32, OUT36, OUT31, OUT30,
//  OUTN3, OUTN4, OUTN5, OUTN6, OUTN7, OUTN8, OUTN9, OUT10,
};
#endif
