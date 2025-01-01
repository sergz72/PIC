#include "board.h"
#include <xc.h>
#include "i2c1.h"

#define PSH_BUTTON_PIN_POS (1<<PSH_BUTTON_PIN)
#define CON_BUTTON_PIN_POS (1<<CON_BUTTON_PIN)
#define TRA_PIN_POS (1<<TRA_PIN)

extern volatile char encoder_counter;
extern volatile char keyboard_state;

static void PIN_MANAGER_IOC(void)
{
    // TRB pin
    if(IOCAFbits.IOCAF6 == 1)
    {
        if (TRA_PORT & TRA_PIN_POS)
            encoder_counter--;
        else
            encoder_counter++;
    }
    IOCAF = 0;
}

void TMR0_OverflowISR(void)
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
    //Clear the TMR0 interrupt flag
    PIR3bits.TMR0IF = 0;
    delay_counter++;
}

void __interrupt() INTERRUPT_InterruptManager (void)
{
    // interrupt handler
    if(PIE0bits.IOCIE == 1 && PIR0bits.IOCIF == 1)
    {
        PIN_MANAGER_IOC();
    }
    else if(PIE7bits.I2C1EIE == 1 && PIR7bits.I2C1EIF == 1)
    {
        I2C1_ERROR_ISR();
    }
    else if(PIE7bits.I2C1RXIE == 1 && PIR7bits.I2C1RXIF == 1)
    {
        I2C1_RX_ISR();
    }
    else if(PIE7bits.I2C1IE == 1 && PIR7bits.I2C1IF == 1)
    {
        I2C1_ISR();
    }
    else if(PIE7bits.I2C1TXIE == 1 && PIR7bits.I2C1TXIF == 1)
    {
        I2C1_TX_ISR();
    }
    else if(PIE3bits.TMR0IE == 1 && PIR3bits.TMR0IF == 1)
    {
        TMR0_OverflowISR();
    }
    else
    {
        //Unhandled Interrupt
    }
}
