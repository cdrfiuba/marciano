/* *************************************
 * Biblioteca para uso del acelerometro MMA7455L
 * Club de Robotica - FIUBA
 */

#include "mma7455l.h"


#define MAX_2G_M  0x04
#define MAX_4G_M  0x08
#define MAX_8G_M  0x00

#define MAX_SENSITIVITY   0x40

#ifdef MAX_G
    #if MAX_G == 2
        #define MAX_G_M      MAX_2G_M
        #define SENSITIVITY  MAX_SENSITIVITY
    #elif MAX_G == 4
        #define MAX_G_M      MAX_4G_M
        #define SENSITIVITY  (MAX_SENSITIVITY>>1)
    #elif MAX_G == 8
        #define MAX_G_M      MAX_8G_M
        #define SENSITIVITY (MAX_SENSITIVITY>>2)
    #else
        #error MAX_G definido incorrectamente. Posibles valores: 2, 4 u 8
    #endif
#else
    #error No se definio MAX_G
#endif
    

#define MODE_STBY_M  0x00
#define MODE_MED_M   0x01
#define MODE_LVD_M   0x02
#define MODE_PULD_M  0x03

#define NO_LEVEL_DET 0x38

#define REG_X10L        0x00
#define REG_X10H        0x01
#define REG_Y10L        0x02
#define REG_Y10H        0x03
#define REG_Z10L        0x04
#define REG_Z10H        0x05
#define REG_X8          0x06
#define REG_Y8          0x07
#define REG_Z8          0x08
#define REG_STATUS      0x09
#define REG_TOUT        0x0B
#define REG_I2CADD      0x0D
#define REG_USRINF      0x0E
#define REG_WHOAMI      0x0F
#define REG_XOFF        0x10
#define REG_XOFFL       0x10
#define REG_XOFFH       0x11
#define REG_YOFF        0x12
#define REG_YOFFL       0x12
#define REG_YOFFH       0x13
#define REG_ZOFF        0x14
#define REG_ZOFFL       0x14
#define REG_ZOFFH       0x15
#define REG_MODCONTROL  0x16
#define REG_CONTROL1    0x18
#define REG_CONTROL2    0x19

//DEBUG
//DigitalOut led(LED1);
Pin ledbg(LED4);
//extern Serial pc;

/*  ----------------------------------------------------
                     Accelerometer
     ---------------------------------------------------*/

Accelerometer::Accelerometer(uint8_t port): _i2c(port) {
    this->_i2c.frequency(100000); //freq de i2c 100KHz
    Delay(0.02); // El acelerometro tarda 20ms en arrancar
    _setup(); // se inicializa el acelerometro
    _calibrate();
}

void Accelerometer::_setup() {
    uint8_t cmd[2];
    cmd[0] = REG_MODCONTROL;  // registro 16h, Mode Control
    cmd[1] = (MAX_G_M | MODE_MED_M);  // 2g + Measurement Mode
    this->_i2c.write(ADDRESS, cmd, 2);
    
    uint8_t respuesta = _check(); // Para ver si se configuro hay que leer el registro 16.
    if (respuesta != (MAX_G_M | MODE_MED_M)) {
        while (1) {
            ledbg = !ledbg;
            Delay(0.25); // Si falla se queda blinkeando el led
        }
    }
}

uint8_t Accelerometer::_check() {
    uint8_t data, reg;
    reg = REG_MODCONTROL;
    this->_i2c.write(ADDRESS, &reg, 1);
    Delay(0.01);
    this->_i2c.read(ADDRESS, &data, 1);
    return data;
}

void Accelerometer::_calibrate(){
    signed char data[3];
    signed short OffT[3];
    for (int i=0; i<BUFFERSIZE ; i++){
        data[0] = _readAccel8(REG_X8);    
        data[1] = _readAccel8(REG_Y8);
        data[2] = _readAccel8(REG_Z8);
        OffT[0] += -(signed short)data[0];
        OffT[1] += -(signed short)data[1];
        OffT[2] += -( (signed short)data[2] - (signed short)SENSITIVITY );

        _writeOffset(OffT);
        Delay(0.008);
        ledbg = !ledbg;
    }

    return;
}

