#include "libmanyuc.h"
#include "mma7455l.h"
#include "car_commands.h"
#include <stdio.h>
#include <stdlib.h>
//#include "audio.h"

bool moving;

void show_angle(Bus pins, float x) {

    int vel = (int)(x * 10);
    if (vel == 0)      pins = 6;
    else if (vel < -5) pins = 1;
    else if (vel < 0)  pins = 2;
    else if (vel < 6)  pins = 4;
    else               pins = 8;

}

// Gets the next command to the car
unsigned char get_command(float *vect, Pin left, Pin right)
{
    unsigned char r = 0;

    // Buttons are inverse enabled
    if (left == 0) 
      r = STOP;
    if (right == 0)
      r += START;
/*
 * else if ((right == 0) & (left == 1))
      r = START;
    else if ( (right == 0) & (left == 0))
      r = NEXT_EYE_MODE; // Start (line follower if Stop+Start)
*/
    // If buttons are enabled, return now.
    if (r != 0) return r;
    
    // Read current (Y, Z) position
    int velY = (int)(vect[1]*10);
    int velZ = (int)(vect[2]*10);

    // Capping
    if (velY >= 10)  velY = 9;
    if (velY <= -10) velY = -9;
    
    // Center position
    if ((-1 <= velY) && (velY <= 1)) {
        r = CENTER;
    } else if (velY > 1) {
        r = LEFT + velY;
    } else {
        r = RIGHT + ((-1) * velY);
    }
    
    // Backward
    if (velZ <= 0) {
        r += BACKWARD;
    }

    return r;
}

// Sends the next command to the car
void send_car_command(Serial cmdLink, float *vect, Pin left, Pin right) {
    unsigned char cmd = get_command(vect, left, right);
    cmdLink.putByte(cmd);
}

// Shows the current state of the accelerometer in the PC
void send_data_pc(Serial pc, float *vect) {
    fprintf(pc, "%d; %0d; %0d\r\n", 
            (int) (vect[0] * 10), (int) (vect[1] * 10), (int) (vect[2]* 10));
}

uint8_t getButtons() {
    uint8_t r = 0;
    // Buttons are inverse enabled
    if (b9 == 0) 
      r = STOP;
    else if (b8 == 0)
      r = START;
    else if (b7 == 0)
      r = EYES_ON;
    else if (b6 == 0)
      r = EYES_OFF;
    else if (b5 == 0)
      r = AUDIO;
    else if (b4 == 0)
      r = EYES_UPDW;
    else if (b3 == 0)
      r = EYES_CIRCLE;
    else if (b2 == 0)
      r = EYES_BLINK;
    else if (b1 == 0)
      r = EYES_WINKY;
    else if (b0 == 0)
      r = EYES_ANGRY;
    return r;
}



int main() {

    // Serial port through USB
    Serial pc(0, 9600);   
    moving = false;
    // Zigbit connection
    Serial cmdLink(1, 38400);
    Pin rstLink(P18, 1, Output);
    rstLink = 1;

    //audio_init();
    // Leds on the board
    Bus leds(4, LED1, LED2, LED3, LED4);
    leds.mode(Output);

    // Buttons on the board
    Pin b0(P18, 2, Input, PullUp);
    Pin b1(P17, 2, Input, PullUp);
    Pin b2(P16, 2, Input, PullUp);
    Pin b3(P15, 2, Input, PullUp);
    Pin b4(P11, 2, Input, PullUp);
    Pin b5(P22, 2, Input, PullUp);
    Pin b6(P23, 2, Input, PullUp);
    Pin b7(P24, 2, Input, PullUp);
    Pin b8(P25, 2, Input, PullUp);
    Pin b9(P26, 2, Input, PullUp);

    // Small pause before callibration
	  Delay(1);
    // Create and initialize Accelerometer
    Accelerometer acer(2);
    
    float vect[3];
    uint8_t btn = 0, cmd = 0;
    int vel =0;
    
    while(1)
    {
        btn = getButtons();        
        //uint8_t s1 = get_audio();
        //if (s1 == 1) leds = 1;
        //else leds = 0;
        acer.get10BitVector(vect);
        //show_angle(leds, vect[1]);
        //send_data_pc(pc, vect);
        //send_car_command(cmdLink, vect, b0, b1);

/*        leds = 0;
        if (b0 == 0) 
          leds = 1;
        else if (b1 == 0)
          leds = 2;
        else if (b2 == 0)
          leds = 3;
        else if (b3 == 0)
          leds = 4;
        else if (b4 == 0)
          leds = 5;
        else if (b5 == 0)
          leds = 6;
        else if (b6 == 0)
          leds = 7;
        else if (b7 == 0)
          leds = 8;
        else if (b8 == 0)
          leds = 9;
        else if (b9 == 0)
          leds = 10;
          */
        // Small pause between measurements
        Delay(0.1); 
    }
}
// vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
