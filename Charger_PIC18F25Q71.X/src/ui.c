#include "board.h"
#include "ui.h"
#include <string.h>
#include <fonts/font5.h>
#include <fonts/font8_2.h>
#include "controller.h"

/*
 *  Mode|Stg| mV | mA
 *  Chrg|Ch1|3650|1000
 *  Disc|Dis|3000|0100
 *  Test|Ch2|3200|0100
 *  1C0000mA0000mV
 *  Charge 0000mAh
 *  Dischr 0000mAh
 */

#define SELECTION_MODE_SELECT_MODE  0
#define SELECTION_MODE_SELECT_VALUE 1
#define SELECTION_MODE_EDIT_VALUE   2
#define SELECTION_MODE_TEST         3
#define MAX_SELECTED_DIGIT          17

#define SETTINGS_FONT fiveBySevenFontInfo
#define CURRENT_VOLTAGE_FONT courierNew8ptFontInfo
#define CURRENT_VOLTAGE_Y (64-3*CURRENT_VOLTAGE_FONT.char_height)
#define CHARGE_MAH_Y (64-2*CURRENT_VOLTAGE_FONT.char_height)
#define DISCHARGE_MAH_Y (64-CURRENT_VOLTAGE_FONT.char_height)

#define GET_X(font, pos) ((font.character_max_width + font.character_spacing) * pos)

enum CursorStates {INACTIVE, OFF, ON};

static unsigned char value_buffer[6];
static int selection_mode;
static enum Modes selected_mode;
static int test_current;
static int selected_offset;
int selected_digit;
static enum CursorStates cursor_state;
static enum Stages prev_stage;
static int blue_led_state, save_event;
static unsigned int event_no;

static void DrawValue4(unsigned int x, unsigned int y, const FONT_INFO *font, unsigned int value,
                       unsigned int textColor, unsigned int bkColor)
{
  unsigned char *p = value_buffer;
  p[4] = 0;
  for (int i = 3; i >= 0; i--)
  {
    if (i < 3 && value == 0)
      p[i] = ' ';
    else
    {
      p[i] = (value % 10) + '0';
      value /= 10;
    }
  }
  LcdDrawText(x, y, (char*)value_buffer, font, textColor, bkColor, NULL);
}

static void DrawValue1(unsigned int x, unsigned int y, const FONT_INFO *font, unsigned int value,
                       unsigned int textColor, unsigned int bkColor)
{
  value_buffer[0] = (value % 10) + '0';
  value_buffer[1] = 0;
  LcdDrawText(x, y, (char*)value_buffer, font, textColor, bkColor, NULL);
}

static void DrawValue3(unsigned int x, unsigned int y, const FONT_INFO *font, unsigned int value,
                       unsigned int textColor, unsigned int bkColor, int selectedItem)
{
  int idx = 0;
  for (unsigned int i = 100; i >= 1; i /= 10)
  {
    DrawValue1(x, y, font, value / i, selectedItem == idx ? bkColor : textColor,
               selectedItem == idx ? textColor : bkColor);
    x += font->character_max_width + font->character_spacing;
    idx++;
  }
}

static void ShowFactVoltage(unsigned int voltage)
{
  DrawValue4(GET_X(CURRENT_VOLTAGE_FONT, 8), CURRENT_VOLTAGE_Y, &CURRENT_VOLTAGE_FONT, voltage,
            WHITE_COLOR, BLACK_COLOR);
}

static void ShowSetCurrent(unsigned int current)
{
  DrawValue4(GET_X(CURRENT_VOLTAGE_FONT, 2), CURRENT_VOLTAGE_Y, &CURRENT_VOLTAGE_FONT, current,
            WHITE_COLOR, BLACK_COLOR);
}

static void ShowChargeMAh(void)
{
  DrawValue4(GET_X(CURRENT_VOLTAGE_FONT, 7), CHARGE_MAH_Y, &CURRENT_VOLTAGE_FONT, (unsigned int)charge_mah,
            WHITE_COLOR, BLACK_COLOR);
}

static void ShowDischargeMAh(void)
{
  DrawValue4(GET_X(CURRENT_VOLTAGE_FONT, 7), DISCHARGE_MAH_Y, &CURRENT_VOLTAGE_FONT, (unsigned int)discharge_mah,
            WHITE_COLOR, BLACK_COLOR);
}

static void DrawMode(unsigned int y, const char *name, int selected)
{
  LcdDrawText(0, y, name, &SETTINGS_FONT, selected ? BLACK_COLOR : WHITE_COLOR, selected ? WHITE_COLOR : BLACK_COLOR, NULL);
}

