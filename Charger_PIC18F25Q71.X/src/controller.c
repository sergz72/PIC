#include "board.h"
#include "controller.h"

static unsigned int current_current;
static int cv_mode, discharge_stop;
float charge_mah;
float discharge_mah;

enum Stages current_stage, next_stage;
Program program = {
  .charge1 = {
    .current = 1000,
    .voltage = 3650
  },
  .charge2 = {
    .current = 1000,
    .voltage = 3400
  },
  .discharge = {
    .current = 0100,
    .voltage = 3000
  },
  .mode = MODE_CHARGE
};
static unsigned int charge_current, charge_voltage;

void controller_init(void)
{
  current_current = 0;
  load_data(0, &program, sizeof program);
  if ((program.mode != MODE_CHARGE && program.mode != MODE_DISCHARGE && program.mode != MODE_TEST)
      || (program.charge1.current > MAX_CURRENT || program.charge1.current < MIN_CURRENT)
      || (program.charge1.voltage > MAX_VOLTAGE || program.charge1.voltage < MIN_VOLTAGE)
      || (program.charge2.current > MAX_CURRENT || program.charge2.current < MIN_CURRENT)
      || (program.charge2.voltage > MAX_VOLTAGE || program.charge2.voltage < MIN_VOLTAGE)
      || (program.discharge.current > MAX_CURRENT || program.discharge.current < MIN_CURRENT)
      || (program.discharge.voltage > MAX_VOLTAGE || program.discharge.voltage < MIN_VOLTAGE))
  {
    program.mode = MODE_CHARGE;
    program.charge1.current = 1000;
    program.charge1.voltage = 3650;
    program.charge2.current = 1000;
    program.charge2.voltage = 3400;
    program.discharge.current = 100;
    program.discharge.voltage = 3000;
  }
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
  discharge_stop = 0;
  switch (current_stage)
  {
    case DISCHARGE1:
      discharge_mah = 0;
      next_stage = CHARGE2;
      break;
    case CHARGE2:
      charge_mah = 0;
      charge_current = program.charge2.current;
      charge_voltage = program.charge2.voltage;
      next_stage = IDLE;
      break;
  default:
      next_stage = IDLE;
      break;
  }
}

static void update_charge_current(unsigned int voltage)
{
  if (voltage >= charge_voltage)
  {
    cv_mode = 1;
    if (current_current <= MIN_CURRENT + 10)
      goto_next_stage();
    else
      current_current -= 10;
  }
  else if (!cv_mode && current_current < charge_current)
    current_current += charge_current / 10;

  charge_mah += (float)current_current / (3600.0f * 1000.0f / TIMER_DELAY);
}

static void update_discharge_current(unsigned int voltage)
{
  if (discharge_stop)
  {
    unsigned short current10 = program.discharge.current / 10;
    if (current_current <= current10)
      goto_next_stage();
    else
      current_current -= current10;
  }
  else if (voltage <= program.discharge.voltage)
    discharge_stop = 1;
  else if (current_current < program.discharge.current)
    current_current += program.discharge.current / 10;
  discharge_mah += (float)current_current / (3600.0f * 1000.0f / TIMER_DELAY);
}

unsigned int update_current(unsigned int voltage)
{
  if (current_stage == IDLE)
    return 0;
  if (current_stage == CHARGE1 || current_stage == CHARGE2)
    update_charge_current(voltage);
  else
    update_discharge_current(voltage);
  return current_current;
}

void start_program(enum Modes mode)
{
  if (current_stage != IDLE)
    return;
  charge_mah = 0;
  discharge_mah = 0;
  current_current = 0;
  discharge_stop = 0;
  cv_mode = 0;
  switch (mode)
  {
    case CHARGE:
      charge_current = program.charge1.current;
      charge_voltage = program.charge1.voltage;
      current_stage = CHARGE1;
      next_stage = IDLE;
      break;
    case DISCHARGE:
      current_stage = DISCHARGE1;
      next_stage = IDLE;
      break;
    case CAPACITY_TEST:
      current_stage = CHARGE1;
      charge_current = program.charge1.current;
      charge_voltage = program.charge1.voltage;
      next_stage = DISCHARGE1;
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
