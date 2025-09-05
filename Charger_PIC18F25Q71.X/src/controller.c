#include "board.h"
#include "controller.h"

static unsigned int current_current;
static int cv_mode;
float charge_mah;
float discharge_mah;

enum Stages current_stage, next_stage;
Program program = {
  .charge = {
    .current = 1000,
    .voltage = 4200
  },
  .discharge = {
    .current = 1000,
    .voltage = 2500
  },
  .mode = MODE_CHARGE
};

void controller_init(void)
{
  current_current = 0;
  load_data(0, &program, sizeof program);
}

void save_program_data(void)
{
  save_data(0, &program, sizeof program);
}

static void goto_next_stage(void)
{
  current_stage = next_stage;
  current_current = 0;
  cv_mode = 0;
  switch (current_stage)
  {
    case CHARGE1:
      charge_mah = 0;
      current_current = program.charge.current / 10;
      next_stage = DISCHARGE2;
      break;
    case DISCHARGE2:
      discharge_mah = 0;
      current_current = program.discharge.current;
      next_stage = CHARGE2;
      break;
    case CHARGE2:
      charge_mah = 0;
      current_current = program.charge.current / 10;
      next_stage = IDLE;
      break;
  default:
      next_stage = IDLE;
      break;
  }
}

static void update_charge_current(unsigned int voltage)
{
  if (voltage >= program.charge.voltage)
  {
    cv_mode = 1;
    if (current_current <= 10)
      goto_next_stage();
    else
      current_current -= 10;
  }
  else if (!cv_mode && current_current < program.charge.current)
    current_current += program.charge.current / 10;

  charge_mah += (float)current_current / (float)(3600 * 1000 / TIMER_DELAY);
}

static void update_discharge_current(unsigned int voltage)
{
  if (voltage <= program.discharge.voltage)
    goto_next_stage();
  discharge_mah += (float)current_current / (float)(3600 * 1000 / TIMER_DELAY);
}

unsigned int update_current(unsigned int voltage)
{
  if (current_stage == IDLE)
    return 0;
  if (current_stage == CHARGE1 || current_stage == CHARGE2)
  {
    update_charge_current(voltage);
    return current_current;
  }
  update_discharge_current(voltage);
  return current_current;
}

void start_program(enum Modes mode)
{
  if (current_stage != IDLE)
    return;
  charge_mah = 0;
  discharge_mah = 0;
  switch (mode)
  {
    case CHARGE:
      cv_mode = 0;
      current_current = program.charge.current / 10;
      current_stage = CHARGE1;
      next_stage = IDLE;
      break;
    case DISCHARGE:
      current_current = program.discharge.current;
      current_stage = DISCHARGE1;
      next_stage = IDLE;
      break;
    case CAPACITY_TEST:
      current_current = program.discharge.current;
      current_stage = DISCHARGE1;
      next_stage = CHARGE1;
      break;
    default:
      break;
  }
}

void stop_program(void)
{
  current_stage = IDLE;
  current_current = 0;
}

int is_program_running(void)
{
  return current_stage != IDLE;
}
