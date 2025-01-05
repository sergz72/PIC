#include "board.h"
#include <string.h>
#include <xc.h>

#define ADC0_VREF 2500
#define DAC0_VREF 2500
#define DAC1_VREF 1100

#define BAK_BUTTON_PIN_POS (1<<BAK_BUTTON_PIN)
#define PSH_BUTTON_PIN_POS (1<<PSH_BUTTON_PIN)
#define CON_BUTTON_PIN_POS (1<<CON_BUTTON_PIN)
#define TRA_PIN_POS (1<<TRA_PIN)

volatile unsigned int delay_counter;
static volatile int encoder_counter, exit_counter, keyboard_state;
static unsigned long ref;
static int set_current_value;

void __attribute__((interrupt, auto_psv)) _CNInterrupt (void)
{
    if (TRA_PORT & TRA_PIN_POS)
        encoder_counter--;
    else
        encoder_counter++;
    _CNIF = 0;
}

void __attribute__ ( ( interrupt, no_auto_psv ) ) _T1Interrupt (  )
{
    if (!(PSH_BUTTON_PORT & PSH_BUTTON_PIN_POS))
    {
       keyboard_state = KB_SELECT;
    }
    if (!(BAK_BUTTON_PORT & BAK_BUTTON_PIN_POS))
    {
       keyboard_state = KB_EXIT;
    }
    if (!(CON_BUTTON_PORT & CON_BUTTON_PIN_POS))
    {
       keyboard_state = KB_ENTER;
    }
    delay_counter++;
    _T1IF = 0;
}

void delayms(unsigned int ms)
{
    unsigned int value = ms / T1_INTERRUPT_MS + 1;

    while (delay_counter <= value)
        Idle();
}

static void I2C1Start(void)
{
    SSP1CON2bits.SEN = 1;   // initiate start
    // wait until start finished
    while (SSP1CON2bits.SEN)
        ;
}

static void I2C1Stop(void)
{
    SSP1CON2bits.PEN = 1;   // initiate stop
    // wait until stop finished
    while (SSP1CON2bits.PEN)
        ;
}

static int I2C1WriteByte(unsigned char byte)
{
    SSP1BUF = byte;
    while (SSP1STATbits.R_W)
        ;
    
    if (SSP1CON2bits.ACKSTAT != 0)
    {
        I2C1Stop();
        return 1;
    }
    
    return 0;
}

int SSD1306_I2C_Write(int num_bytes, unsigned char control_byte, unsigned char *buffer)
{
    I2C1Start();

    if (I2C1WriteByte(SSD1306_I2C_ADDRESS))
        return 1;
    if (I2C1WriteByte(control_byte))
        return 1;
    
    while (num_bytes--)
    {
        if (I2C1WriteByte(*buffer++))
            return 1;
    }
    
    I2C1Stop();
    
    return 0;
}

int save_data(unsigned char offset, void *p, unsigned int size)
{
    //todo
    return 0;
}

void load_data(unsigned char offset, void *p, unsigned int size)
{
  //todo
}

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
  if (!(BAK_BUTTON_PORT & BAK_BUTTON_PIN_POS))
  {
      exit_counter++;
      return 0;
  }
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
      __builtin_disable_interrupts();
      int cnt = encoder_counter;
      encoder_counter = 0;
      __builtin_enable_interrupts();
      return KB_ENCODER | (cnt << 4);
  }
  return 0;
}

/*
 * 
 * RA0
 * RA1 - CON
 * RA2 - PSH
 * RA3 - TRA
 * RA4 - BAK
 * RA5 - MCLR
 * 
 * RB0 - PGD
 * RB1 - PGC
 * RB2 - OA1INB
 * RB3 - OA1OUT
 * RB4 - TRB
 * RB5
 * RB6
 * RB7 - AN19
 * RB8 - SCL
 * RB9 - SDA
 * RB10 - LED4
 * RB11 - LED3
 * RB12 - LED2
 * RB13 - LED1
 * RB14 - OA2IND
 * RB15 - OA2OUT
 */

