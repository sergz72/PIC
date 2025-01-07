#ifndef OVENCONTROLUI_BOARD_H
#define OVENCONTROLUI_BOARD_H

#ifndef NULL
#define NULL 0
#endif

#define SSD1306_128_64
#define LCD_ORIENTATION LCD_ORIENTATION_LANDSCAPE

#include <lcd_ssd1306.h>

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

#define ZOOM 4

#define TIMER_DELAY 250

void delayms(unsigned int ms);
void SystemInit(void);
signed char get_keyboard_status(void);
int get_lcd_buffer_bit(int x, int y);
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
