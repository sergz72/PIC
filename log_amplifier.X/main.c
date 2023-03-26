#include <xc.h>

#define ADDRESS 2

#define I2C_READ_DATA  0
#define I2C_WRITE_DATA 1

#define DATA_SIZE 4

#define LOG_AMPLIFIER_TYPE 0
#define ADC_BITS 10
#define VREF 3300

#define LED_TOGGLE PORTAbits.RA4 = !PORTAbits.RA4
#define LED_ON     PORTAbits.RA4 = 0
#define LED_OFF    PORTAbits.RA4 = 1

//                         PIC12LF1552
//                     -------------------
//                     |                 |
//                [VDD]|1               8|[VSS]
//                     |                 |
// Analog in->[AN4/RA5]|2               7|[ICSPDAT]
//                     |                 |
//          LED-> [RA4]|3               6|[ICSPCLK/SCL] <--- SCL
//                     |                 |
//           [MCLR/VPP]|4               5|[RA2] <--> SDA
//                     |                 |
//                     -------------------

// Configuration Bits
#pragma config CLKOUTEN = OFF    // Clock Out Enable->CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin
#pragma config BOREN    = ON     // Brown-out Reset Enable->Brown-out Reset enabled
#pragma config CP       = OFF    // Flash Program Memory Code Protection->Program memory code protection is disabled
#pragma config MCLRE    = ON     // MCLR Pin Function Select->MCLR/VPP pin function is MCLR
#pragma config PWRTE    = ON     // Power-up Timer Enable->PWRT enabled
#pragma config WDTE     = OFF    // Watchdog Timer Enable->WDT disabled
#pragma config FOSC     = INTOSC // Oscillator Selection->INTOSC oscillator: I/O function on CLKIN pin
#pragma config LVP      = ON     // Low-Voltage Programming Enable->High-voltage on MCLR/VPP must be used for programming
#pragma config LPBOR    = OFF    // Low-Power BOR Disabled
#pragma config BORV     = HI     // Brown-out Reset Voltage Selection->Brown-out Reset Voltage (Vbor), high trip point selected.
#pragma config STVREN   = ON     // Stack Overflow/Underflow Reset Enable->Stack Overflow or Underflow will cause a Reset
#pragma config WRT      = OFF    // Flash Memory Self-Write Protection->Write protection off

static __bit i2c_started;
static unsigned char *data_p, data[DATA_SIZE];

static inline void StartADC(void)
{
  ADCON0bits.ADGO = 1;
}

void __interrupt() ISR(void)
{
  volatile unsigned char buf;
  
  SSP1IF = 0; // Clear Interrupt Flag
  //LED_TOGGLE;
  LED_ON;
  
  if (BF)
    buf = SSP1BUF;
  
  if (i2c_started)
  {
    if (SSPSTATbits.P)
      i2c_started = 0;
    else
    {
      // Last byte received is a data
      if (D_nA)
      {
        if (R_nW)
          SSP1BUF = *data_p++;
      }
      // Last byte received is an address
      else
      {
        data_p = data;
        if (R_nW)
          SSP1BUF = ADRESL;
        data[0] = ADRESH;
      }
      CKP = 1;
    }
  }
  else
  {
    if (SSPSTATbits.S)
    {
      i2c_started = 1;
      StartADC();
    }
  }
  LED_OFF;
}

static inline void InitOsc(void)
{
  OSCCON = 0b010110000; // 1 MHZ Osc
}

static inline void InitPorts(void)
{
  PORTA      = 0b00010000; // RA4 -> 1
  ANSELA     = 0b00100000; // RA5 -> Analog
  TRISA      = 0b00101111; // RA4 -> Output
  OPTION_REG = 0b01111111; // Weak pull-ups are enabled by individual WPUx latch values
  WPUA       = 0b11001111; // RA4,RA5 -> No pull up
}

static inline void InitI2C(void)
{
  SSP1STAT    = 0;
  SSP1CON1    = 0b00111110; // SSPEN enabled; WCOL no_collision; SSPOV no_overflow; CKP enable clock; SSPM I2CSlave_7bit with start/stop interrupt enabled
  SSP1CON2    = 0b00000001; // ACKSTAT received; RCEN disabled; RSEN disabled; ACKEN disabled; ACKDT acknowledge; SEN enabled; GCEN disabled; PEN disabled
  SSP1CON3    = 0b01100000; // Stop Condition Interrupt Enabled; Start Condition Interrupt Enabled
  SSP1MSK     = 0b11111111;
  SSP1ADD     = ADDRESS << 1;
  SSP1IF      = 0;

  i2c_started = 0;
  data[1] = (LOG_AMPLIFIER_TYPE << 4) | ADC_BITS;
  data[2] = VREF & 0xFF;
  data[3] = VREF >> 8;

  SSP1IE      = 1;
}

static inline void InitADC(void)
{
  ADCON0 = 0b00010001; // AN4 channel; ADC is enabled
  ADCON1 = 0b10000000; // Right justified; A/D Conversion Clock - FOSC/2; VREF is connected to VDD
}

static inline void InitIntr(void)
{
  INTCON = 0b11000000; // Enables all active interrupts; Enables all active peripheral interrupts
}

int main(void)
{
  InitOsc();   // Initialize the Internal Oscillator
  InitPorts(); // Initialize the ports of the chip
  InitI2C();   // Initialize I2C
  InitADC();   // ADC init
  InitIntr();  // Initialize interrupts
  while (1)
    SLEEP();
}