static void InitPorts(void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
    LATA = 0x0000;
    LATB = 0x0000;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    //TRISA = 0x00B7;
    // RB15, RB13, RB12, RB11, RB10, RB3 - OUT
    TRISB = 0x43F7;

    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
    ODCA = 0x0000;
    ODCB = 0x0000;

    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
    // RA0(CN2), RA7(CN9), RB6(CN24), RB5(CN27) - weak pull downs
    CNPD1 = 0x0204;
    CNPD2 = 0x0900;

    CNPU1 = 0x0000;
    CNPU2 = 0x0000;
    
    TRB_CNEN = TRB_CNEN_VALUE;
    
    /****************************************************************************
     * Setting the Analog/Digital Configuration SFR(s)
     ***************************************************************************/
    ANSA = 0x0000;
    // RB14, RB7, RB2 - analog
    ANSB = 0x4084;
}

static void InitDAC1(void)
{
    // DACREF 2.4V internal band gap; DACOE disabled; DACFM Right; DACEN enabled; DACTSEL Unused; DACTRIG disabled; SRDIS reset on any type of device Reset; DACSLP disabled; DACSIDL disabled; 
    DAC1CON = 0x8003;
}

static void InitDAC2(void)
{
    // DACREF AVDD; DACOE disabled; DACFM Right; DACEN enabled; DACTSEL Unused; DACTRIG disabled; SRDIS reset on any type of device Reset; DACSLP disabled; DACSIDL disabled; 
    DAC2CON = 0x8002;
}

static void InitADC(void)
{
    // ASAM disabled; ADSIDL disabled; DONE disabled; FORM Absolute decimal result, unsigned, right-justified; SAMP disabled; SSRC Clearing sample bit ends sampling and starts conversion; MODE12 12-bit; ADON enabled; 
    AD1CON1 = 0x8400;
    // CSCNA disabled; NVCFG0 AVSS; PVCFG AVDD; ALTS disabled; BUFM disabled; SMPI Generates interrupt after completion of every sample/conversion operation; OFFCAL disabled; BUFREGEN disabled; 
    AD1CON2 = 0x00;
    // SAMC 0; EXTSAM disabled; ADRC FOSC/2; ADCS 63; 
    AD1CON3 = 0x3F;
    // CH0SA AN0; CH0SB AN0; CH0NB AVSS; CH0NA AVSS; 
    AD1CHS = 0x00;
    // CSS26 disabled; CSS23 disabled; CSS22 disabled; CSS21 disabled; CSS20 disabled; CSS30 disabled; CSS19 disabled; CSS18 disabled; CSS29 disabled; CSS17 disabled; CSS28 disabled; CSS16 disabled; CSS27 disabled; 
    AD1CSSH = 0x00;
    // CSS9 disabled; CSS5 disabled; CSS4 disabled; CSS3 disabled; CSS2 disabled; CSS15 disabled; CSS1 disabled; CSS14 disabled; CSS0 disabled; CSS13 disabled; CSS12 disabled; CSS11 disabled; CSS10 disabled; 
    AD1CSSL = 0x00;
    // ASEN disabled; WM Legacy operation; ASINT No interrupt; CM Less Than mode; BGREQ disabled; CTMREQ disabled; LPEN disabled; 
    AD1CON5 = 0x00;
    // CHH20 disabled; CHH22 disabled; CHH21 disabled; CHH23 disabled; CHH17 disabled; CHH16 disabled; CHH19 disabled; CHH18 disabled; 
    AD1CHITH = 0x00;
    // CHH9 disabled; CHH5 disabled; CHH4 disabled; CHH3 disabled; CHH2 disabled; CHH1 disabled; CHH0 disabled; CHH11 disabled; CHH10 disabled; CHH13 disabled; CHH12 disabled; CHH15 disabled; CHH14 disabled; 
    AD1CHITL = 0x00;
    // CTMEN23 disabled; CTMEN21 disabled; CTMEN22 disabled; CTMEN20 disabled; CTMEN18 disabled; CTMEN19 disabled; CTMEN16 disabled; CTMEN17 disabled; 
    AD1CTMENH = 0x00;
    // CTMEN5 disabled; CTMEN9 disabled; CTMEN12 disabled; CTMEN13 disabled; CTMEN10 disabled; CTMEN0 disabled; CTMEN11 disabled; CTMEN1 disabled; CTMEN2 disabled; CTMEN3 disabled; CTMEN4 disabled; CTMEN14 disabled; CTMEN15 disabled; 
    AD1CTMENL = 0x00;
}

