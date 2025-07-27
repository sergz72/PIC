#include "board.h"
#include <stdio.h>
#include <string.h>

char *uart_buffer_read_p;

int getch_(void)
{
  if (uart_buffer_write_p != uart_buffer_read_p)
  {
    int c = *uart_buffer_read_p++;
    if (uart_buffer_read_p == uart_buffer + UART_BUFFER_SIZE)
      uart_buffer_read_p = uart_buffer;
    return c;
  }
  return EOF;
}

void puts_(const char *s)
{
  int l = strlen(s);
  while (l--)
    UART1_Transmit(*s++);
}

void update_counters(void)
{
  counter_high = CCP1TMRH;
  counter_low  = CCP2TMRH;
  counter_z    = CCP3TMRH;
  counter_freq_rs = ((unsigned long)CCP4TMRH << 16) | (unsigned long)CCP4TMRL;
}

void PeriodicTimerStart(void)
{
  uart_buffer_read_p = uart_buffer;

  // start timer1
  T1CONbits.TON = 1;

  // UART1 transmit/receive enable  
  U1MODEbits.UTXEN = 1;  // transmit enable
  U1MODEbits.URXEN = 1;  // receive enable
}

void CustomMainInit(void)
{
}

void register_custom_commands(void)
{
}
