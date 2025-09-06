#include "board.h"
#include "controller.h"
#include "ui.h"
#include <xc.h>

int main()
{
  SystemInit();

  ei();
  
  controller_init();
  delay_counter = 0;
  UI_Init();

  while (1)
  {
    delay_counter = 0;
    
    signed char keyboard_status = get_keyboard_status();
    unsigned int v = get_voltage();
    unsigned int current = update_current(v);
    Process_Timer_Event(keyboard_status, v, current);
    
    delayms(TIMER_DELAY);
  }
}
