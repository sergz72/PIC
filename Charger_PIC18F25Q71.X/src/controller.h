#ifndef _CONTROLLER_H
#define _CONTROLLER_H

#define MODE_CHARGE 0x55
#define MODE_DISCHARGE 0xAA
#define MODE_TEST 0x11

typedef struct
{
  unsigned short voltage;
  unsigned short current;
} ModeParameters;

typedef struct {
  int mode;
  ModeParameters charge1;
  ModeParameters charge2;
  ModeParameters discharge;
} Program;

enum Stages {IDLE, CHARGE1, DISCHARGE1, CHARGE2};
enum Modes {CHARGE, DISCHARGE, CAPACITY_TEST};

extern enum Stages current_stage;
extern Program program;
extern float charge_mah;
extern float discharge_mah;

unsigned int update_current(unsigned int voltage);
void controller_init(void);
void start_program(enum Modes mode);
void stop_program(void);
int is_program_running(void);
void save_program_data(void);

#endif
