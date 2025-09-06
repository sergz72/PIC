#include "board.h"
#include <string.h>
#include <xc.h>
#include "i2c1.h"
#include "controller.h"

#define FVR1_VALUE  2048
#define FVR2_VALUE  1024
#define DAC_VREF    1024

volatile unsigned char delay_counter;

volatile char encoder_counter, exit_counter, keyboard_state;
static unsigned long ref;
static int set_current_value;
static unsigned char offsets[2];

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

int save_data(unsigned char offset, void *p, unsigned int size)
{
    unsigned char *pp = (unsigned char*)p;

    NVMADRU = 0x38;
    NVMADRH = 0;
    NVMADRL = offset;
    
    //write and post increment
    NVMCON1bits.NVMCMD = 0x04;

    di();
    
    while (size--)
    {
        NVMDATL = *pp++;
        NVMLOCK = 0x55;
        NVMLOCK = 0xAA;
        //Start byte read
        NVMCON0bits.GO = 1;
        while (NVMCON0bits.GO)
            ;
        if (NVMCON1bits.WRERR)
        {
            ei();
            NVMCON1bits.NVMCMD = 0;
            return 1;
        }
    }
    
    ei();
    NVMCON1bits.NVMCMD = 0;
    return 0;
}

void load_data(unsigned char offset, void *p, unsigned int size)
{
    unsigned char *pp = (unsigned char*)p;
    
    NVMADRU = 0x38;
    NVMADRH = 0;
    NVMADRL = offset;
    
    //read and post increment
    NVMCON1bits.NVMCMD = 0x01;

    while (size--)
    {
        //Start byte read
        NVMCON0bits.GO = 1;
        
        *pp++ = NVMDATL;
    }
}

int save_offsets(void)
{
    offsets[0] = OPA1OFFSET;
    offsets[1] = OPA2OFFSET;
    return save_data(sizeof(Program), offsets, 2);
}

static void load_offsets(void)
{
    load_data(sizeof(Program), offsets, 2);
}

static int adc_get(unsigned char pch, unsigned char nch)
{
    ADPCH = pch;
    ADNCH = nch;

    ADCON2bits.ACLR = 1;
    while (ADCON2bits.ACLR)
      ;
    
    for (int i = 0; i < 64; i++)
    {
      ADCON0bits.ADGO = 1;

      while (true == ADCON0bits.ADGO)
      {
      }
    }

    //return ADRES;
    return ADACC / 64;
}

static unsigned int get_mv(unsigned char pch, unsigned char nch)
{
    ref = adc_get(0x3E, 0x3B); // FVR buffer 1 - 4.096v
    int val = adc_get(pch, nch);
    if (val < 0)
      val = 0;
    return (unsigned int)((unsigned long)FVR1_VALUE * val / ref);
}

unsigned int get_voltage(void)
{
  return get_mv(0x0B, 0x03); // RB3-RA3
}

static void enable_r_charge_shunt(int enable)
{
  if (enable)
    R_CHARGE_SHUNT_ON;
  else
    R_CHARGE_SHUNT_OFF;
}

void set_current(int mA)
{
    set_current_value = mA;
    if (mA == 0)
    {
        DAC2DATL = 0;
        DAC3DATL = 0;
        enable_r_charge_shunt(0);
        disable_opamp1();
        disable_opamp2();
        return;
    }
    if (mA > 0) // charge
    {
        enable_r_charge_shunt(0);
        DAC2DATL = 0;
        disable_opamp2();
        DAC3DATL = (unsigned char)((unsigned long)(mA >> 1) * 255 / DAC_VREF); // 0.47 Ohm resistor
        enable_opamp1();
        return;
    }
    DAC3DATL = 0;
    disable_opamp1();
    mA = -mA;
    enable_r_charge_shunt(1);
    DAC2DATL = (unsigned char)((unsigned long)(mA >> 1) * 255 / DAC_VREF); // 0.47 Ohm resistor
    enable_opamp2();
}