void Accelerometer::_writeOffset(signed short OffsetVec[3]) {
    uint8_t reg[3];

    reg[0] = REG_XOFF;
    reg[1] = (OffsetVec[0]&0x00FF);        //low byte
    reg[2] = ((OffsetVec[0]>>8)&0x0007);   //high byte (solo los 3 primeros bits)
    this->_i2c.write(ADDRESS, reg, 3);

    reg[0] = REG_YOFF;
    reg[1] = (OffsetVec[1]&0x00FF);
    reg[2] = ((OffsetVec[1]>>8)&0x0007);
    this->_i2c.write(ADDRESS, reg, 3);

    reg[0] = REG_ZOFF;
    reg[1] = (OffsetVec[2]&0x00FF);
    reg[2] = ((OffsetVec[2]>>8)&0x0007);
    this->_i2c.write(ADDRESS, reg, 3);

    return;
}

char Accelerometer::_readAccel8(uint8_t registro) {
    uint8_t data, reg;
    reg = registro;
    this->_i2c.write(ADDRESS, &reg, 1);
    Delay(0.004);
    this->_i2c.read(ADDRESS,&data,1);
    return data;
}

int Accelerometer::_readAccel10(uint8_t lowReg, uint8_t highReg) {
    uint8_t result[2];
    uint8_t reg = lowReg;
    this->_i2c.write(ADDRESS, &reg, 1);
    Delay(0.004);
    this->_i2c.read(ADDRESS,result,2);
    int salida = (((int)result[1]) << 8) | ((int)result[0]);
    return salida;
}

float Accelerometer::_calculo8Bit(uint8_t valor) {
    if (valor & (1 << 7)) {
        return (((255-valor) * 2.0) / (float)-127);
    } else {
        return ((valor * 2.0) / (float)127);
    } 
    
}//Te devuelve el valor en "g", en funcion de los datos del acelerometro, con su signo. 

float Accelerometer::_calculo10Bit(int valor) {
    if (valor & (1 << 9)) {
        return (((1023-valor) * 2.0) / (float)-127);
    } else {
        return ((valor * 2.0) / (float)127);
    }
}
//Te devuelve el valor en "g", en funcion de los datos del acelerometro, con su signo. 
//En el modo de 10bits siempre lee hasta 8g. Por eso la cuenta es algo diferente.

float Accelerometer::getXAxis8(){ return _calculo8Bit(_readAccel8(REG_X8)); }
float Accelerometer::getYAxis8(){ return _calculo8Bit(_readAccel8(REG_Y8)); }
float Accelerometer::getZAxis8(){ return _calculo8Bit(_readAccel8(REG_Z8)); }
float Accelerometer::getXAxis10(){ return _calculo10Bit(_readAccel10(REG_X10L, REG_X10H)); }
float Accelerometer::getYAxis10(){ return _calculo10Bit(_readAccel10(REG_Y10L, REG_Y10H)); }
float Accelerometer::getZAxis10(){ return _calculo10Bit(_readAccel10(REG_Z10L, REG_Z10H)); }

void Accelerometer::get8BitVector(float vec[]) {
    vec[0] = getXAxis8();
    vec[1] = getYAxis8();
    vec[2] = getZAxis8();
}

void Accelerometer::get10BitVector(float vec[]) {
    vec[0] = getXAxis10();
    vec[1] = getYAxis10();
    vec[2] = getZAxis10();
}

/*  ----------------------------------------------------
                     Accelerometer Int 
     ---------------------------------------------------*/
