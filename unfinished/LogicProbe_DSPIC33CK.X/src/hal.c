#include "board.h"
#include <string.h>
#include <spi_lcd_common.h>

char uart_buffer[UART_BUFFER_SIZE];
char *uart_buffer_write_p;

static unsigned int prev_flags = LCD_FLAG_CS;

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

static void InitPorts (void)
{
  /****************************************************************************
   * Setting the Output Latch SFR(s)
   ***************************************************************************/
#ifdef __dsPIC33CK256MP508__
  LATA = 0x0000;
  // CS is high
  LATB = 0x0200;
  LATC = 0x0000;
  // TXD is high
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
  // RB9(CS), RB14 (PWM) - OUT
  TRISB = 0xBDFF;
  // RD2 (DC), RD4 (UART_TX), RD6(SCK), RD7 (SDO), RD8(RES) - OUT
  TRISD = 0xFE2B;
  // RE5(LED2), RE6(LED1), RE13(LED_B), RE14(LED_G), RE15(LED_R) - OUT
  TRISE = 0x1F9F;
#endif
#ifdef __dsPIC33CK256MP202__
#error Not ready yet
#endif
  
  __builtin_write_RPCON(0x0000); // unlock PPS
  
#ifdef __dsPIC33CK256MP508__
  RPINR18bits.U1RXR = 0x0043; //RD3->UART1:U1RX;
  RPOR18bits.RP68R = 0x0001;  //RD4->UART1:U1TX;
  
  RPOR19bits.RP70R = 0x0006;  //RD6->SPI1:SCK;
  RPOR19bits.RP71R = 0x0005;  //RD7->SPI1:SDO;
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
  // Enhanced buffer mode is enabled
  // 8 bit communication
  // Transmit happens on transition from active clock state to Idle clock state
  // Idle state for clock is a low level; active state is a high level
  SPI1CON1L = 0x0131;
  
  SPI1BRGL = FP_FREQUENCY / 5000000 / 2 - 1;
  
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

//RB14 - PWM out
static void InitPWM(void)
{
  //AFVCO/2 as clock source
  PCLKCON = 1;
  // PWM generator uses master clock selected by PCLKCON[1:0]
  PG1CONL = 8;
  //PWM1H output is enabled
  PG1IOCONH = 8;
  pwm_set_frequency_and_duty(10000, 50);
}

void SystemInit (void)
{
  uart_buffer_write_p = uart_buffer;
  
  InitClock ();
  InitADC ();
  InitDACs ();
  InitDAC1 ();
  InitDAC2 ();
  InitDAC3 ();
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
  ms /= 100;
  T1CONbits.TON = 1;
  while (ms--)
  {
    while (!timer_event)
      Idle();
    timer_event = 0;
  }
  T1CONbits.TON = 0;
}

void delay(unsigned int us)
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
  T1CONbits.TON = 1;
  CCP1CON1Lbits.CCPON = 1;
  CCP2CON1Lbits.CCPON = 1;
  CCP3CON1Lbits.CCPON = 1;
  CCP4CON1Lbits.CCPON = 1;
}

void pwm_set_frequency_and_duty(unsigned long frequency, unsigned int duty)
{
  PG1CONLbits.ON = 0;
  unsigned long period = ((unsigned long)PWM_CLOCK)/frequency;
  if (period < 0x10)
    period = 0x10;
  if (period > 65535)
    period = 65535;
  unsigned long lduty = period * duty / 100;
  PG1PER = (unsigned int)period - 1;
  PG1DC = (unsigned int)lduty;
  PG1CONLbits.ON = 1;
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

void Lcd_WriteBytes(unsigned int flags, unsigned char *data, unsigned int size)
{
  if (prev_flags != flags)
  {
    prev_flags = flags;
    if (flags & LCD_FLAG_DC)
      LCD_DC_PIN_SET;
    else
      LCD_DC_PIN_CLR;
    if (flags & LCD_FLAG_CS)
    {
      LCD_CS_PIN_SET;
      return;
    }
    LCD_CS_PIN_CLR;
  }
  while (size)
  {
    if (!SPI1STATLbits.SPITBF)
    {
      SPI1BUFL = *data++;
      size--;
    }
  }
  while (SPI1STATLbits.SPIBUSY)
    ;
}

void Lcd_WriteColor(unsigned int color, unsigned int count)
{
  prev_flags = LCD_FLAG_DC;
  LCD_DC_PIN_SET;
  unsigned char c1 = (unsigned char)color;
  unsigned char c2 = (unsigned char)(color >> 8);
  while (count--)
  {
    while (SPI1STATLbits.SPITBF)
      ;
    SPI1BUFL = c1;
    while (SPI1STATLbits.SPITBF)
      ;
    SPI1BUFL = c2;
  }
  while (SPI1STATLbits.SPIBUSY)
    ;
}