signed char get_keyboard_status(void)
{
  if (!(BAK_BUTTON_PORT & BAK_BUTTON_PIN_POS))
  {
      exit_counter++;
      return 0;
  }
  if (exit_counter)
  {
      signed char status = exit_counter > 2 ? KB_EXIT_LONG : KB_EXIT;
      exit_counter = 0;
      keyboard_state = 0;
      return status;
  }
  if (keyboard_state)
  {
      signed char status = (signed char)keyboard_state;
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
 * RA0
 * RA1 - OPA1OUT
 * RA2 - OPA1IN0+
 * RA3 - connected to RA2
 * RA4
 * RA5 - LED4
 * RA6 - TRB
 * RA7 - BAK
 * 
 * RB0 - R_CHARGE_MOSFET
 * RB1 - OPA2OUT
 * RB2 - OPA2IN3-
 * RB3 - ANB3
 * RB4 - LED3
 * RB5
 * RB6 - ICSPCLK
 * RB7 - ICSPDAT
 * 
 * RC0 - TRA
 * RC1 - PSH
 * RC2 - CON
 * RC3 - SCL1
 * RC4 - SDA1
 * RC5
 * RC6 - LED1
 * RC7 - LED2
 * 
 */

static void InitPorts(void)
{
    LATA = 0;
    LATB = 0;
    LATC = 0x18;
    
    ODCONC = 0x18;

    // RA5 - out    
    TRISA = 0xDF;
    // RB0, RB4 - out    
    TRISB = 0xEE;
    //RC3,RC4,RC6,RC7 - out
    TRISC = 0x27;

    ANSELA = 0x0E;
    ANSELB = 0xCE;
    ANSELC = 0x20;
    
    WPUA = 0x11; // RA0, RA4
    WPUB = 0x20; // RB5
    WPUC = 0;

    // RA6 - TRB
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
    DAC3DATL =  0;

    //DACPSS FVR; DACNSS VSS; DACOE DACOUT1 and DACOUT2 are Disabled; DACEN enabled; 
    DAC3CON =  0x88;
}

static void InitADC(void)
{
    ADCLK = (0x1F << _ADCLK_ADCS_POSITION);        /* ADCS FOSC/16(7) */

    /****************************************
    *         Configure Context-1           *
    ****************************************/
    ADCTX = 0;

    ADPCH = 0x3B; // Positive channel - VSS
    ADNCH = 0x3B; // Negative channel - VSS
    
    ADACQL = 2;
    ADACQH = 0;
    
    ADCAP =  0; // additional capacitor = 0
    ADPREL = 0; // pre-charge time
    ADPREH = 0; // pre-charge time

    ADCON1 = 0;
    ADCON2 = (1 << _ADCON2_ADMD_POSITION)       /* ADMD accumulate mode(1) */
                        |(1 << _ADCON2_ADACLR_POSITION) /* ADACLR enabled(1) */
                        |(6 << _ADCON2_ADCRS_POSITION)  /* ADCRS 0x6(6) */
                        |(0 << _ADCON2_ADPSIS_POSITION);        /* ADPSIS RES(0) */
    ADCON3 = (0 << _ADCON3_ADTMD_POSITION)      /* ADTMD disabled(0) */
                        |(0 << _ADCON3_ADSOI_POSITION)  /* ADSOI ADGO not cleared(0) */
                        |(1 << _ADCON3_ADCALC_POSITION);        /* ADCALC Actual result vs setpoint(1) */
    ADSTAT = 0;
    ADREF = 0; //VREF- = VSS, VREF+ = VDD
    ADCSEL1 = 0;

    ADRPT = 64;
    
    ADCON0 = 0x86; // differential mode
}

static void InitOpAmp1(void)
{
    //GSEL R1 = 15R and R2 = 1R, R2/R1 = 0.07; RESON Disabled; NSS OPA1IN0-; 
    OPA1CON1 = 0x0;

    //PCH OPA1IN+; NCH DAC3_OUT;
    OPA1CON2 = 0x62;

    //FMS No Connection; INTOE Disabled; PSS OPA1IN0+; 
    OPA1CON3 = 0x0;

    //PTRES No reset; OFCST Calibration complete; Value written to the OPAxOFFSET register is used as input offset voltage source 
    OPA1CON4 = 1;
    OPA1OFFSET = offsets[0];

    //OREN Disabled; HWCH Basic OPA configuration with user defined feedback; ORPOL Non Inverted; HWCL Basic OPA configuration with user defined feedback; 
    OPA1HWC = 0x0;

    //ORS OPAxORPPS; 
    OPA1ORS = 0x0;
}

static void InitOpAmp2(void)
{
    //GSEL R1 = 15R and R2 = 1R, R2/R1 = 0.07; RESON Disabled; NSS OPA2IN3-; 
    OPA2CON1 = 0x3;

    //NCH OPA2IN-; PCH DAC2_OUT; 
    OPA2CON2 = 0x25;

    //FMS No Connection; INTOE Disabled; PSS OPA2IN0+; 
    OPA2CON3 = 0x0;

    //PTRES No reset; OFCST Calibration complete; Value written to the OPAxOFFSET register is used as input offset voltage source 
    OPA2CON4 = 1;
    OPA2OFFSET = offsets[1];

    //OREN Disabled; HWCH Basic OPA configuration with user defined feedback; ORPOL Non Inverted; HWCL Basic OPA configuration with user defined feedback; 
    OPA2HWC = 0x0;

    //ORS OPAxORPPS; 
    OPA2ORS = 0x0;
}

void enable_opamp1(void)
{
    //EN Enabled; CPON Enabled; UG OPAIN- pin; 
    OPA1CON0 = 0xA0;
}

void disable_opamp1(void)
{
    OPA1CON0 = 0;
}

void enable_opamp2(void)
{
    //EN Enabled; CPON Enabled; UG OPAIN- pin; 
    OPA2CON0 = 0xA0;
}

void disable_opamp2(void)
{
    OPA2CON0 = 0;
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
   // ADFVR 2.048v; CDAFVR 1.024v; TSRNG Lo_range; TSEN disabled; FVREN enabled; 
    FVRCON = 0x86;
}

void set_opamp1_offset(unsigned char offset)
{
    OPA1OFFSET = offset;
}

unsigned char get_opamp1_offset(void)
{
    return OPA1OFFSET;
}

void set_opamp2_offset(unsigned char offset)
{
    OPA2OFFSET = offset;
}

unsigned char get_opamp2_offset(void)
{
    return OPA2OFFSET;
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
    load_offsets();
    InitOpAmp1();
    InitOpAmp2();
    InitPorts();
    I2C1_Initialize();
    InitTimer0();
    
    CPUDOZE |= _CPUDOZE_IDLEN_MASK;
}

void blue_led_on()
{
  LED_BLUE_ON;
}

void blue_led_off()
{
  LED_BLUE_OFF;
}

void yellow_led_on()
{
  LED_YELLOW_ON;
}

void yellow_led_off()
{
  LED_YELLOW_OFF;
}

void green_led_on()
{
  LED_GREEN_ON;
}

void green_led_off()
{
  LED_GREEN_OFF;
}
void red_led_on()
{
  LED_RED_ON;
}

void red_led_off()
{
  LED_RED_OFF;
}