/*
AccelerometerInt::AccelerometerInt(uint8_t port, const PinName * p_int): _i2c(port) {
    this->_i2c.frequency(100000); //freq de i2c 100KHz   PROBAR MAYOR FREC
    this->_int = Pin_Init(p_int, 1, Input, PullUp);
//    Pin_Int_Attach(_int, _recibirStream8bits, IOIntRise);
    //Pin_Int_Attach(_int, AccelerometerInt::_recibirStream8bits, IOIntRise);
    Delay(0.02); // El acelerometro tarda 20ms en arrancar
    _setup(); // se inicializa el acelerometro

    _recibirStream8bits();
}

void AccelerometerInt::_setup() {
    uint8_t cmd[2];

    _cleanBuffer();
    
    cmd[0] = REG_MODCONTROL;  // registro 16h, Mode Control 1
    cmd[1] = (MAX_G_M | MODE_MED_M);  // 2g + Measurement Mode
    this->_i2c.write(ADDRESS, cmd, 2);
    
    uint8_t respuesta = _check(); // Para ver si se configuro hay que leer el registro 16.
    if (respuesta != (MAX_G_M | MODE_MED_M) ) {
        // Si falla se queda blinkeando el led
        while(1) {
            ledbg = !ledbg;
            Delay(0.025);
        }
    }
   
    _resetOffset();
    _calibrate();
    _getOffset();
    for(uint8_t i = 0; i<3; i++) {
        if (_OffsetLeido[i]!=_Offset[i]) {
                // Si falla se queda blinkeando el led
            while(1) {
                ledbg = !ledbg;
                Delay(0.025);
            }
        }
    }
}

uint8_t AccelerometerInt::_check() {
    uint8_t data, reg;
    reg = REG_MODCONTROL;
    this->_i2c.write(ADDRESS, &reg, 1);
    Delay(0.01);
    this->_i2c.read(ADDRESS, &data, 1);
    return data;
}

void AccelerometerInt::_cleanBuffer() {
    _p_write = 0;
    int i;
    for (i=0; i<BUFFERSIZE; i++) {
        _buffer[i][0] = 0;
        _buffer[i][1] = 0;
        _buffer[i][2] = 0;
    }
}

void AccelerometerInt::_recibirStream8bits() {
    uint8_t data[3], reg;
    reg = REG_X8;
    this->_i2c.write(ADDRESS, &reg, 1);
    this->_i2c.read(ADDRESS,data,3);
    _buffer[_p_write][0] = (int8_t)data[0];
    _buffer[_p_write][1] = (int8_t)data[1];
    _buffer[_p_write][2] = (int8_t)data[2];
    _p_write++;
    if (_p_write == BUFFERSIZE) _p_write = 0;
}
*/
/*
void AccelerometerInt::_recibirStream10bits() {
    char data[6], reg;
    reg = REG_X10L;
    this->_i2c.write(ADDRESS, &reg, 1);
    this->_i2c.read(ADDRESS,data,6);
    _data10[0] = ( (((short)data[1])<<8) | ((short)data[0]) );
    _data10[1] = ( (((short)data[3])<<8) | ((short)data[2]) );
    _data10[2] = ( (((short)data[5])<<8) | ((short)data[4]) );
    for(int i=0; i<3; i++) if (_data10[i] & (1<<9)) _data10[i] -= 1024;
}
*/
/*
void AccelerometerInt::getDataProm(int Num, float prom_xyz[3]) {
    int i;
    signed short prom[3];
    
    for(i = 0; i < 3; i++) prom[i] = 0;
    
    // El puntero auxiliar apunta a la proxima direccion a escribir
    // Antes de la primera lectura se resta 1
    unsigned int _p_aux = _p_write;
    
    for(i = 0; i < Num; i++){
        // Si el puntero vale 0 es porque antes se leyo de la posicion 0
        // O el puntero de escritura estaba en 0
        // En ambos casos se asigna BUFFSIZE y luego se resta 1, 
        // con lo cual apunta a la ultima posicion
        if(!_p_aux) _p_aux = BUFFERSIZE;
        _p_aux--;
        prom[0] += (signed short)_buffer[_p_aux][0];
        prom[1] += (signed short)_buffer[_p_aux][1];
        prom[2] += (signed short)_buffer[_p_aux][2];
    }

    for(i = 0; i < 3; i++) prom_xyz[i] = prom[i] / (float)(Num*SENSITIVITY);
    
    return;
}

void AccelerometerInt::getData(int8_t vec[3]) {
    unsigned int _p_aux = _p_write;
    if(!_p_aux) _p_aux = BUFFERSIZE;
    _p_aux--;
    
    vec[0] = _buffer[_p_aux][0];
    vec[1] = _buffer[_p_aux][1];
    vec[2] = _buffer[_p_aux][2];
}


void AccelerometerInt::getData(float vec[3]) {
    unsigned int _p_aux = _p_write;
    if(!_p_aux) _p_aux = BUFFERSIZE;
    _p_aux--;
    vec[0] = (_buffer[_p_aux][0])/(float)SENSITIVITY;
    vec[1] = (_buffer[_p_aux][1])/(float)SENSITIVITY;
    vec[2] = (_buffer[_p_aux][2])/(float)SENSITIVITY;
}
*/
/*
void AccelerometerInt::getData10(signed short vec[3]) {
    _recibirStream10bits();
    vec[0] = _data10[0];
    vec[1] = _data10[1];
    vec[2] = _data10[2];
}

void AccelerometerInt::getData10(float vec[3]) {
    _recibirStream10bits();
    vec[0] = _data10[0]/(float)MAX_SENSITIVITY;
    vec[1] = _data10[1]/(float)MAX_SENSITIVITY;
    vec[2] = _data10[2]/(float)MAX_SENSITIVITY;
}
*/
/*
void AccelerometerInt::_writeOffset(signed short OffsetVec[3]) {
    uint8_t reg[3];

    reg[0] = REG_XOFF;
    reg[1] = (OffsetVec[0]&0x00FF);        //low byte
    reg[2] = ((OffsetVec[0]>>8)&0x0007);   //high byte (solo los 3 primeros bits)
    this->_i2c.write(ADDRESS, reg, 3);

    reg[0] = REG_YOFF;
    reg[1] = (OffsetVec[1]&0x00FF);
    reg[2] = ((OffsetVec[1]>>8)&0x0007);
    this->_i2c.write(ADDRESS, reg, 3);

    reg[0] = REG_ZOFF;
    reg[1] = (OffsetVec[2]&0x00FF);
    reg[2] = ((OffsetVec[2]>>8)&0x0007);
    this->_i2c.write(ADDRESS, reg, 3);

    return;
}

void AccelerometerInt::_resetOffset(){
    signed short Off[3];
    Off[0] = 0;
    Off[1] = 0;
    Off[2] = 0;
    _writeOffset(Off);
    _Offset[0] = 0;
    _Offset[1] = 0;
    _Offset[2] = 0;
    return;
}

*/
/*
void AccelerometerInt::_calibrate(){
    int8_t temp[3];
    for (int i=0; i<BUFFERSIZE ; i++){
        while(_int==SW_OFF){};
        _recibirStream8bits();
        getData(temp);
/ *        if (_buffer[i][0] & 0x80)
            Xcal += 2*(signed short)(255-_buffer[i][0]);
        else
            Xcal -= 2*(signed short)_buffer[i][0];
        if (_buffer[i][1] & 0x80)
            Ycal += 2*(signed short)(255-_buffer[i][1]);
        else
            Ycal -= 2*(signed short)_buffer[i][1];
        if (_buffer[i][2] & 0x80)
            Zcal += 2*(signed short)(255-_buffer[i][2]-128);
        else
            Zcal -= 2*((signed short)_buffer[i][2]-128);
  * /
        _Offset[0] += -(signed short)temp[0];
        _Offset[1] += -(signed short)temp[1];
        _Offset[2] += -( (signed short)temp[2] - (signed short)SENSITIVITY );

        _writeOffset(_Offset);
    }

    return;
}
*/
 /*
void AccelerometerInt::_getOffset(){
    uint8_t reg[2];
    
    reg[0] = REG_XOFF;
    this->_i2c.write(ADDRESS, reg, 1);
    this->_i2c.read(ADDRESS, reg, 2);
    if (reg[1]&0x04) reg[1] |= 0xF8;
    _OffsetLeido[0] = (reg[1]<<8) + reg[0];
    
    reg[0] = REG_YOFF;
    this->_i2c.write(ADDRESS, reg, 1);
    this->_i2c.read(ADDRESS, reg, 2);
    if (reg[1]&0x04) reg[1] |= 0xF8;
    _OffsetLeido[1] = (reg[1]<<8) + reg[0];

    reg[0] = REG_ZOFF;
    this->_i2c.write(ADDRESS, reg, 1);
    this->_i2c.read(ADDRESS, reg, 2);
    if (reg[1]&0x04) reg[1] |= 0xF8;
    _OffsetLeido[2] = (reg[1]<<8) + reg[0];

    return;
}

void AccelerometerInt::getOffset(signed short Offset[6]) {
    Offset[0] = _Offset[0];
    Offset[1] = _OffsetLeido[0];
    Offset[2] = _Offset[1];
    Offset[3] = _OffsetLeido[1];
    Offset[4] = _Offset[2];
    Offset[5] = _OffsetLeido[2];
}
*/
/*  ----------------------------------------------------
                     Accelerometer 10 Int 
     ---------------------------------------------------*/