static void InitOpAmp1(void)
{
    // NINSEL OA1INB; AMPEN enabled; PINSEL DAC1; SPDSEL Higher power and bandwidth; AMPSIDL disabled; AMPSLP disabled; 
    AMP1CON = 0x808D;
}

static void InitOpAmp2(void)
{
    // NINSEL OA2IND; AMPEN enabled; PINSEL DAC2; SPDSEL Higher power and bandwidth; AMPSIDL disabled; AMPSLP disabled; 
    AMP2CON = 0x8095;
}

static void InitI2C(void)
{
    // SMP Standard Speed; CKE Idle to Active; 
    SSP1STAT = 0x80;
    // SSPEN enabled; WCOL no_collision; CKP Clock Stretch; SSPM FOSC/(2 * (BRG_Value_I2C + 1)); SSPOV no_overflow; 
    SSP1CON1 = 0x28;
    // SBCDE disabled; BOEN disabled; SCIE disabled; PCIE disabled; DHEN disabled; SDAHT 300ns; AHEN disabled; 
    SSP1CON3 = 0x08;
    // Calculated Frequency: 100000 Hz; 
    SSP1ADD = 19;
}

static void InitClock(void)
{
    // RCDIV FRC/1; DOZE 1:1; DOZEN disabled; ROI disabled; 
    CLKDIV = 0x0000;
    // TUN Center frequency; 
    //OSCTUN = 0x00;
    // ROEN disabled; ROSEL FOSC; RODIV 0; ROSSLP disabled; 
    //REFOCON = 0x00;
    // ADC1MD enabled; SSP1MD enabled; T1MD enabled; U2MD enabled; U1MD enabled; 
    //PMD1 = 0x00;
    // CCP2MD enabled; CCP1MD enabled; CCP4MD enabled; CCP3MD enabled; CCP5MD enabled; 
    //PMD2 = 0x00;
    // SSP2MD enabled; RTCCMD enabled; CMPMD enabled; DAC1MD enabled; 
    //PMD3 = 0x00;
    // CTMUMD enabled; REFOMD enabled; ULPWUMD enabled; HLVDMD enabled; 
    //PMD4 = 0x00;
    // AMP2MD enabled; AMP1MD enabled; DAC2MD enabled; 
    //PMD6 = 0x00;
    // CLC1MD enabled; CLC2MD enabled; 
    //PMD8 = 0x00;
    // CF no clock failure; NOSC FRC; SOSCEN disabled; SOSCDRV disabled; CLKLOCK unlocked; OSWEN Switch is Complete; 
    __builtin_write_OSCCONH((uint8_t) (0x00));
    __builtin_write_OSCCONL((uint8_t) (0x00));
}

static void InitTimer1(void)
{
    //TMR1 0; 
    TMR1 = 0x00;
    //Period = 16 ms; Frequency = 31000 Hz;
    PR1 = 31 * T1_INTERRUPT_MS;
    //TCKPS 1:1; TON enabled; TSIDL disabled; TCS External; TECS LPRC; TSYNC disabled; TGATE disabled; 
    T1CON = 0x8202;
    //    TI: T1 - Timer1
    //    Priority: 1
    IPC0bits.T1IP = 1;
    // init the Timer 1 Interrupt
    IEC0bits.T1IE = 1;
}

void set_opamp1_offset(unsigned char offset)
{
    //todo
}

unsigned char get_opamp1_offset(void)
{
    //todo
    return 0x80;
}

void set_opamp2_offset(unsigned char offset)
{
    //todo
}

unsigned char get_opamp2_offset(void)
{
    //todo
    return 0;
}
int save_offsets(void)
{
    //todo
    return 0;
}

void enable_opamp1(void)
{
    //todo
}

void disable_opamp1(void)
{
    //todo
}

void enable_opamp2(void)
{
    //todo
}

void disable_opamp2(void)
{
    //todo
}

void SystemInit(void)
{
    delay_counter = 0;
    encoder_counter = 0;
    exit_counter = 0;
    keyboard_state = 0;
    
    InitClock();
    InitADC();
    InitDAC1();
    InitDAC2();
    InitOpAmp1();
    InitOpAmp2();
    InitI2C();
    InitTimer1();
    InitPorts();
}
