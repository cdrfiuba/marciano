#ifndef __MMA7455L_H_
#define __MMA7455L_H_

#include "libmanyuc.h"

#define MAX_G    2  //2, 4 u 8  Maxima g medida
#define BWIDTH   0  //0: 62.5hz tasa de muestre de 125hz   1: 125hz tasa de muestreo de 250hz

#define ADDRESS 0x3A
#define BUFFERSIZE 50

/*  ----------------------------------------------------
                 Accelerometer
     ---------------------------------------------------*/
class Accelerometer {
public:
    Accelerometer(uint8_t port);
    /*Pre: Se debe haber pedido un vector del tipo flotante de al menos 3 elementos*/
    /*Pos: Se almacena el valor de g para x,y,z en el vector recibido*/
    void get8BitVector(float *);
    /*Pre: Se debe haber pedido un vector del tipo flotante de al menos 3 elementos*/
    /*Pos: Se almacena el valor de g para x,y,z en el vector recibido*/
    void get10BitVector(float *);
    float getXAxis8(void);
    float getYAxis8(void);
    float getZAxis8(void);
    float getXAxis10(void);
    float getYAxis10(void);
    float getZAxis10(void);
    
private:
    I2C _i2c;

    void _calibrate();
    void _setup();
    uint8_t _check();
    void _writeOffset(signed short OffsetVec[3]);
    int _readAccel10(uint8_t,uint8_t);
    char _readAccel8(uint8_t);
    float _calculo10Bit(int);
    float _calculo8Bit(uint8_t);
};

/*  ----------------------------------------------------
           Accelerometer Int (2g, 4g u 8g resolution)
     ---------------------------------------------------*/
/*
class AccelerometerInt {
public:
    AccelerometerInt(uint8_t port, const PinName * p_int);

    void getData(int8_t vec[3]);
    void getData(float vec[3]);
//    void getData10(signed short vec[3]);
    void getDataProm(int Num, float prom_xyz[3]);
    void getOffset(signed short Offset[6]);

private:
    I2C _i2c;
    Pin_t _int;
    
    signed char _buffer[BUFFERSIZE][3];
    signed short _data10[3];
    unsigned int _p_write;

    void _setup();
    uint8_t _check();
    void _recibirStream8bits();
    void _recibirStream10bits();
    void _cleanBuffer();
    void _calibrate();
    void _resetOffset();
    void _getOffset();
    void _writeOffset(signed short OffsetVec[3]);
unsigned char   contador;
signed short _Offset[3];
signed short _OffsetLeido[3];
};
*/
/*  ----------------------------------------------------
              Accelerometer 10 Int (8G resolution)
     ---------------------------------------------------*/
/*
class Accelerometer10Int {
public:
    Accelerometer10Int(uint8_t port, uint8_t p_int);

    void getData(signed short vec[3]);
    void getData(float vec[3]);
    void getDataProm(int Num, float prom_xyz[3]);
    void getOffset(signed short Offset[6]);

private:
    I2C _i2c;
    Pin _int;
    
    signed short _buffer[BUFFERSIZE][3];
    signed short _data10[3];
    unsigned int _p_write;

    void _setup();
    uint8_t _check();
    void _recibirStream();
    void _cleanBuffer();
    void _calibrate();
    void _resetOffset();
    void _getOffset();
    void _writeOffset(signed short OffsetVec[3]);
signed short _Offset[3];
signed short _OffsetLeido[3];
};
*/
#endif // __I2C_ACCEL_
