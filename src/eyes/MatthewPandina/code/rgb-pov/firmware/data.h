#include <stdint.h>
#include <avr/pgmspace.h>

extern uint16_t pov_width;
extern uint16_t pov_height;

extern uint8_t pov[][TLC5940_MULTIPLEX_N][24 * TLC5940_N] PROGMEM;
