#include "board.h"
#include <string.h>

typedef enum
{
    S_MASTER_SEND_ADDR,
    S_MASTER_SEND_CONTROL_BYTE,
    S_MASTER_SEND_DATA,
    S_MASTER_ERROR,
    S_MASTER_DONE
} I2C_MASTER_STATES;

typedef struct
{
  I2C_MASTER_STATES status;
  unsigned char address;
  unsigned char control_byte;
  unsigned char *buffer;
  int length;
} I2C_MASTER_DATA;

char uart_buffer[UART_BUFFER_SIZE];
char *uart_buffer_write_p;

static volatile I2C_MASTER_DATA i2c_data;

void __attribute__ ((interrupt, no_auto_psv)) _T1Interrupt ()
{
  timer_event = 1;
  _T1IF = 0;
}

void __attribute__ ( ( interrupt, no_auto_psv ) ) _U1RXInterrupt(void)
{
  IFS0bits.U1RXIF = 0;
  while(!(U1STAHbits.URXBE == 1))
  {
    *uart_buffer_write_p++ = U1RXREG;
    if (uart_buffer_write_p == uart_buffer + UART_BUFFER_SIZE)
      uart_buffer_write_p = uart_buffer;
  }
}

static int I2C1_CheckACK(void)
{
  if (I2C1STATbits.ACKSTAT)
  {
    I2C1STATbits.ACKSTAT = 0;
    I2C1CONLbits.PEN = 1;
    i2c_data.status = S_MASTER_ERROR;
    return 0;
  }
  return 1;
}

void __attribute__ ( ( interrupt, no_auto_psv ) ) _MI2C1Interrupt ( void )
{
  IFS1bits.MI2C1IF = 0;
  
  if (I2C1STATbits.IWCOL)
  {
    I2C1STATbits.IWCOL = 0;
    i2c_data.status = S_MASTER_ERROR;
  }

  switch (i2c_data.status)
  {
    case S_MASTER_SEND_ADDR:
      I2C1TRN = i2c_data.address;
      i2c_data.status = S_MASTER_SEND_CONTROL_BYTE;
      break;
    case S_MASTER_SEND_CONTROL_BYTE:
      if (!I2C1_CheckACK())
        break;
      I2C1TRN = i2c_data.control_byte;
      i2c_data.status = S_MASTER_SEND_DATA;
      break;
    case S_MASTER_SEND_DATA:
      if (!I2C1_CheckACK())
        break;
      if (!i2c_data.length)
      {
        I2C1CONLbits.PEN = 1;
        i2c_data.status = S_MASTER_DONE;
        break;
      }
      I2C1TRN = *i2c_data.buffer++;
      i2c_data.length--;
      break;
    default:
      break;
  }
}

static void InitPorts (void)
{
  /****************************************************************************
   * Setting the Output Latch SFR(s)
   ***************************************************************************/
  LATA = 0x0000;
  LATB = 0x0000;
#ifdef __dsPIC33CK256MP508__
  LATC = 0x0000;
  LATD = 0x0010;
  LATE = 0x0000;
#else
#ifdef __dsPIC33CK256MP202__
#error Not ready yet
#else
#error Unknown processor type  
#endif
#endif

  /****************************************************************************
   * Setting the GPIO Direction SFR(s)
   ***************************************************************************/
#ifdef __dsPIC33CK256MP508__
  // RB9, RB14 - OUT
  TRISB = 0xBDFF;
  // RD4 - OUT
  TRISD = 0xFFEF;
  // RE5, RE6, RE13, RE14, RE15 - OUT
  TRISE = 0x1F9F;
#endif
#ifdef __dsPIC33CK256MP202__
#error Not ready yet
#endif
  
  __builtin_write_RPCON(0x0000); // unlock PPS
  
#ifdef __dsPIC33CK256MP508__
  RPINR18bits.U1RXR = 0x0043; //RD3->UART1:U1RX;
  RPOR18bits.RP68R = 0x0001;  //RD4->UART1:U1TX;
  
  RPOR4bits.RP41R = 0x0005;  //RB9->SPI1:SDO1;
#endif
#ifdef __dsPIC33CK256MP202__
#error Not ready yet
#endif
  
  __builtin_write_RPCON(0x0800); // lock PPS
}

static void InitDACs (void)
{
  // DAC clock is FVCO/2
  // comparator filter clock divider = 1
  DACCTRL1L = 0x0040;
  // SSTIME: 550ns, 2 ns clock
  DACCTRL2H = 275; //SSTIME 275; 
  // TMODTIME=340ns
  DACCTRL2L = 170; //TMODTIME 170; 

  DACCTRL1Lbits.DACON = 1;
}

static void InitDAC1 (void)
{
  DAC1CONH = 0x0; //TMCB 0; 
  // DAC1 Enabled
  // DAC output is not connected to DACOUT1
  // Comparator output is not inverted
  // Comparator input source = CMP1D
  // 45mv hysteresis
  DAC1CONL = 0x801B;

  set_h_voltage(DEFAULT_DACH_VOLTAGE);
}

