#ifndef OVENCONTROLUI_BOARD_H
#define OVENCONTROLUI_BOARD_H

#ifndef NULL
#define NULL 0
#endif

#define SSD1306_128_64
#define LCD_ORIENTATION LCD_ORIENTATION_LANDSCAPE

#include <lcd_ssd1306.h>

#define SSD1306_SWITCHCAPVCC
#define SH1106

#define LCD_PRINTF_BUFFER_LENGTH 30
#define DRAW_TEXT_MAX 20
#define USE_VSNPRINTF

#define KB_ENCODER 1
#define KB_SELECT 2
#define KB_EXIT 3
#define KB_ENTER 4
#define KB_EXIT_LONG 5

#define MAX_PROGRAM_ITEMS 5
#define MAX_PROGRAMS 4
#define MAX_CURRENT 2000
#define MAX_VOLTAGE 5000

#define T1_INTERRUPT_MS 16
#define TIMER_DELAY 250

#define BAK_BUTTON_PORT PORTA
#define BAK_BUTTON_PIN 4
#define PSH_BUTTON_PORT PORTA
#define PSH_BUTTON_PIN 2
#define CON_BUTTON_PORT PORTA
#define CON_BUTTON_PIN 1
#define TRA_PORT PORTA
#define TRA_PIN 3
#define TRB_CNEN CNEN1
#define TRB_CNEN_VALUE 0x2000

#define BAK_BUTTON_PIN_POS (1<<BAK_BUTTON_PIN)

#define LED1_TOGGLE LATBbits.LATB13 ^= 1
#define LED2_ON LATBbits.LATB12 = 1
#define LED2_OFF LATBbits.LATB12 = 0
#define LED3_ON LATBbits.LATB11 = 1
#define LED3_OFF LATBbits.LATB11 = 0
#define LED4_ON LATBbits.LATB10 = 1
#define LED4_OFF LATBbits.LATB10 = 0

extern volatile unsigned int delay_counter;

void delayms(unsigned int ms);
void SystemInit(void);
int get_keyboard_status(void);
unsigned int get_voltage(void);
void set_current(int mA);
int get_current(void);
int save_data(unsigned char offset, void *p, unsigned int size);
void load_data(unsigned char offset, void *p, unsigned int size);
void set_opamp1_offset(unsigned char offset);
unsigned char get_opamp1_offset(void);
void set_opamp2_offset(unsigned char offset);
unsigned char get_opamp2_offset(void);
int save_offsets(void);
void enable_opamp1(void);
void disable_opamp1(void);
void enable_opamp2(void);
void disable_opamp2(void);

#endif