/*
Accelerometer10Int::Accelerometer10Int(uint8_t port, uint8_t p_int): _i2c(port) {
    _i2c.frequency(100000); //freq de i2c 100KHz   PROBAR MAYOR FREC
    this->_int = Pin_Init((PinName) p_int, 1, Input, PullUp);
//    Pin_Int_Attach(_int, _recibirStream, IOIntRise);
    //Pin_Int_Attach(_int, Accelerometer10Int::_recibirStream, IOIntRise);
    Delay(0.02); // El acelerometro tarda 20ms en arrancar
    _setup(); // se inicializa el acelerometro

    _recibirStream();
}

void Accelerometer10Int::_setup() {
    uint8_t cmd[2];

    _cleanBuffer();
    
    cmd[0] = REG_MODCONTROL;  // registro 16h, Mode Control 1
    cmd[1] = (MAX_G_M | MODE_MED_M);  // 2g + Measurement Mode
    _i2c.write(ADDRESS, cmd, 2);

    
    uint8_t respuesta = _check(); // Para ver si se configuro hay que leer el registro 16.
    if (respuesta != (MAX_G_M | MODE_MED_M) ) {
        // Si falla se queda blinkeando el led
        while(1) {
            ledbg = !ledbg;
            Delay(0.025);
        }
    }
//contador = 0;
   
    _resetOffset();
    _calibrate();
//printf("X = %d || Y = %d || Z = %d \n",_Offset[0],_Offset[1],_Offset[2]);
    _getOffset();
    for(uint8_t i = 0; i<3; i++) {
        if (_OffsetLeido[i]!=_Offset[i]) {
                // Si falla se queda blinkeando el led
            while(1) {
                ledbg = !ledbg;
                Delay(0.025);
            }
        }
    }
//led =1;
}

uint8_t Accelerometer10Int::_check() {
    uint8_t data, reg;
    reg = REG_MODCONTROL;
    _i2c.write(ADDRESS, &reg, 1);
    Delay(0.01);
    _i2c.read(ADDRESS, &data, 1);
    return data;
}

void Accelerometer10Int::_cleanBuffer() {
    _p_write = 0;
    int i;
    for (i=0; i<BUFFERSIZE; i++) {
        _buffer[i][0] = 0;
        _buffer[i][1] = 0;
        _buffer[i][2] = 0;
    }
}

void Accelerometer10Int::_recibirStream() {
    uint8_t data[6], reg;
    reg = REG_X10L;
    _i2c.write(ADDRESS, &reg, 1);
    _i2c.read(ADDRESS, data, 6);
    _buffer[_p_write][0] = ( (((short)data[1])<<8) | ((short)data[0]) );
    _buffer[_p_write][1] = ( (((short)data[3])<<8) | ((short)data[2]) );
    _buffer[_p_write][2] = ( (((short)data[5])<<8) | ((short)data[4]) );
    for(int i=0; i<3; i++) if (_buffer[_p_write][i] & (1<<9)) _buffer[_p_write][i] -= 1024;
    _p_write++;
    if (_p_write == BUFFERSIZE) _p_write = 0;
}

void Accelerometer10Int::getDataProm(int Num, float prom_xyz[3]) {
    int i;
    signed short prom[3];
    
    for(i = 0; i < 3; i++) prom[i] = 0;
    
    // El puntero auxiliar apunta a la proxima direccion a escribir
    // Antes de la primera lectura se resta 1
    unsigned int _p_aux = _p_write;
    
    for(i = 0; i < Num; i++){
        // Si el puntero vale 0 es porque antes se leyo de la posicion 0
        // O el puntero de escritura estaba en 0
        // En ambos casos se asigna BUFFSIZE y luego se resta 1, 
        // con lo cual apunta a la ultima posicion
        if(!_p_aux) _p_aux = BUFFERSIZE;
        _p_aux--;
        prom[0] += _buffer[_p_aux][0];
        prom[1] += _buffer[_p_aux][1];
        prom[2] += _buffer[_p_aux][2];
    }

    for(i = 0; i < 3; i++) prom_xyz[i] = prom[i] / (float)(Num*SENSITIVITY);
    
    return;
}

void Accelerometer10Int::getData(signed short vec[3]) {
    unsigned int _p_aux = _p_write;
    if(!_p_aux) _p_aux = BUFFERSIZE;
    _p_aux--;
    
    vec[0] = _buffer[_p_aux][0];
    vec[1] = _buffer[_p_aux][1];
    vec[2] = _buffer[_p_aux][2];
}


void Accelerometer10Int::getData(float vec[3]) {
    unsigned int _p_aux = _p_write;
    if(!_p_aux) _p_aux = BUFFERSIZE;
    _p_aux--;
    vec[0] = (_buffer[_p_aux][0])/(float)SENSITIVITY;
    vec[1] = (_buffer[_p_aux][1])/(float)SENSITIVITY;
    vec[2] = (_buffer[_p_aux][2])/(float)SENSITIVITY;
}


void Accelerometer10Int::_writeOffset(signed short OffsetVec[3]) {
    uint8_t reg[3];

    reg[0] = REG_XOFF;
    reg[1] = (OffsetVec[0]&0x00FF);        //low byte
    reg[2] = ((OffsetVec[0]>>8)&0x0007);   //high byte (solo los 3 primeros bits)
    _i2c.write(ADDRESS, reg, 3);

    reg[0] = REG_YOFF;
    reg[1] = (OffsetVec[1]&0x00FF);
    reg[2] = ((OffsetVec[1]>>8)&0x0007);
    _i2c.write(ADDRESS, reg, 3);

    reg[0] = REG_ZOFF;
    reg[1] = (OffsetVec[2]&0x00FF);
    reg[2] = ((OffsetVec[2]>>8)&0x0007);
    _i2c.write(ADDRESS, reg, 3);

    return;
}

void Accelerometer10Int::_resetOffset(){
    signed short Off[3];
    Off[0] = 0;
    Off[1] = 0;
    Off[2] = 0;
    _writeOffset(Off);
    _Offset[0] = 0;
    _Offset[1] = 0;
    _Offset[2] = 0;
    return;
}

*/
/*
void Accelerometer10Int::_calibrate(){
    signed short temp[3];
    for (int i=0; i<BUFFERSIZE ; i++){
        while(_int==0){};
        _recibirStream();
        getData(temp);
/ *        if (_buffer[i][0] & 0x80)
            Xcal += 2*(signed short)(255-_buffer[i][0]);
        else
            Xcal -= 2*(signed short)_buffer[i][0];
        if (_buffer[i][1] & 0x80)
            Ycal += 2*(signed short)(255-_buffer[i][1]);
        else
            Ycal -= 2*(signed short)_buffer[i][1];
        if (_buffer[i][2] & 0x80)
            Zcal += 2*(signed short)(255-_buffer[i][2]-128);
        else
            Zcal -= 2*((signed short)_buffer[i][2]-128);
  * /
        _Offset[0] += -(signed short)temp[0];
        _Offset[1] += -(signed short)temp[1];
        _Offset[2] += -( (signed short)temp[2] - (signed short)SENSITIVITY );

        _writeOffset(_Offset);
    }

    return;
}
*/
/*
void Accelerometer10Int::_getOffset(){
    uint8_t reg[2];
    
    reg[0] = REG_XOFF;
    _i2c.write(ADDRESS, reg, 1);
    _i2c.read(ADDRESS, reg, 2);
    if (reg[1]&0x04) reg[1] |= 0xF8;
    _OffsetLeido[0] = (reg[1]<<8) + reg[0];
    
    reg[0] = REG_YOFF;
    _i2c.write(ADDRESS, reg, 1);
    _i2c.read(ADDRESS, reg, 2);
    if (reg[1]&0x04) reg[1] |= 0xF8;
    _OffsetLeido[1] = (reg[1]<<8) + reg[0];

    reg[0] = REG_ZOFF;
    _i2c.write(ADDRESS, reg, 1);
    _i2c.read(ADDRESS, reg, 2);
    if (reg[1]&0x04) reg[1] |= 0xF8;
    _OffsetLeido[2] = (reg[1]<<8) + reg[0];

    return;
}

void Accelerometer10Int::getOffset(signed short Offset[6]) {
    Offset[0] = _Offset[0];
    Offset[1] = _OffsetLeido[0];
    Offset[2] = _Offset[1];
    Offset[3] = _OffsetLeido[1];
    Offset[4] = _Offset[2];
    Offset[5] = _OffsetLeido[2];
}

*/
