#include "board.h"
#include "controller.h"
#include "ui.h"
#include <xc.h>

int main()
{
  SystemInit();
  
  __builtin_enable_interrupts();
  
  controller_init();
  delay_counter = 0;
  UI_Init();
  
  while (1)
  {
    delay_counter = 0;
    
    LED1_TOGGLE;
    
    int keyboard_status = get_keyboard_status();
    unsigned int v = get_voltage();
    int current = update_current(v);
    Process_Timer_Event(keyboard_status, v, current, get_current());

    delayms(TIMER_DELAY);
  }
}
