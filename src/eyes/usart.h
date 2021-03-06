#ifndef _USART_H_
#define _USART_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

#define BAUD_PRESCALER(baudrate)    (unsigned int)( (F_CPU / (baudrate * 16.0)) - 0.5 )

#define TX_BUFF_SIZE				64
#define RX_BUFF_SIZE				64

#define USART_MODE_ASYNC	  0 // Operacion Asincronica (Asyncronous)
#define USART_MODE_SYNC		  1 // Operacion Sincronica (Syncronous)

#define USART_PARITY_DIS			0 // Parity mode disable
#define USART_PARITY_EVE			2 // Parity mode even (par)
#define USART_PARITY_ODD			3 // Parity mode odd (impar)

#define USART_STOP_1BIT			0 // Bit de parada (1-bit)
#define USART_STOP_2BIT			1 // Bit de parada (2-bits)

#define USART_CHARSIZE_5BIT		0 
#define USART_CHARSIZE_6BIT		1 // Con estas macros podemos setear
#define USART_CHARSIZE_7BIT		2 // el largo de los "bytes" que
#define USART_CHARSIZE_8BIT		3 // serán transmitidos por el serial
#define USART_CHARSIZE_9BIT		7 


#define USART_BAUDRATE_115200   BAUD_PRESCALER(115200)
#define USART_BAUDRATE_9600     BAUD_PRESCALER(9600)

//#define USART0_INTERRUPT  // Comentar para deshabilitar USART por interrupcion


/* ============================================== */
/* Prototipos                                     */
/* ============================================== */

void USART0Setup(uint16_t baudrate, uint8_t char_size, uint8_t parity, uint8_t stop_bit, uint8_t mode);

unsigned char  USART0Receive(void);
void           USART0Transmit(char);

void           USART0Puts(char*);
void           USART0PutsP(char*);
void           USART0Putc(char);

unsigned char USART0TXBuffLen(void);
unsigned char USART0RXBuffLen(void);

#define IsNewRxData() IsBitSet(UCSR0A,RXC0)

#endif // _USART_H_