static void InitDAC2 (void)
{
  DAC2CONH = 0x0; //TMCB 0; 
  // DAC2 Enabled
  // DAC output is not connected to DACOUT1
  // Comparator output is inverted
  // Comparator input source = CMP1D
  // 45mv hysteresis
  DAC2CONL = 0x805B;

  set_l_voltage(DEFAULT_DACL_VOLTAGE);
}

static void InitDAC3 (void)
{
  DAC3CONH = 0x0; //TMCB 0; 
  // DAC3 Enabled
  // DAC output is connected to DACOUT1
  DAC3CONL = 0x8200;

  set_dac_voltage(DEFAULT_DACL_VOLTAGE);
}

static void InitADC (void)
{
  //todo
}

static void InitClock (void)
{
  //FVCO = 800 MHz, FP = 100 MHz
  // Configure PLL prescaler, both PLL postscalers, and PLL feedback divider
  CLKDIVbits.PLLPRE = 1; // N1=1
  PLLFBDbits.PLLFBDIV = 100; // M = 100
  PLLDIVbits.POST1DIV = 2; // N2=2
  PLLDIVbits.POST2DIV = 1; // N3=1
  // Initiate Clock Switch to FRC with PLL (NOSC=0b001)
  __builtin_write_OSCCONH(0x01);
  __builtin_write_OSCCONL(OSCCON | 0x01);
  // Wait for Clock switch to occur
  while (OSCCONbits.OSWEN!= 0)
    ;

  // Select internal FRC as the clock source
  ACLKCON1bits.FRCSEL = 1;
  // Configure the APLL prescaler, APLL feedback divider, and both APLL postscalers.
  ACLKCON1bits.APLLPRE = 1; // N1 = 1
  APLLFBD1bits.APLLFBDIV = 125; // M = 125
  APLLDIV1bits.APOST1DIV = 2; // N2 = 2
  APLLDIV1bits.APOST2DIV = 1; // N3 = 1
  // Enable APLL
  ACLKCON1bits.APLLEN = 1;

  // reference clock is enabled, source is FVCO/4
  //REFOCONL = 0x8006;
}

static void InitTimer1 (void)
{
  //TMR1 0; 
  TMR1 = 0x00;
  //Period = 8us. Frequency = 125000 Hz;
  PR1 = 125 * T1_INTERRUPT_MS;
  //Timer 1 clock source - external clock
  //Prescaler = 256
  //External clock source = FRC
  //Timer1 is ON
  T1CON = 0x0322;
  //    TI: T1 - Timer1
  //    Priority: 1
  IPC0bits.T1IP = 1;
  // init the Timer 1 Interrupt
  IEC0bits.T1IE = 1;
}

static void InitI2C (void)
{
    // initialize the hardware
    // Baud Rate Generator Value: I2CBRG 62;
    I2C1BRG = FP_FREQUENCY / 2 / 200000;
    // ACKEN disabled; STRICT disabled; STREN disabled; GCEN disabled; SMEN disabled; DISSLW enabled; I2CSIDL disabled; ACKDT Sends ACK; SCLREL Holds;
    I2C1CONL = 0x8000;
    // BCL disabled; P disabled; S disabled; I2COV disabled; IWCOL disabled; 
    I2C1STAT = 0x00;

    /* I2C1 Master Event */
    // clear the master interrupt flag
    IFS1bits.MI2C1IF = 0;
    // enable the master interrupt
    IEC1bits.MI2C1IE = 1;
}

static void InitUART (void)
{
  //Mode = Asynchronous 8-bit UART
  //Autobaud disabled
  //Baudrate is baudclk / 4
  U1MODE = 0x80;
  // Baud clock source = FOSC
  U1MODEH = 0x0400;
  U1STA = 0;
  // Reset RX/TX FIFOs
  U1STAH = 0x22;
  // BaudRate 115740; Frequency 50,000,000 Hz; BRG 108;
  U1BRG = FOSC_FREQUENCY / 4 / UART_BAUD_RATE;
  // BRG 0; 
  U1BRGH = 0;

  U1MODEbits.UARTEN = 1; // enabling UART ON bit
  // UART Receive Interrupt
  IEC0bits.U1RXIE = 1;
}

static void InitSPI (void)
{
  // Host mode
  // SDI input is disabled
  // SCK output is disabled
  // Enhanced buffer mode is enabled
  // 8 bit communication
  SPI1CON1L = 0x0039;
  
  SPI1BRGL = FP_FREQUENCY / 2500000 / 2 - 1;
  
  // SPI enable
  SPI1CON1Lbits.SPIEN = 1;
}

static void InitSCCP(void)
{
  // Asynchronous module time base clock is selected
  // clock is FP
  // 32 bit time base
  // 32 bit timer mode
  CCP1CON1L = 0x0020;
  // comparator 1 output as gate
  CCP1CON2L = 0x0001;

  CCP2CON1L = 0x0020;
  // comparator 2 output as gate
  CCP2CON2L = 0x0002;

  CCP3CON1L = 0x0020;
  // CLC1 output as gate
  CCP3CON2L = 0x0020;

  //CLC2 as clock source
  CCP4CON1L = 0x0C20;
}