static void DrawModes(void)
{
  unsigned int y = SETTINGS_FONT.char_height;
  DrawMode(y, "Chrg", selected_mode == CHARGE && cursor_state != OFF);
  y += SETTINGS_FONT.char_height;
  DrawMode(y, "Disc", selected_mode == DISCHARGE && cursor_state != OFF);
  y += SETTINGS_FONT.char_height;
  DrawMode(y, "Test", selected_mode == CAPACITY_TEST && cursor_state != OFF);
}

static void SelectMode(enum Modes mode)
{
  selected_mode = mode;
  switch (mode)
  {
    case DISCHARGE: program.mode = MODE_DISCHARGE; break;
    case CAPACITY_TEST: program.mode = MODE_TEST; break;
    default: program.mode = MODE_CHARGE; break;
  }
  DrawModes();
}

static unsigned int GetNewValue(unsigned int v, int counter, int diff, unsigned int max, unsigned int min)
{
  counter *= diff;
  if (counter > 0)
  {
    v += (unsigned int)counter;
    if (v > max)
      return max;
    return v;
  }
  counter = -counter;
  if (v > counter)
  {
    unsigned int new_v = v - (unsigned int)counter;
    if (new_v < min)
      return v;
    return new_v;
  }
  return v;
}

static enum Modes GetNextMode()
{
  switch (selected_mode)
  {
    case CHARGE: return DISCHARGE;
    case DISCHARGE: return CAPACITY_TEST;
    default: return CHARGE;
  }
}

static enum Modes GetPrevMode()
{
  switch (selected_mode)
  {
  case CHARGE: return CAPACITY_TEST;
  case DISCHARGE: return CHARGE;
  default: return DISCHARGE;
  }
}

static void DrawCharge1Current(void)
{
  DrawValue3(GET_X(SETTINGS_FONT, 14), SETTINGS_FONT.char_height, &SETTINGS_FONT, program.charge1.current / 10, WHITE_COLOR,
              BLACK_COLOR, cursor_state != OFF ? selected_digit - 3 : 100);
}

static void DrawCharge1Voltage(void)
{
  DrawValue3(GET_X(SETTINGS_FONT, 9), SETTINGS_FONT.char_height, &SETTINGS_FONT, program.charge1.voltage / 10, WHITE_COLOR,
              BLACK_COLOR, cursor_state != OFF ? selected_digit : 100);
}

static void DrawCharge2Current(void)
{
  DrawValue3(GET_X(SETTINGS_FONT, 14), SETTINGS_FONT.char_height*3, &SETTINGS_FONT, program.charge2.current / 10, WHITE_COLOR,
              BLACK_COLOR, cursor_state != OFF ? selected_digit - 15 : 100);
}

static void DrawCharge2Voltage(void)
{
  DrawValue3(GET_X(SETTINGS_FONT, 9), SETTINGS_FONT.char_height*3, &SETTINGS_FONT, program.charge2.voltage / 10, WHITE_COLOR,
              BLACK_COLOR, cursor_state != OFF ? selected_digit - 12 : 100);
}

static void DrawDischargeCurrent(void)
{
  DrawValue3(GET_X(SETTINGS_FONT, 14), 2*SETTINGS_FONT.char_height, &SETTINGS_FONT, program.discharge.current / 10, WHITE_COLOR,
              BLACK_COLOR, cursor_state != OFF ? selected_digit - 9 : 100);
}

static void DrawDischargeVoltage(void)
{
  DrawValue3(GET_X(SETTINGS_FONT, 9), 2*SETTINGS_FONT.char_height, &SETTINGS_FONT, program.discharge.voltage / 10, WHITE_COLOR,
              BLACK_COLOR, cursor_state != OFF ? selected_digit - 6 : 100);
}

static void DrawSelection(void)
{
  DrawCharge1Current();
  DrawCharge1Voltage();
  DrawCharge2Current();
  DrawCharge2Voltage();
  DrawDischargeCurrent();
  DrawDischargeVoltage();
}

static void BackToSelectMode(void)
{
  selection_mode = SELECTION_MODE_SELECT_MODE;
  selected_digit = MAX_SELECTED_DIGIT+1;
  cursor_state = INACTIVE;
  DrawSelection();
}

