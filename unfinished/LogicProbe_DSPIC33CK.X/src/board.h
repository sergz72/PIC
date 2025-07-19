#ifndef _BOARD_H
#define _BOARD_H

#ifndef NULL
#define NULL 0
#endif

#include <board_common.h>
#include <xc.h>

// 8MHz oscillator: RB0

//LEDs:
//LED1 yellow: RE6
//LED2 yellow: RE5
//RGB led:
//R: RE15
//G: RE14
//B: RE13
#define LED_ON LATEbits.LATE6 = 1
#define LED_OFF LATEbits.LATE6 = 0
#define LED2_ON LATEbits.LATE5 = 1
#define LED2_OFF LATEbits.LATE5 = 0

//UART:
//TX: RD4
//RX: RD3
#define UART_BUFFER_SIZE 256
#define UART_BAUD_RATE   115200

// VREF: 1.65v

//Potentiometer: RE3
//VBus: RE1

// Buttons: RE7, RE8, RE9
#define BUTTON1_PORT PORTE
#define BUTTON1_PIN 7
#define BUTTON2_PORT PORTE
#define BUTTON2_PIN 8
#define BUTTON3_PORT PORTE
#define BUTTON3_PIN 9
#define BUTTON1_PIN_POS (1<<BUTTON1_PIN)
#define BUTTON2_PIN_POS (1<<BUTTON2_PIN)
#define BUTTON3_PIN_POS (1<<BUTTON3_PIN)

#define KB_NONE    0
#define KB_BUTTON1 1
#define KB_BUTTON2 2
#define KB_BUTTON3 3

#define T1_INTERRUPT_MS 100

#define FP_FREQUENCY   25000000
#define FOSC_FREQUENCY 50000000

#define DAC_REFERENCE_VOLTAGE 3300

#define COUNTERS_MAX 366

#define WS2812_MAX_VALUE 0x40

#define RAMFUNC
#define WEAK __attribute__ ((weak))

#define BUTTON1_PRESSED (!(BUTTON1_PORT & BUTTON1_PIN_POS))
#define BUTTON2_PRESSED (!(BUTTON2_PORT & BUTTON2_PIN_POS))

#define __WFI() Idle()

#define SYSTEM_INIT SystemInit

#define DAC3_PRESENT

#define I2C_TIMEOUT 1000000
#define SPI_TIMEOUT 1000000

#define SSD1306_128_32
#define LCD_ORIENTATION LCD_ORIENTATION_LANDSCAPE_REVERSED

#include <lcd_ssd1306.h>

#define SSD1306_SEGREMAP_COMMAND SSD1306_SEGREMAP
#define SSD1306_COMSCAN_COMMAND SSD1306_COMSCANINC

extern char uart_buffer[UART_BUFFER_SIZE];
extern char *uart_buffer_write_p;

void SystemInit(void);
void UART1_Transmit(unsigned char txData);
void delayms(unsigned int ms);

#endif
