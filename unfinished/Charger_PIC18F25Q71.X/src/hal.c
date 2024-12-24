#include "board.h"
#include <string.h>
#include <xc.h>
#include "i2c1.h"

#define DAC2_VREF 1024
#define DAC3_VREF 1700 // 5v - 3.3v

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

static unsigned long adc_get(unsigned int ain)
{
    ADPCH = ain;

    ADCON0bits.ADGO = 1;

    while (true == ADCON0bits.ADGO)
    {
    }

    return (unsigned long)((ADRESH << 8) + ADRESL);
}

static unsigned int get_mv(unsigned int ain)
{
    ref = adc_get(0x3F); // FVR buffer 2 - 1.024v
    unsigned long val = adc_get(ain);
    return (unsigned int)(DAC2_VREF * val / ref);
}

unsigned int get_voltage(void)
{
  return get_mv(0x0B); // RB3
}

void set_current(int mA)
{
    set_current_value = mA;
    if (mA == 0)
    {
        DAC3DATL = 0xFF;
        DAC2DATL = 0;
        return;
    }
    if (mA > 0) // charge
    {
        DAC2DATL = 0;
        unsigned long v = (unsigned long)mA * (255UL * MAX_CURRENT / DAC3_VREF);
        DAC3DATL = 0xFF - (unsigned char)(v / MAX_CURRENT);
        return;
    }
    mA = -mA;
    DAC3DATL = 0xFF;
    DAC2DATL = (unsigned char)((unsigned long)(mA >> 1) * 255 / DAC2_VREF);
}

static int get_current_hi(void)
{
    unsigned int vcc = (unsigned int)((unsigned long)DAC2_VREF * (unsigned long)4095 / ref); // 12 bit ADC
    unsigned int mv = get_mv(2); // RA2
    if (mv >= vcc)
        return 0;
    return (int)((vcc - mv) << 1); // 0.47 Ohm resistor
}

static int get_current_lo(void)
{
    unsigned int mv = get_mv(0x0A); // RB2
    return (int)(mv << 1); // 0.47 Ohm resistor
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
 * RB0 - LED1
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
 * RC5 - VREF-(DAC3)
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

    // RB0 - out    
    TRISB = 0xFE;
    //RC3,RC4,RC6,RC7 - out
    TRISC = 0x27;

    ANSELA = 0x06;
    ANSELB = 0xCE;
    ANSELC = 0x20;
    
    WPUA = 0x40; // RA6
    WPUB = 0x30; // RB4, RB5
    WPUC = 0x07; // RC0, RC1, RC2

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

static void InitDAC2(void)
{
    DAC2DATL =  0;

    //DACPSS FVR; DACNSS VSS; DACOE DACOUT1 and DACOUT2 are Disabled; DACEN enabled; 
    DAC2CON =  0x88;
}

static void InitDAC3(void)
{
    DAC3DATL =  0xFF;

    //DACPSS VDD; DACNSS VREF-; DACOE DACOUT1 and DACOUT2 are Disabled; DACEN enabled; 
    DAC3CON =  0x81;
}

static void InitADC(void)
{
    ADCLK = (7 << _ADCLK_ADCS_POSITION);        /* ADCS FOSC/16(7) */
    ADCGA = 4; //RA2
    ADCGB = 0x0C; // RB2 & RB3
    ADCGC = 0;

    /****************************************
    *         Configure Context-1           *
    ****************************************/
    ADCTX = 0;

    ADPCH = 2; // Positive channel - RA2
    ADNCH = 0x3B; // Negative channel - VSS
    
    ADACQL = 0;
    ADACQH = 0;
    
    ADCAP = 0; // additional capacitor = 0
    ADPREL = 0; // pre-charge time
    ADPREH = 0; // pre-charge time

    ADCON1 = 0;
    ADCON2 = (0 << _ADCON2_ADMD_POSITION)       /* ADMD Basic_mode(0) */
                        |(1 << _ADCON2_ADACLR_POSITION) /* ADACLR enabled(1) */
                        |(1 << _ADCON2_ADCRS_POSITION)  /* ADCRS 0x1(1) */
                        |(0 << _ADCON2_ADPSIS_POSITION);        /* ADPSIS RES(0) */
    ADCON3 = (0 << _ADCON3_ADTMD_POSITION)      /* ADTMD disabled(0) */
                        |(0 << _ADCON3_ADSOI_POSITION)  /* ADSOI ADGO not cleared(0) */
                        |(1 << _ADCON3_ADCALC_POSITION);        /* ADCALC Actual result vs setpoint(1) */
    ADSTAT = 0;
    ADREF = 0; //VREF- = VSS, VREF+ = VDD
    ADCSEL1 = 0;

    ADCON0 = 0x84;
}

static void InitOpAmp1(void)
{
    //GSEL R1 = 15R and R2 = 1R, R2/R1 = 0.07; RESON Disabled; NSS OPA1IN0-; 
    OPA1CON1 = 0x0;

    //NCH OPA1IN-; PCH DAC2_OUT; 
    OPA1CON2 = 0x25;

    //FMS No Connection; INTOE Disabled; PSS OPA1IN0+; 
    OPA1CON3 = 0x0;

    //PTRES No reset; OFCST Calibration complete; OFCSEL Factory calibrated value in OPAxOFFSET; 
    OPA1CON4 = 0x0;

    //OREN Disabled; HWCH Basic OPA configuration with user defined feedback; ORPOL Non Inverted; HWCL Basic OPA configuration with user defined feedback; 
    OPA1HWC = 0x0;

    //ORS OPAxORPPS; 
    OPA1ORS = 0x0;

    //EN Enabled; CPON Enabled; UG OPAIN- pin; 
    OPA1CON0 = 0xA0;
}

static void InitOpAmp2(void)
{
    //GSEL R1 = 15R and R2 = 1R, R2/R1 = 0.07; RESON Disabled; NSS OPA2IN3-; 
    OPA2CON1 = 0x3;

    //NCH OPA2IN-; PCH DAC3_OUT; 
    OPA2CON2 = 0x26;

    //FMS No Connection; INTOE Disabled; PSS OPA2IN0+; 
    OPA2CON3 = 0x0;

    //PTRES No reset; OFCST Calibration complete; OFCSEL Factory calibrated value in OPAxOFFSET; 
    OPA2CON4 = 0x0;

    //OREN Disabled; HWCH Basic OPA configuration with user defined feedback; ORPOL Non Inverted; HWCL Basic OPA configuration with user defined feedback; 
    OPA2HWC = 0x0;

    //ORS OPAxORPPS; 
    OPA2ORS = 0x0;

    //EN Enabled; CPON Enabled; UG OPAIN- pin; 
    OPA2CON0 = 0xA0;
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

static void InitFVR(void)
{
   // ADFVR off; CDAFVR 1.024v; TSRNG Lo_range; TSEN disabled; FVREN enabled; 
    FVRCON = 0x84;
}

void SystemInit(void)
{
    InitClock();
    
    encoder_counter = 0;
    exit_counter = 0;
    keyboard_state = 0;
    delay_counter = 0;
    
    InitFVR();
    InitADC();
    InitDAC2();
    InitDAC3();
    InitOpAmp1();
    InitOpAmp2();
    InitPorts();
    I2C1_Initialize();
    InitTimer0();
    
    CPUDOZE |= _CPUDOZE_IDLEN_MASK;
}
