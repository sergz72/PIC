#include "board.h"
#include <string.h>
#include <xc.h>
#include "i2c1.h"

volatile unsigned char delay_counter;

volatile char encoder_counter, exit_counter, keyboard_state;
static unsigned long ref;
static int set_current_value;

void delayms(unsigned int ms)
{
    unsigned char value = (unsigned char)(ms / TIMER0_INTERRUPT_MS + 1);
    
    while (delay_counter <= value)
        SLEEP();
}

int SSD1306_I2C_Write(int num_bytes, unsigned char control_byte, unsigned char *buffer)
{
  static unsigned char twi_buffer[130];

  twi_buffer[0] = control_byte;
  memcpy(twi_buffer + 1, buffer, num_bytes);
  I2C1_Write(SSD1306_I2C_ADDRESS >> 1, twi_buffer, num_bytes + 1);
  while (I2C1_IsBusy())
      SLEEP();
  
  return I2C1_ErrorGet();
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

char get_keyboard_status(void)
{
  //todo
  if (!(BAK_BUTTON_PORT & BAK_BUTTON_PIN_POS))
  {
      exit_counter++;
      return 0;
  }
  if (exit_counter)
  {
      char status = exit_counter > 2 ? KB_EXIT_LONG : KB_EXIT;
      exit_counter = 0;
      keyboard_state = 0;
      return status;
  }
  if (keyboard_state)
  {
      char status = keyboard_state;
      keyboard_state = 0;
      return status;
  }
  if (encoder_counter)
  {
      di();
      char cnt = encoder_counter;
      encoder_counter = 0;
      ei();
      return KB_ENCODER | (cnt << 4);
  }
  return 0;
}

/*
 * RA0 - CON
 * RA1 - OPA1OUT
 * RA2 - OPA1IN0-
 * RA3 - PSH
 * RA4 - TRA
 * RA5 - TRB
 * RA6
 * RA7 - BAK
 * 
 * RB0
 * RB1 - OPA2OUT
 * RB2 - OPA2IN3-
 * RB3 - ANB3
 * RB4
 * RB5
 * RB6 - ICSPCLK
 * RB7 - ICSPDAT
 * 
 * RC0
 * RC1
 * RC2
 * RC3 - SCL1
 * RC4 - SDA1
 * RC5 - LED1
 * RC6 - LED2
 * RC7 - LED3
 * 
 */

static void InitPorts(void)
{
    LATA = 0;
    LATB = 0;
    LATC = 0x18;
    
    ODCONC = 0x18;
    
    //RC3,RC4,RC5,RC6,RC7 - out
    TRISC = 0x07;

    ANSELA = 0x06;
    ANSELB = 0xCE;
    ANSELC = 0;
    
    WPUA = 0x40; // RA6
    WPUB = 0x31; // RB0, RB4, RB5
    WPUC = 0;

    // RA5 - TRB
    IOCAN = (1 << TRB_PIN);

    // Enable PIE0bits.IOCIE interrupt 
    PIE0bits.IOCIE = 1;
    
    /**
    PPS registers
    */
    I2C1SCLPPS = 0x13;  //RC3->I2C1:SCL1;
    RC3PPS = 0x20;  //RC3->I2C1:SCL1;
    I2C1SDAPPS = 0x14;  //RC4->I2C1:SDA1;
    RC4PPS = 0x21;  //RC4->I2C1:SDA1;
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

static void InitClock(void)
{
    OSCFRQ = (5 << _OSCFRQ_HFFRQ_POSN);  // HFFRQ 16_MHz
    OSCCON1 = (0 << _OSCCON1_NDIV_POSN)   // NDIV 1
            | (6 << _OSCCON1_NOSC_POSN);  // NOSC HFINTOSC
}

static void InitTimer0(void)
{
    // clock source - LFINTOSC, prescaler = 2, T0ASYNC not_synchronised
    T0CON1 = 0x91;
    
    //Clear Interrupt flag before enabling the interrupt
    PIR3bits.TMR0IF = 0;

    //Enable TMR0 interrupt.
    PIE3bits.TMR0IE = 1;
    
    // timer is enabled, TMR0 is 8 bit
    T0CON0 = 0x80;
}

void SystemInit(void)
{
    InitClock();
    
    encoder_counter = 0;
    exit_counter = 0;
    keyboard_state = 0;
    delay_counter = 0;
    
    InitADC();
    InitDAC0();
    InitDAC1();
    InitOpAmp1();
    InitOpAmp2();
    InitPorts();
    I2C1_Initialize();
    InitTimer0();
    
    CPUDOZE |= _CPUDOZE_IDLEN_MASK;
}
