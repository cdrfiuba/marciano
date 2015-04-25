#include "mbed.h"

#define START          1
#define STOP           2
#define NEXT_EYE_MODE  3
#define PREV_EYE_MODE  4

#define CENTER        10
#define LEFT          20
#define RIGHT         30

#define FORWARD        0
#define BACKWARD     100

#define DIR_FORWARD    1
#define DIR_BACKWARD   2

#define MAX_ACCEL    0.1

PwmOut MotorL_In1(p26);
PwmOut MotorL_In2(p25);
PwmOut MotorR_In1(p24);
PwmOut MotorR_In2(p23);
InterruptIn  nFault(p18);
DigitalOut nReset(p20);
DigitalOut nSleep(p19);

AnalogIn Mic(p15);
PwmOut Audio(p21);
DigitalOut nShd(p30);

Serial Zigbit(p13, p14); // tx, rx
DigitalOut ZigbitReset(p8);

Serial Eye(p9, p10);
Serial BlueTooth(p28, p27);

DigitalOut led1(LED1);
DigitalOut led2(LED2);
PwmOut led3(LED3);
PwmOut led4(LED4);

Ticker led_toggle;
Ticker vel_smooth;

float prev_speed_l;
float prev_speed_r;
float new_speed_l;
float new_speed_r;

void motorSpeed(PwmOut *in1, PwmOut *in2, float speed) {
  if (speed > 0) {
    *in1 = speed;
    *in2 = 0;
  } else {
    *in1 = 0;
    *in2 = -speed;
  }
}

void setSpeed(float ml, float mr) {
  led3 = ml > 0 ? ml : -ml;
  led4 = mr > 0 ? mr : -mr;
  new_speed_r = ml;
  new_speed_l = mr;
}

void vel_smoother(void) {
  float delta_t = 1/100.0;
  float ml = prev_speed_l;
  float mr = prev_speed_r;

  if (new_speed_l > prev_speed_l) {
    ml = prev_speed_l + delta_t * MAX_ACCEL;
  }
  if (new_speed_r > prev_speed_r) {
    mr = prev_speed_r + delta_t * MAX_ACCEL;
  }
  if (new_speed_l < prev_speed_l) {
    ml = prev_speed_l - delta_t * MAX_ACCEL;
  }
  if (new_speed_r < prev_speed_r) {
    mr = prev_speed_r - delta_t * MAX_ACCEL;
  }
  prev_speed_l = ml;
  prev_speed_r = mr;
  motorSpeed(&MotorL_In1, &MotorL_In2, ml);
  motorSpeed(&MotorR_In1, &MotorR_In2, mr);
}

char AnalizeSpeedCommand(char command, float* motor_r, float* motor_l) {
  float mr;
  float ml;

  // Reteruns 0 if command is not speed related.
  if (command < 10) return 0;

  if (command < RIGHT + 10) {
    mr = 1;
    ml = 1;
  }
  if (command >= BACKWARD) {
    command -= BACKWARD;
    mr = -1;
    ml = -1;
  }

  // go left
  if (command > LEFT && command < RIGHT) {
    mr *= (command - LEFT / 10.0);
    ml *= 0;
  }
  // go right
  if (command > RIGHT) {
    ml *= (command - RIGHT / 10.0);
    mr *= 0;
  }
  *motor_l = ml;
  *motor_r = mr;
  return 1;
}

void controlCommand(char command) {
  switch (command) {
    case STOP:
      // disable h bridge
      nSleep = 0;
      break;
    case START:
      // Enable h bridge
      nSleep = 1;
      break;
    case NEXT_EYE_MODE:
      Eye.putc('n');
      break;
    case PREV_EYE_MODE:
      Eye.putc('p');
      break;
  }
}

void resetMotor(void) {
  led2 = 1;
  nReset = 1;
  wait_ms(1);
  nReset = 0;
  wait_ms(500);
  nReset = 1;
}

void led_toggler(void) {
  led1 = !led1;
}

// main program loop:
int main(void)
{
  char command;
  float mr;
  float ml;

  prev_speed_l = 0;
  prev_speed_r = 0;
  new_speed_l = 0;
  new_speed_r = 0;

  Zigbit.baud(38400);
  Eye.baud(115200);

  //resetMotor();

  nFault.mode(PullUp);
  nFault.fall(&resetMotor);
  led_toggle.attach(&led_toggler, 0.2);
  vel_smooth.attach(&vel_smoother, 1/100.0);

  nSleep = 1.0;
  nReset = 1.0;
  while(1)
  {
    mr = 0.5;
    ml = 0.5;
    setSpeed(mr, ml);
    wait(5);
    mr = -0.5;
    ml = -0.5;
    setSpeed(mr, ml);
    wait(5);
    mr = 0.5;
    ml = -0.5;
    setSpeed(mr, ml);
    wait(5);
    mr = -0.5;
    ml = 0.5;
    setSpeed(mr, ml);
    wait(5);

    command = Zigbit.getc();
    if (AnalizeSpeedCommand(command, &ml, &mr)) {
      setSpeed(mr, ml);
    } else {
      //controlCommand(command);
    }
  }
}
