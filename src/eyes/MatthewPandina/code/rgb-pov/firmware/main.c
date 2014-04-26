#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>

#include "tlc5940.h"
#include "data.h"

int main(void) {
  // Set multiplex pins as outputs
  setOutput(MULTIPLEX_DDR, R_PIN);
  setOutput(MULTIPLEX_DDR, G_PIN);
  setOutput(MULTIPLEX_DDR, B_PIN);

  // Turn all multiplexing MOSFETs off
  setHigh(MULTIPLEX_PORT, R_PIN);
  setHigh(MULTIPLEX_PORT, G_PIN);
  setHigh(MULTIPLEX_PORT, B_PIN);

  // Set the order in which the multiplexing MOSFETs will be toggled
  toggleRows[0] = (1 << B_PIN) | (1 << R_PIN); // blue off, red on
  toggleRows[1] = (1 << R_PIN) | (1 << G_PIN); // red off, green on
  toggleRows[2] = (1 << G_PIN) | (1 << B_PIN); // green off, blue on

  TLC5940_Init();

#if (TLC5940_MANUAL_DC_FUNCS)
  TLC5940_SetAllDC(2);
  TLC5940_ClockInDC();
#endif

  // Default all channels to off
  memset((void*)pBack, 0, sizeof(gsData)); // write to back-buffer

  // Manually clock in last set of values to be multiplexed
  TLC5940_ClockInGS();

  // Turn on the last multiplexing MOSFET (so the toggle function works)
  setLow(MULTIPLEX_PORT, B_PIN);

  // Enable Global Interrupts
  sei();

  for (;;) {
    for (uint8_t w = 0; w < pov_width; w++) {
      while(gsUpdateFlag); // wait until we can modify the back-buffer
      memcpy_P((void*)pBack, &pov[w], sizeof(gsData));
      TLC5940_SetGSUpdateFlag(); // signal the ISR that we want to page-flip
      //_delay_ms(2);
    }

    while(gsUpdateFlag);
    memset((void*)pBack, 0, sizeof(gsData));
    TLC5940_SetGSUpdateFlag();
    _delay_ms(2);
  }

  return 0;
}