static void SwitchSelectionMode(int up)
{
  switch (selection_mode)
  {
  case SELECTION_MODE_SELECT_MODE:
    if (up)
    {
      selection_mode = SELECTION_MODE_SELECT_VALUE;
      selected_digit = 0;
      DrawModes();
      DrawSelection();
    }
    break;
  case SELECTION_MODE_SELECT_VALUE:
    if (up)
    {
      selection_mode = SELECTION_MODE_EDIT_VALUE;
      cursor_state = ON;
    }
    else
      BackToSelectMode();
    break;
  case SELECTION_MODE_EDIT_VALUE:
    if (!up)
    {
      selection_mode = SELECTION_MODE_SELECT_VALUE;
      cursor_state = INACTIVE;
      DrawSelection();
    }
    break;
  }
}

static void UpdateValue(int counter)
{
  switch (selected_digit)
  {
    case 0: // thousands of charge voltage
      program.charge1.voltage = GetNewValue(program.charge1.voltage, counter, 1000, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 1: // hundreds of charge voltage
      program.charge1.voltage = GetNewValue(program.charge1.voltage, counter, 100, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 2: // tens of charge voltage
      program.charge1.voltage = GetNewValue(program.charge1.voltage, counter, 10, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 3: // thousands of charge current
      program.charge1.current = GetNewValue(program.charge1.current, counter, 1000, MAX_CURRENT, MIN_CURRENT);
      break;
    case 4: // hundreds of charge current
      program.charge1.current = GetNewValue(program.charge1.current, counter, 100, MAX_CURRENT, MIN_CURRENT);
      break;
    case 5: // tens of charge current
      program.charge1.current = GetNewValue(program.charge1.current, counter, 10, MAX_CURRENT, MIN_CURRENT);
      break;
    case 6: // thousands of discharge voltage
      program.discharge.voltage = GetNewValue(program.discharge.voltage, counter, 1000, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 7: // hundreds of discharge voltage
      program.discharge.voltage = GetNewValue(program.discharge.voltage, counter, 100, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 8: // tens of discharge voltage
      program.discharge.voltage = GetNewValue(program.discharge.voltage, counter, 10, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 9: // thousands of discharge current
      program.discharge.current = GetNewValue(program.discharge.current, counter, 1000, MAX_CURRENT, MIN_CURRENT);
      break;
    case 10: // hundreds of discharge current
      program.discharge.current = GetNewValue(program.discharge.current, counter, 100, MAX_CURRENT, MIN_CURRENT);
      break;
    case 11: // tens of discharge current
      program.discharge.current = GetNewValue(program.discharge.current, counter, 10, MAX_CURRENT, MIN_CURRENT);
      break;
    case 12: // thousands of charge voltage
      program.charge2.voltage = GetNewValue(program.charge2.voltage, counter, 1000, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 13: // hundreds of charge voltage
      program.charge2.voltage = GetNewValue(program.charge2.voltage, counter, 100, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 14: // tens of charge voltage
      program.charge2.voltage = GetNewValue(program.charge2.voltage, counter, 10, MAX_VOLTAGE, MIN_VOLTAGE);
      break;
    case 15: // thousands of charge current
      program.charge2.current = GetNewValue(program.charge2.current, counter, 1000, MAX_CURRENT, MIN_CURRENT);
      break;
    case 16: // hundreds of charge current
      program.charge2.current = GetNewValue(program.charge2.current, counter, 100, MAX_CURRENT, MIN_CURRENT);
      break;
    case 17: // tens of charge current
      program.charge2.current = GetNewValue(program.charge2.current, counter, 10, MAX_CURRENT, MIN_CURRENT);
      break;
  }
  DrawSelection();
}

static void ChangeSelection(int counter)
{
  switch (selection_mode)
  {
    case SELECTION_MODE_SELECT_MODE:
      SelectMode(counter > 0 ? GetPrevMode() : GetNextMode());
      break;
    case SELECTION_MODE_SELECT_VALUE:
      selected_digit += counter;
      if (selected_digit > MAX_SELECTED_DIGIT)
        selected_digit -= MAX_SELECTED_DIGIT+1;
      else if (selected_digit < 0)
        selected_digit += MAX_SELECTED_DIGIT+1;
      DrawSelection();
      break;
    case SELECTION_MODE_EDIT_VALUE:
      UpdateValue(counter);
      break;
  }
}

static void DrawMvMa(void)
{
  LcdDrawText(GET_X(CURRENT_VOLTAGE_FONT, 6), CURRENT_VOLTAGE_Y, "mA", &CURRENT_VOLTAGE_FONT,
      WHITE_COLOR, BLACK_COLOR, NULL);
  LcdDrawText(GET_X(CURRENT_VOLTAGE_FONT, 12), CURRENT_VOLTAGE_Y, "mV", &CURRENT_VOLTAGE_FONT,
      WHITE_COLOR, BLACK_COLOR, NULL);
}

static void InitMainMode(void)
{
  unsigned int y = 0;
  LcdDrawText(0, y, "Mode|Stg| mV | mA", &SETTINGS_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
  y += SETTINGS_FONT.char_height;
  LcdDrawText(0, y, "Chrg", &SETTINGS_FONT, BLACK_COLOR, WHITE_COLOR, NULL);
  LcdDrawText(GET_X(SETTINGS_FONT, 4), y, "|Ch1|3650|1000", &SETTINGS_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
  y += SETTINGS_FONT.char_height;
  LcdDrawText(0, y, "Disc|Dis|3000|0100", &SETTINGS_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
  y += SETTINGS_FONT.char_height;
  LcdDrawText(0, y, "Test|Ch2|3400|1000", &SETTINGS_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
  DrawMvMa();
  LcdDrawText(0, CHARGE_MAH_Y, "Charge    0mAh", &CURRENT_VOLTAGE_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
  LcdDrawText(0, DISCHARGE_MAH_Y, "Dischr    0mAh", &CURRENT_VOLTAGE_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
  selection_mode = SELECTION_MODE_SELECT_MODE;
  DrawCharge1Current();
  DrawCharge1Voltage();
  DrawDischargeCurrent();
  DrawDischargeVoltage();
  DrawCharge2Current();
  DrawCharge2Voltage();
}

static void DrawOffsetLabels(void)
{
  LcdDrawText(0, 0, "OPA1 Offset", &SETTINGS_FONT,WHITE_COLOR, BLACK_COLOR, NULL);
  LcdDrawText(0, SETTINGS_FONT.char_height, "OPA2 Offset", &SETTINGS_FONT,WHITE_COLOR, BLACK_COLOR, NULL);
}

static void DrawOffset1(void)
{
  unsigned int selected = selected_offset == 1;
  DrawValue3(GET_X(SETTINGS_FONT, 13), 0, &SETTINGS_FONT, get_opamp1_offset(), selected ? BLACK_COLOR : WHITE_COLOR,
             selected ? WHITE_COLOR : BLACK_COLOR, 255);
}

static void DrawOffset2(void)
{
  unsigned int selected = selected_offset == 2;
  DrawValue3(GET_X(SETTINGS_FONT, 13), SETTINGS_FONT.char_height, &SETTINGS_FONT, get_opamp2_offset(), selected ? BLACK_COLOR : WHITE_COLOR,
             selected ? WHITE_COLOR : BLACK_COLOR, 255);
}

static void InitTestMode(void)
{
  selected_offset = 0;
  LcdScreenFill(BLACK_COLOR);
  DrawOffsetLabels();
  DrawOffset1();
  DrawOffset2();
  DrawMvMa();
  selection_mode = SELECTION_MODE_TEST;
  test_current = 0;
  ShowSetCurrent((unsigned int)test_current);
}

void UI_Init(void)
{
  selected_mode = program.mode == MODE_CHARGE ? CHARGE : program.mode == MODE_DISCHARGE ? DISCHARGE : CAPACITY_TEST;
  prev_stage = CHARGE1;
  current_stage = IDLE;
  selected_digit = MAX_SELECTED_DIGIT+1;
  cursor_state = INACTIVE;
  blue_led_state = 0;
  event_no = 0;
  save_event = 0;

  LcdInit();
  InitMainMode();
  LcdUpdate();
}

static void ChangeTestCurrent(int value)
{
  test_current += value * 10;
  set_current(test_current);
}

static void ProcessTestModeTimerEvent(signed char keyboard_status)
{
  if (selected_offset == 0)
  {
    switch (keyboard_status & 0x0F) {
      case KB_EXIT:
        InitMainMode();
        break;
      case KB_SELECT:
        selected_offset = 1;
        disable_opamp2();
        enable_opamp1();
        DrawOffset1();
        break;
      case KB_ENCODER:
        ChangeTestCurrent(keyboard_status >> 4);
        const char *text;
        if (test_current < 0)
        {
          text = " -";
          ShowSetCurrent((unsigned int)(-test_current));
        }
        else
        {
          text = "  ";
          ShowSetCurrent((unsigned int)test_current);
        }
        LcdDrawText(0, CURRENT_VOLTAGE_Y, text, &CURRENT_VOLTAGE_FONT, WHITE_COLOR, BLACK_COLOR, NULL);          
        break;
    }
  }
  else
  {
    switch (keyboard_status & 0x0F) {
      case KB_ENTER:
        save_offsets();
        save_event = 1;
      case KB_EXIT:
        selected_offset = 0;
        disable_opamp1();
        disable_opamp2();
        DrawOffset1();
        DrawOffset2();
        break;
      case KB_ENCODER:
        if (selected_offset == 1)
        {
          set_opamp1_offset(get_opamp1_offset() + (keyboard_status >> 4));
          DrawOffset1();
        }
        else
        {
          set_opamp2_offset(get_opamp2_offset() + (keyboard_status >> 4));
          DrawOffset2();
        }
        break;
      case KB_SELECT:
        selected_offset = selected_offset == 1 ? 2 : 1;
        if (selected_offset == 1)
        {
            disable_opamp2();
            enable_opamp1();
        }
        else
        {
            disable_opamp1();
            enable_opamp2();
        }
        DrawOffset1();
        DrawOffset2();
        break;
    }
  }
}

static void ShowCursor(int toggle_cursor)
{
  if (cursor_state == INACTIVE)
    return;
  if (toggle_cursor)
  {
    cursor_state = cursor_state == ON ? OFF : ON;
    DrawSelection();
  }
}

static void ProcessMainModeTimerEvent(signed char keyboard_status, unsigned int current, int toggle_cursor)
{
  ShowSetCurrent(current);
  ShowChargeMAh();
  ShowDischargeMAh();
  ShowCursor(toggle_cursor);
  set_current(current_stage == CHARGE1 || current_stage == CHARGE2 ? (int)current : -(int)current);
  if (is_program_running())
  {
    if ((keyboard_status & 0x0F) == KB_EXIT)
      stop_program();
    LcdUpdate();
    return;
  }
  switch (keyboard_status & 0x0F)
  {
    case KB_SELECT:
      SwitchSelectionMode(1);
      break;
    case KB_EXIT:
      SwitchSelectionMode(0);
      break;
    case KB_ENCODER:
      ChangeSelection(keyboard_status >> 4);
      break;
    case KB_ENTER:
      if (selection_mode == SELECTION_MODE_SELECT_MODE)
        start_program(selected_mode);
      else if (selection_mode == SELECTION_MODE_EDIT_VALUE)
      {
        save_program_data();
        save_event = 1;
        BackToSelectMode();
      }
      break;
    case KB_EXIT_LONG:
      if (selection_mode == SELECTION_MODE_SELECT_MODE)
        InitTestMode();
      break;
    default:
      break;
  }
}

static void DrawStageName(void)
{
  const char *text;

  switch (current_stage)
  {
    case IDLE:
      text = "  ";
      break;
    case CHARGE1:
      text = "1C";
      break;
    case CHARGE2:
      text = "2C";
      break;
    default:
      text = "DI";
      break;
  }
  LcdDrawText(0, CURRENT_VOLTAGE_Y, text, &CURRENT_VOLTAGE_FONT, WHITE_COLOR, BLACK_COLOR, NULL);
}

static void UpdateLeds(int toggle_cursor)
{
  if (save_event)
  {
    blue_led_on();
    yellow_led_on();
    red_led_on();
    green_led_on();
    save_event = 0;
    prev_stage = current_stage + 1;
    return;
  }
  if (prev_stage != current_stage)
  {
    prev_stage = current_stage;
    DrawStageName();
    switch (current_stage)
    {
      case IDLE:
        yellow_led_on();
        red_led_off();
        green_led_off();
        break;
      case CHARGE1:
      case CHARGE2:
        yellow_led_off();
        red_led_off();
        green_led_on();
        break;
      default:
        yellow_led_off();
        red_led_on();
        green_led_off();
        break;
    }
  }
  if (toggle_cursor)
  {
    blue_led_state = !blue_led_state;
    if (blue_led_state)
      blue_led_on();
    else
      blue_led_off();
  }
}

void Process_Timer_Event(signed char keyboard_status, unsigned int voltage, unsigned int next_current)
{
  ShowFactVoltage(voltage);
  event_no++;
  int toggle_cursor = (event_no & 3) == 3;
  UpdateLeds(toggle_cursor);
  if (selection_mode == SELECTION_MODE_TEST)
    ProcessTestModeTimerEvent(keyboard_status);
  else
    ProcessMainModeTimerEvent(keyboard_status, next_current, toggle_cursor);
  LcdUpdate();
}