static void InitCLC(void)
{
  // MUX3 output is comparator 2 output
  // MUX2 output is comparator 1 output
  CLC1SEL = 0x0220;
  // gate 1 data source 2 true enable
  // gate 2 data source 2 true enable
  CLC1GLSL = 0x0808;
  // gate 3 data source 3 true enable
  // gate 4 data source 3 true enable
  CLC1GLSH = 0x2020;
  //CLC1 is enabled
  //the output of the module is inverted
  // mode is four input and-or
  CLC1CONL = 0x8020;

  // MUX3 output is comparator 2 output
  // MUX2 output is comparator 1 output
  CLC2SEL = 0x0220;
  // gate 2 data source 2 true enable
  CLC2GLSL = 0x0008;
  // gate 3 data source 3 true enable
  CLC2GLSH = 0x0020;
  //CLC2 is enabled
  //the output of the module is not inverted
  // mode is sr latch
  CLC2CONL = 0x8003;
}

static void InitPWM(void)
{
  //AFVCO/2 as clock source
  PCLKCON = 1;
  // PWM generator uses master clock selected by PCLKCON[1:0]
  PG1CONL = 8;
  PG1PER = 500000000/10000;
  PG1DC = 500000000/10000 / 2;
  //PWM1H output is enabled
  PG1IOCONH = 8;
}

void SystemInit (void)
{
  uart_buffer_write_p = uart_buffer;
  i2c_data.status = S_MASTER_DONE;
  i2c_data.address = SSD1306_I2C_ADDRESS;
  
  InitClock ();
  InitADC ();
  InitDACs ();
  InitDAC1 ();
  InitDAC2 ();
  InitDAC3 ();
  InitI2C ();
  InitTimer1 ();
  InitUART ();
  InitSPI ();
  InitCLC ();
  InitSCCP ();
  InitPWM ();
  InitPorts ();
}

void UART1_Transmit(unsigned char txData)
{
    while(U1STAHbits.UTXBF == 1)
      ;

    U1TXREG = txData;    // Write the data byte to the USART.
}

void delayms(unsigned int ms)
{
  timer_event = 0;
  T1CONbits.TON = 1;
  while (!timer_event)
    Idle();
  T1CONbits.TON = 0;
}

void set_h_voltage(unsigned int value)
{
  DAC1DATH = mv_to_12(value);
}

void set_l_voltage(unsigned int value)
{
  DAC2DATH = mv_to_12(value);
}

unsigned int get_l_voltage(void)
{
  return mv_from_12(DAC2DATH);
}

unsigned int get_h_voltage(void)
{
  return mv_from_12(DAC1DATH);
}

void set_dac_voltage(unsigned int value)
{
  DAC3DATH = mv_to_12(value);
}

unsigned int get_dac_voltage(void)
{
  return mv_from_12(DAC3DATH);
}

void stop_counters(void)
{
  T1CONbits.TON = 0;
  CCP1CON1Lbits.CCPON = 0;
  CCP2CON1Lbits.CCPON = 0;
  CCP3CON1Lbits.CCPON = 0;
  CCP4CON1Lbits.CCPON = 0;
}

void start_counters(void)
{
  TMR1 = 0;
  CCP1TMRL = 0;
  CCP1TMRH = 0;
  CCP2TMRL = 0;
  CCP2TMRH = 0;
  CCP3TMRL = 0;
  CCP3TMRH = 0;
  CCP4TMRL = 0;
  CCP4TMRH = 0;
  T1CONbits.TON = 1;
  CCP1CON1Lbits.CCPON = 1;
  CCP2CON1Lbits.CCPON = 1;
  CCP3CON1Lbits.CCPON = 1;
  CCP4CON1Lbits.CCPON = 1;
}

void pwm_set_frequency_and_duty(unsigned int frequency, unsigned int duty)
{
}

void adc_start(void)
{
}

unsigned int get_adc_voltage(void)
{
  return 0;
}

void connect_pullup(void)
{
}

void disconnect_pullup(void)
{
}

void SPI1_Write(const unsigned char *data, unsigned int length)
{   
  while (length)
  {
      if (!SPI1STATLbits.SPITBF)
      {
          SPI1BUFL = *data++;
          length--;
      }
  }
}

void ws2812_spi_send(int channel, const unsigned char *data, unsigned int count)
{
  SPI1_Write(data, count);
}

int SSD1306_I2C_Write(int num_bytes, unsigned char control_byte, unsigned char *buffer)
{
  static unsigned char buffer_copy[16];

  while ((i2c_data.status != S_MASTER_DONE) && (i2c_data.status != S_MASTER_ERROR))
    Idle();
  while (I2C1STATbits.TRSTAT | I2C1CONLbits.PEN)
    ;
  
  memcpy(buffer_copy, buffer, num_bytes);
  
  //send start condition
  i2c_data.control_byte = control_byte;
  i2c_data.length = num_bytes;
  i2c_data.buffer = buffer_copy;
  i2c_data.status = S_MASTER_SEND_ADDR;
  I2C1CONLbits.SEN = 1;
  return 0;
}
