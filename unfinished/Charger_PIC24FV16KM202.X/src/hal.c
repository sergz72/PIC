#include "board.h"
#include <string.h>

#define ADC0_VREF 2500
#define DAC0_VREF 2500
#define DAC1_VREF 1100

#define BAK_BUTTON_PIN_POS (1<<BAK_BUTTON_PIN)
#define PSH_BUTTON_PIN_POS (1<<PSH_BUTTON_PIN)
#define TRA_PIN_POS (1<<TRA_PIN)
#define TRB_PIN_POS (1<<TRB_PIN)

static volatile int encoder_counter, exit_counter, keyboard_state;
static unsigned long ref;
static int set_current_value;

void delayms(unsigned int ms)
{
  //todo
}

int SSD1306_I2C_Write(int num_bytes, unsigned char control_byte, unsigned char *buffer)
{
  //todo
  return 0;
}

void save_data(void *p, unsigned int size)
{
  //todo
}

void load_data(void *p, unsigned int size)
{
  //todo
}

/*
 *todo
 */

static unsigned long adc_get(unsigned int ain)
{
  //todo
  return 0;
}

/*static unsigned int get_mv(unsigned int ain)
{
    ref = adc_get(ADC_MUXPOS_INTREF_gc);
    unsigned long val = adc_get(ain);
    return (unsigned int)(ADC0_VREF * val / ref);
}*/

unsigned int get_voltage(void)
{
  //todo
  return 0; //get_mv(ADC_MUXPOS_AIN5_gc);
}

void set_current(int mA)
{
    set_current_value = mA;
    //todo
}

static int get_current_hi(void)
{
  //todo
  return 0;
}

static int get_current_lo(void)
{
  //todo
  return 0;
}

int get_current(void)
{
    if (set_current_value == 0)
        return 0;
    if (set_current_value > 0) // charge
        return get_current_hi();
    return -get_current_lo();
}

int get_keyboard_status(void)
{
  //todo
  /*if (!(BAK_BUTTON_PORT.IN & BAK_BUTTON_PIN_POS))
  {
      exit_counter++;
      return 0;
  }*/
  if (exit_counter)
  {
      int status = exit_counter > 2 ? KB_EXIT_LONG : KB_EXIT;
      exit_counter = 0;
      keyboard_state = 0;
      return status;
  }
  if (keyboard_state)
  {
      int status = keyboard_state;
      keyboard_state = 0;
      return status;
  }
  if (encoder_counter)
  {
      //cli();
      int cnt = encoder_counter;
      encoder_counter = 0;
      //sei();
      return KB_ENCODER | (cnt << 4);
  }
  return 0;
}

static void InitPorts(void)
{
  //todo
}

static void InitDAC0(void)
{
  //todo
}

static void InitDAC1(void)
{
  //todo
}

static void InitADC(void)
{
  //todo
}

static void InitOpAmp1(void)
{
  //todo
}

static void InitOpAmp2(void)
{
  //todo
}

static void InitI2C(void)
{
  //todo
}

void SystemInit(void)
{
    //delay = 0;
    encoder_counter = 0;
    exit_counter = 0;
    keyboard_state = 0;
    
    InitPorts();
    InitADC();
    InitDAC0();
    InitDAC1();
    InitOpAmp1();
    InitOpAmp2();
    InitI2C();
}
