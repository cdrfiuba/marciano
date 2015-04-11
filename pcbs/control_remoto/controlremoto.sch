EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:mbed
LIBS:mma7455l_dip8
LIBS:ptn04050c
LIBS:reg104-25
LIBS:zigbit_dual
LIBS:lm386_mod
LIBS:controlremoto-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Control remoto"
Date "28 jan 2011"
Rev "1.0"
Comp "Club de Robótica - FIUBA"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4500 2300 0    60   ~ 0
RXD = TX
Text Notes 4500 2200 0    60   ~ 0
TXD = RX
$Comp
L +5V #PWR12
U 1 1 4D407D30
P 5200 1050
F 0 "#PWR12" H 5200 1140 20  0001 C CNN
F 1 "+5V" H 5200 1140 30  0000 C CNN
F 2 "" H 5200 1050 60  0001 C CNN
F 3 "" H 5200 1050 60  0001 C CNN
	1    5200 1050
	1    0    0    -1  
$EndComp
$Comp
L SPST SW1
U 1 1 4D40792D
P 1400 1050
F 0 "SW1" H 1400 1150 70  0000 C CNN
F 1 "ON/OFF" H 1400 950 70  0000 C CNN
F 2 "PIN_ARRAY_2X1" H 1400 1050 60  0001 C CNN
F 3 "" H 1400 1050 60  0001 C CNN
	1    1400 1050
	1    0    0    -1  
$EndComp
NoConn ~ 7400 1100
NoConn ~ 7400 1200
NoConn ~ 7400 1300
NoConn ~ 7400 1400
NoConn ~ 7400 1500
NoConn ~ 7400 1600
NoConn ~ 7400 1700
NoConn ~ 7400 1800
NoConn ~ 7400 1900
NoConn ~ 7400 2000
NoConn ~ 7400 2100
NoConn ~ 5550 2900
NoConn ~ 5550 2100
NoConn ~ 5550 2000
NoConn ~ 5550 1600
NoConn ~ 5550 1500
NoConn ~ 5550 1400
NoConn ~ 5550 1300
NoConn ~ 5550 1200
Text Label 1950 4500 2    60   ~ 0
BTN_01
Text Label 1350 4500 2    60   ~ 0
BTN_00
NoConn ~ 10550 2650
NoConn ~ 10550 2550
NoConn ~ 10550 2450
NoConn ~ 10550 2350
NoConn ~ 10550 2250
NoConn ~ 10550 2150
NoConn ~ 10550 2050
NoConn ~ 10550 1950
NoConn ~ 10550 1850
NoConn ~ 10550 1550
NoConn ~ 10550 1450
NoConn ~ 10550 1350
NoConn ~ 10550 1250
NoConn ~ 10550 1050
NoConn ~ 10550 950 
NoConn ~ 8650 2850
NoConn ~ 8650 2750
NoConn ~ 8650 2350
NoConn ~ 8650 2250
Text Label 8150 2150 0    60   ~ 0
ZIGBIT_RX
Text Label 8150 2050 0    60   ~ 0
ZIGBIT_TX
NoConn ~ 8650 1950
NoConn ~ 8650 1850
NoConn ~ 8650 1750
Text Label 8150 1650 0    60   ~ 0
ZB_RESET
NoConn ~ 8650 1550
NoConn ~ 8650 1150
NoConn ~ 8650 1050
NoConn ~ 8650 950 
Text Label 1950 4700 2    60   ~ 0
GND
Text Label 1350 4700 2    60   ~ 0
GND
Text Label 10750 2850 2    60   ~ 0
GND
Text Label 10750 1750 2    60   ~ 0
GND
Text Label 5300 1000 0    60   ~ 0
GND
Text Label 750  3650 0    60   ~ 0
ACEL_INT1
Text Label 750  3800 0    60   ~ 0
ACEL_INT2
Text Label 1000 3950 0    60   ~ 0
GND
Text Label 5050 1900 0    60   ~ 0
ACEL_INT2
Text Label 5050 1800 0    60   ~ 0
ACEL_INT1
Text Label 5050 2200 0    60   ~ 0
ZIGBIT_TX
Text Label 5050 2300 0    60   ~ 0
ZIGBIT_RX
Text Label 5050 1700 0    60   ~ 0
ZB_RESET
Text Label 2700 3650 2    60   ~ 0
GND
Text Label 3900 2000 0    60   ~ 0
GND
Text Label 8250 2550 0    60   ~ 0
DIPSW_5
Text Label 8250 2450 0    60   ~ 0
DIPSW_4
Text Label 10950 1650 2    60   ~ 0
DIPSW_7
Text Label 10950 1150 2    60   ~ 0
DIPSW_8
Text Label 8250 2650 0    60   ~ 0
DIPSW_6
Text Label 8250 1450 0    60   ~ 0
DIPSW_3
Text Label 8250 1350 0    60   ~ 0
DIPSW_2
Text Label 8250 1250 0    60   ~ 0
DIPSW_1
Text Label 9050 3900 0    60   ~ 0
DIPSW_8
Text Label 9050 3800 0    60   ~ 0
DIPSW_7
Text Label 9050 3700 0    60   ~ 0
DIPSW_6
Text Label 9050 3600 0    60   ~ 0
DIPSW_5
Text Label 9050 3500 0    60   ~ 0
DIPSW_4
Text Label 9050 3400 0    60   ~ 0
DIPSW_3
Text Label 9050 3300 0    60   ~ 0
DIPSW_2
Text Label 9050 3200 0    60   ~ 0
DIPSW_1
$Comp
L GND #PWR21
U 1 1 4D37716E
P 10450 3300
F 0 "#PWR21" H 10450 3300 30  0001 C CNN
F 1 "GND" H 10450 3230 30  0001 C CNN
F 2 "" H 10450 3300 60  0001 C CNN
F 3 "" H 10450 3300 60  0001 C CNN
	1    10450 3300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR7
U 1 1 4D376D61
P 3900 1200
F 0 "#PWR7" H 3900 1290 20  0001 C CNN
F 1 "+5V" H 3900 1290 30  0000 C CNN
F 2 "" H 3900 1200 60  0001 C CNN
F 3 "" H 3900 1200 60  0001 C CNN
	1    3900 1200
	1    0    0    -1  
$EndComp
Text Label 7600 2300 2    60   ~ 0
SCL
Text Label 7600 2200 2    60   ~ 0
SDA
Text Label 3350 3950 2    60   ~ 0
SDA
Text Label 3350 3800 2    60   ~ 0
SCL
$Comp
L R R3
U 1 1 4D376AC7
P 3050 3100
F 0 "R3" V 3130 3100 50  0000 C CNN
F 1 "2k2" V 3050 3100 50  0000 C CNN
F 2 "Discret:R3" H 3050 3100 60  0001 C CNN
F 3 "" H 3050 3100 60  0001 C CNN
	1    3050 3100
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4D376AC1
P 2850 3100
F 0 "R1" V 2930 3100 50  0000 C CNN
F 1 "2k2" V 2850 3100 50  0000 C CNN
F 2 "Discret:R3" H 2850 3100 60  0001 C CNN
F 3 "" H 2850 3100 60  0001 C CNN
	1    2850 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR8
U 1 1 4D3759D2
P 3900 2050
F 0 "#PWR8" H 3900 2050 30  0001 C CNN
F 1 "GND" H 3900 1980 30  0001 C CNN
F 2 "" H 3900 2050 60  0001 C CNN
F 3 "" H 3900 2050 60  0001 C CNN
	1    3900 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 4D375976
P 2100 1350
F 0 "#PWR4" H 2100 1350 30  0001 C CNN
F 1 "GND" H 2100 1280 30  0001 C CNN
F 2 "" H 2100 1350 60  0001 C CNN
F 3 "" H 2100 1350 60  0001 C CNN
	1    2100 1350
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 4D375962
P 2900 1950
F 0 "R2" V 2980 1950 50  0000 C CNN
F 1 "inf" V 2900 1950 50  0000 C CNN
F 2 "Discret:R3" H 2900 1950 60  0001 C CNN
F 3 "" H 2900 1950 60  0001 C CNN
	1    2900 1950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR2
U 1 1 4D3758AC
P 1000 2050
F 0 "#PWR2" H 1000 2050 30  0001 C CNN
F 1 "GND" H 1000 1980 30  0001 C CNN
F 2 "" H 1000 2050 60  0001 C CNN
F 3 "" H 1000 2050 60  0001 C CNN
	1    1000 2050
	1    0    0    -1  
$EndComp
$Comp
L DIL16 P13
U 1 1 4D375826
P 9800 3550
F 0 "P13" H 9800 4000 60  0000 C CNN
F 1 "DIPSWITCH" H 9800 3050 50  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 9800 3550 60  0001 C CNN
F 3 "" H 9800 3550 60  0001 C CNN
	1    9800 3550
	1    0    0    -1  
$EndComp
$Comp
L PTN4050 U2
U 1 1 4D3756F7
P 2900 1500
F 0 "U2" H 2900 1650 60  0000 C CNN
F 1 "PTN4050" H 2900 1350 60  0000 C CNN
F 2 "PTN04050CAH" H 2900 1500 60  0001 C CNN
F 3 "" H 2900 1500 60  0001 C CNN
	1    2900 1500
	1    0    0    -1  
$EndComp
$Comp
L MBED U3
U 1 1 4D3756DA
P 6500 1950
F 0 "U3" H 6500 2250 60  0000 C CNN
F 1 "MBED" H 6500 2550 60  0000 C CNN
F 2 "MBED-DOBLE" H 6500 1950 60  0001 C CNN
F 3 "" H 6500 1950 60  0001 C CNN
	1    6500 1950
	1    0    0    -1  
$EndComp
$Comp
L ZIGBIT_DUAL_DIP U5
U 1 1 4D3756BD
P 9600 1900
F 0 "U5" H 9050 3000 60  0000 C CNN
F 1 "ZIGBIT_DUAL_DIP" H 9850 3000 60  0000 C CNN
F 2 "ZIGBIT_DIP_40" H 9600 1900 60  0001 C CNN
F 3 "" H 9600 1900 60  0001 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 55037531
P 800 1600
F 0 "P1" H 800 1750 50  0000 C CNN
F 1 "CONN_01X02" V 900 1600 50  0000 C CNN
F 2 "molex_2_recto" H 800 1600 60  0001 C CNN
F 3 "" H 800 1600 60  0000 C CNN
	1    800  1600
	-1   0    0    1   
$EndComp
$Comp
L MMA7455L_DIP8 U1
U 1 1 55036E3B
P 1950 3700
F 0 "U1" H 1350 4050 60  0000 C CNN
F 1 "MMA7455L_DIP8" H 1900 4050 60  0000 C CNN
F 2 "Sockets_DIP:DIP-8__300" H 1950 3700 60  0001 C CNN
F 3 "" H 1950 3700 60  0000 C CNN
	1    1950 3700
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR3
U 1 1 55036EFD
P 1000 3350
F 0 "#PWR3" H 1000 3200 60  0001 C CNN
F 1 "+3V3" H 1000 3490 60  0000 C CNN
F 2 "" H 1000 3350 60  0000 C CNN
F 3 "" H 1000 3350 60  0000 C CNN
	1    1000 3350
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR5
U 1 1 55036F39
P 2600 3450
F 0 "#PWR5" H 2600 3300 60  0001 C CNN
F 1 "+3V3" H 2600 3590 60  0000 C CNN
F 2 "" H 2600 3450 60  0000 C CNN
F 3 "" H 2600 3450 60  0000 C CNN
	1    2600 3450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR6
U 1 1 55037478
P 2950 2650
F 0 "#PWR6" H 2950 2500 60  0001 C CNN
F 1 "+3V3" H 2950 2790 60  0000 C CNN
F 2 "" H 2950 2650 60  0000 C CNN
F 3 "" H 2950 2650 60  0000 C CNN
	1    2950 2650
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR16
U 1 1 55037912
P 7500 950
F 0 "#PWR16" H 7500 800 60  0001 C CNN
F 1 "+3V3" H 7500 1090 60  0000 C CNN
F 2 "" H 7500 950 60  0000 C CNN
F 3 "" H 7500 950 60  0000 C CNN
	1    7500 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR22
U 1 1 55037C8C
P 10750 2700
F 0 "#PWR22" H 10750 2550 60  0001 C CNN
F 1 "+3V3" H 10750 2840 60  0000 C CNN
F 2 "" H 10750 2700 60  0000 C CNN
F 3 "" H 10750 2700 60  0000 C CNN
	1    10750 2700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 5503811A
P 950 4900
F 0 "P2" H 950 5050 50  0000 C CNN
F 1 "CONN_01X02" V 1050 4900 50  0000 C CNN
F 2 "molex_2_recto" H 950 4900 60  0001 C CNN
F 3 "" H 950 4900 60  0000 C CNN
	1    950  4900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 55038444
P 1550 4900
F 0 "P4" H 1550 5050 50  0000 C CNN
F 1 "CONN_01X02" V 1650 4900 50  0000 C CNN
F 2 "" H 1550 4900 60  0001 C CNN
F 3 "" H 1550 4900 60  0000 C CNN
	1    1550 4900
	0    1    1    0   
$EndComp
Text Label 3150 4500 2    60   ~ 0
BTN_03
Text Label 2550 4500 2    60   ~ 0
BTN_02
Text Label 3150 4700 2    60   ~ 0
GND
Text Label 2550 4700 2    60   ~ 0
GND
$Comp
L CONN_01X02 P6
U 1 1 55038A32
P 2150 4900
F 0 "P6" H 2150 5050 50  0000 C CNN
F 1 "CONN_01X02" V 2250 4900 50  0000 C CNN
F 2 "" H 2150 4900 60  0001 C CNN
F 3 "" H 2150 4900 60  0000 C CNN
	1    2150 4900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P8
U 1 1 55038A39
P 2750 4900
F 0 "P8" H 2750 5050 50  0000 C CNN
F 1 "CONN_01X02" V 2850 4900 50  0000 C CNN
F 2 "" H 2750 4900 60  0001 C CNN
F 3 "" H 2750 4900 60  0000 C CNN
	1    2750 4900
	0    1    1    0   
$EndComp
Text Label 1950 5200 2    60   ~ 0
BTN_06
Text Label 1350 5200 2    60   ~ 0
BTN_05
Text Label 1950 5400 2    60   ~ 0
GND
Text Label 1350 5400 2    60   ~ 0
GND
$Comp
L CONN_01X02 P3
U 1 1 55038BDA
P 950 5600
F 0 "P3" H 950 5750 50  0000 C CNN
F 1 "CONN_01X02" V 1050 5600 50  0000 C CNN
F 2 "molex_2_recto" H 950 5600 60  0001 C CNN
F 3 "" H 950 5600 60  0000 C CNN
	1    950  5600
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P5
U 1 1 55038BE1
P 1550 5600
F 0 "P5" H 1550 5750 50  0000 C CNN
F 1 "CONN_01X02" V 1650 5600 50  0000 C CNN
F 2 "" H 1550 5600 60  0001 C CNN
F 3 "" H 1550 5600 60  0000 C CNN
	1    1550 5600
	0    1    1    0   
$EndComp
Text Label 3150 5200 2    60   ~ 0
BTN_08
Text Label 2550 5200 2    60   ~ 0
BTN_07
Text Label 3150 5400 2    60   ~ 0
GND
Text Label 2550 5400 2    60   ~ 0
GND
$Comp
L CONN_01X02 P7
U 1 1 55038BF0
P 2150 5600
F 0 "P7" H 2150 5750 50  0000 C CNN
F 1 "CONN_01X02" V 2250 5600 50  0000 C CNN
F 2 "" H 2150 5600 60  0001 C CNN
F 3 "" H 2150 5600 60  0000 C CNN
	1    2150 5600
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P9
U 1 1 55038BF7
P 2750 5600
F 0 "P9" H 2750 5750 50  0000 C CNN
F 1 "CONN_01X02" V 2850 5600 50  0000 C CNN
F 2 "" H 2750 5600 60  0001 C CNN
F 3 "" H 2750 5600 60  0000 C CNN
	1    2750 5600
	0    1    1    0   
$EndComp
Text Label 3750 5200 2    60   ~ 0
BTN_09
Text Label 3750 4500 2    60   ~ 0
BTN_04
Text Label 3750 5400 2    60   ~ 0
GND
Text Label 3750 4700 2    60   ~ 0
GND
$Comp
L CONN_01X02 P10
U 1 1 55038D14
P 3350 4900
F 0 "P10" H 3350 5050 50  0000 C CNN
F 1 "CONN_01X02" V 3450 4900 50  0000 C CNN
F 2 "" H 3350 4900 60  0001 C CNN
F 3 "" H 3350 4900 60  0000 C CNN
	1    3350 4900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P11
U 1 1 55038D1B
P 3350 5600
F 0 "P11" H 3350 5750 50  0000 C CNN
F 1 "CONN_01X02" V 3450 5600 50  0000 C CNN
F 2 "" H 3350 5600 60  0001 C CNN
F 3 "" H 3350 5600 60  0000 C CNN
	1    3350 5600
	0    1    1    0   
$EndComp
Text Notes 1950 4300 0    60   ~ 0
BOTONES
Text Label 5200 2400 0    60   ~ 0
BTN_00
Text Label 5200 2500 0    60   ~ 0
BTN_01
Text Label 5200 2600 0    60   ~ 0
BTN_02
Text Label 5200 2700 0    60   ~ 0
BTN_03
Text Label 7900 2400 2    60   ~ 0
BTN_04
Text Label 7900 2500 2    60   ~ 0
BTN_05
Text Label 7900 2600 2    60   ~ 0
BTN_06
Text Label 7900 2700 2    60   ~ 0
BTN_07
Text Label 7900 2800 2    60   ~ 0
BTN_08
Text Label 7900 2900 2    60   ~ 0
BTN_09
Text Notes 2100 800  0    60   ~ 0
ALIMENTACION
Text Notes 750  2600 0    60   ~ 0
ACELEROMETRO
Text Notes 8100 4150 0    60   ~ 0
COMUNICACION
Text Notes 4500 800  0    60   ~ 0
MICRO
$Comp
L CONN_01X02 P12
U 1 1 5503BCE2
P 4500 4850
F 0 "P12" H 4500 5000 50  0000 C CNN
F 1 "CONN_01X02" V 4600 4850 50  0000 C CNN
F 2 "" H 4500 4850 60  0001 C CNN
F 3 "" H 4500 4850 60  0000 C CNN
	1    4500 4850
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 5503BE55
P 4950 4450
F 0 "R4" V 5030 4450 50  0000 C CNN
F 1 "R" V 4957 4451 50  0000 C CNN
F 2 "" V 4880 4450 30  0001 C CNN
F 3 "" H 4950 4450 30  0000 C CNN
	1    4950 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR10
U 1 1 5503C1EC
P 4950 5100
F 0 "#PWR10" H 4950 4850 60  0001 C CNN
F 1 "GND" H 4950 4950 60  0000 C CNN
F 2 "" H 4950 5100 60  0000 C CNN
F 3 "" H 4950 5100 60  0000 C CNN
	1    4950 5100
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5503C36B
P 5300 4800
F 0 "C3" H 5350 4900 50  0000 L CNN
F 1 "10u" H 5350 4700 50  0000 L CNN
F 2 "" H 5338 4650 30  0001 C CNN
F 3 "" H 5300 4800 60  0000 C CNN
	1    5300 4800
	0    -1   -1   0   
$EndComp
$Comp
L TL082 U4
U 1 1 5503C54F
P 6650 5400
F 0 "U4" H 6600 5600 60  0000 L CNN
F 1 "TL082" H 6600 5150 60  0000 L CNN
F 2 "" H 6650 5400 60  0001 C CNN
F 3 "" H 6650 5400 60  0000 C CNN
	1    6650 5400
	1    0    0    1   
$EndComp
$Comp
L R R5
U 1 1 5503C85C
P 5250 5750
F 0 "R5" V 5330 5750 50  0000 C CNN
F 1 "100k" V 5257 5751 50  0000 C CNN
F 2 "" V 5180 5750 30  0001 C CNN
F 3 "" H 5250 5750 30  0000 C CNN
	1    5250 5750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR13
U 1 1 5503CEBD
P 6350 5900
F 0 "#PWR13" H 6350 5650 60  0001 C CNN
F 1 "GND" H 6350 5750 60  0000 C CNN
F 2 "" H 6350 5900 60  0000 C CNN
F 3 "" H 6350 5900 60  0000 C CNN
	1    6350 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 5503D3DB
P 6650 5000
F 0 "#PWR14" H 6650 4750 60  0001 C CNN
F 1 "GND" H 6650 4850 60  0000 C CNN
F 2 "" H 6650 5000 60  0000 C CNN
F 3 "" H 6650 5000 60  0000 C CNN
	1    6650 5000
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 5503E512
P 5900 4800
F 0 "R6" V 5980 4800 50  0000 C CNN
F 1 "1k" V 5907 4801 50  0000 C CNN
F 2 "" V 5830 4800 30  0001 C CNN
F 3 "" H 5900 4800 30  0000 C CNN
	1    5900 4800
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 5503F6CC
P 6400 4800
F 0 "R8" V 6480 4800 50  0000 C CNN
F 1 "10k" V 6407 4801 50  0000 C CNN
F 2 "" V 6330 4800 30  0001 C CNN
F 3 "" H 6400 4800 30  0000 C CNN
	1    6400 4800
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5504021C
P 7400 5400
F 0 "R9" V 7480 5400 50  0000 C CNN
F 1 "820" V 7407 5401 50  0000 C CNN
F 2 "" V 7330 5400 30  0001 C CNN
F 3 "" H 7400 5400 30  0000 C CNN
	1    7400 5400
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 55040934
P 7650 4950
F 0 "C4" H 7700 5050 50  0000 L CNN
F 1 "100n" H 7700 4850 50  0000 L CNN
F 2 "" H 7688 4800 30  0001 C CNN
F 3 "" H 7650 4950 60  0000 C CNN
	1    7650 4950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR17
U 1 1 55041513
P 7650 4600
F 0 "#PWR17" H 7650 4350 60  0001 C CNN
F 1 "GND" H 7650 4450 60  0000 C CNN
F 2 "" H 7650 4600 60  0000 C CNN
F 3 "" H 7650 4600 60  0000 C CNN
	1    7650 4600
	-1   0    0    1   
$EndComp
$Comp
L TL082 U4
U 2 1 550417E5
P 8600 5300
F 0 "U4" H 8550 5500 60  0000 L CNN
F 1 "TL082" H 8550 5050 60  0000 L CNN
F 2 "" H 8600 5300 60  0001 C CNN
F 3 "" H 8600 5300 60  0000 C CNN
	2    8600 5300
	1    0    0    1   
$EndComp
$Comp
L R R10
U 1 1 550419A9
P 9350 5300
F 0 "R10" V 9430 5300 50  0000 C CNN
F 1 "820" V 9357 5301 50  0000 C CNN
F 2 "" V 9280 5300 30  0001 C CNN
F 3 "" H 9350 5300 30  0000 C CNN
	1    9350 5300
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 550419B1
P 9600 4850
F 0 "C5" H 9650 4950 50  0000 L CNN
F 1 "100n" H 9650 4750 50  0000 L CNN
F 2 "" H 9638 4700 30  0001 C CNN
F 3 "" H 9600 4850 60  0000 C CNN
	1    9600 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR20
U 1 1 550419B8
P 9850 4650
F 0 "#PWR20" H 9850 4400 60  0001 C CNN
F 1 "GND" H 9850 4500 60  0000 C CNN
F 2 "" H 9850 4650 60  0000 C CNN
F 3 "" H 9850 4650 60  0000 C CNN
	1    9850 4650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR18
U 1 1 55041D07
P 8650 4900
F 0 "#PWR18" H 8650 4650 60  0001 C CNN
F 1 "GND" H 8650 4750 60  0000 C CNN
F 2 "" H 8650 4900 60  0000 C CNN
F 3 "" H 8650 4900 60  0000 C CNN
	1    8650 4900
	0    -1   -1   0   
$EndComp
Text Label 5200 2800 0    60   ~ 0
MIC
Text Label 10050 5300 2    60   ~ 0
MIC
Text Notes 6050 3700 0    60   ~ 0
MICROFONO
Wire Wire Line
	7500 950  7500 1000
Wire Wire Line
	7500 1000 7400 1000
Wire Wire Line
	5200 1050 5200 1100
Wire Wire Line
	1750 1500 2300 1500
Wire Wire Line
	1750 1500 1750 1300
Wire Wire Line
	1750 1300 1950 1300
Wire Wire Line
	1950 1050 1900 1050
Connection ~ 3500 1250
Connection ~ 2300 1250
Wire Wire Line
	8650 2150 8150 2150
Wire Wire Line
	8650 2050 8150 2050
Wire Wire Line
	8650 1650 8150 1650
Wire Wire Line
	1950 4500 1500 4500
Wire Wire Line
	1500 4500 1500 4700
Wire Wire Line
	1600 4700 1950 4700
Wire Wire Line
	1000 4700 1350 4700
Wire Wire Line
	5300 1000 5550 1000
Wire Wire Line
	750  3800 1250 3800
Wire Wire Line
	750  3650 1250 3650
Wire Wire Line
	1000 3950 1250 3950
Wire Wire Line
	5050 1800 5550 1800
Wire Wire Line
	2450 3950 3350 3950
Wire Wire Line
	2450 3500 2600 3500
Wire Wire Line
	5550 2200 5050 2200
Connection ~ 2250 1950
Wire Wire Line
	2250 1250 2250 1950
Wire Wire Line
	3050 1950 3500 1950
Wire Wire Line
	3500 1950 3500 1750
Wire Wire Line
	10550 1150 10950 1150
Wire Wire Line
	8650 2550 8250 2550
Wire Wire Line
	8650 1450 8250 1450
Wire Wire Line
	8650 1250 8250 1250
Wire Wire Line
	9050 3800 9450 3800
Wire Wire Line
	9050 3600 9450 3600
Wire Wire Line
	9050 3400 9450 3400
Wire Wire Line
	9050 3200 9450 3200
Connection ~ 10300 3300
Wire Wire Line
	10300 3300 10150 3300
Connection ~ 10300 3500
Wire Wire Line
	10300 3500 10150 3500
Connection ~ 10300 3700
Wire Wire Line
	10300 3700 10150 3700
Wire Wire Line
	10300 3900 10150 3900
Wire Wire Line
	10300 3900 10300 3200
Connection ~ 2950 2700
Wire Wire Line
	2950 2650 2950 2700
Wire Wire Line
	3050 2700 3050 2950
Wire Wire Line
	3050 2700 2850 2700
Wire Wire Line
	2450 3650 2700 3650
Wire Wire Line
	7400 2300 7600 2300
Connection ~ 2850 3800
Wire Wire Line
	2850 3250 2850 3800
Wire Wire Line
	3500 1250 3900 1250
Wire Wire Line
	2100 1250 2100 1350
Wire Wire Line
	2300 1250 2100 1250
Connection ~ 2250 1250
Wire Wire Line
	3900 1800 3900 2050
Wire Wire Line
	7600 2200 7400 2200
Wire Wire Line
	3900 1200 3900 1500
Connection ~ 3900 1250
Wire Wire Line
	3050 3250 3050 3950
Connection ~ 3050 3950
Wire Wire Line
	10300 3800 10150 3800
Connection ~ 10300 3800
Wire Wire Line
	10300 3600 10150 3600
Connection ~ 10300 3600
Wire Wire Line
	10300 3400 10150 3400
Connection ~ 10300 3400
Wire Wire Line
	10150 3200 10450 3200
Wire Wire Line
	10450 3200 10450 3300
Connection ~ 10300 3200
Wire Wire Line
	9050 3300 9450 3300
Wire Wire Line
	9050 3500 9450 3500
Wire Wire Line
	9050 3700 9450 3700
Wire Wire Line
	9050 3900 9450 3900
Wire Wire Line
	8650 1350 8250 1350
Wire Wire Line
	8650 2450 8250 2450
Wire Wire Line
	8650 2650 8250 2650
Wire Wire Line
	10550 1650 10950 1650
Wire Wire Line
	5550 1700 5050 1700
Wire Wire Line
	5550 2300 5050 2300
Wire Wire Line
	2450 3800 3350 3800
Wire Wire Line
	5050 1900 5550 1900
Wire Wire Line
	10550 1750 10750 1750
Wire Wire Line
	10550 2850 10750 2850
Wire Wire Line
	900  4500 1350 4500
Wire Wire Line
	5200 1100 5550 1100
Wire Wire Line
	10750 2700 10750 2750
Wire Wire Line
	10750 2750 10550 2750
Wire Wire Line
	2600 3500 2600 3450
Wire Wire Line
	1000 1300 1000 1550
Wire Wire Line
	850  1300 1000 1300
Wire Wire Line
	1250 3500 1000 3500
Wire Wire Line
	1000 3500 1000 3350
Wire Wire Line
	900  4500 900  4700
Wire Wire Line
	3150 4500 2700 4500
Wire Wire Line
	2700 4500 2700 4700
Wire Wire Line
	2800 4700 3150 4700
Wire Wire Line
	2200 4700 2550 4700
Wire Wire Line
	2100 4500 2550 4500
Wire Wire Line
	2100 4500 2100 4700
Wire Wire Line
	1950 5200 1500 5200
Wire Wire Line
	1500 5200 1500 5400
Wire Wire Line
	1600 5400 1950 5400
Wire Wire Line
	1000 5400 1350 5400
Wire Wire Line
	900  5200 1350 5200
Wire Wire Line
	900  5200 900  5400
Wire Wire Line
	3150 5200 2700 5200
Wire Wire Line
	2700 5200 2700 5400
Wire Wire Line
	2800 5400 3150 5400
Wire Wire Line
	2200 5400 2550 5400
Wire Wire Line
	2100 5200 2550 5200
Wire Wire Line
	2100 5200 2100 5400
Wire Wire Line
	3750 5200 3300 5200
Wire Wire Line
	3300 5200 3300 5400
Wire Wire Line
	3400 5400 3750 5400
Wire Wire Line
	3400 4700 3750 4700
Wire Wire Line
	3300 4500 3750 4500
Wire Wire Line
	3300 4500 3300 4700
Wire Notes Line
	600  4300 600  7650
Wire Notes Line
	600  5800 3900 5800
Wire Notes Line
	3900 4300 3900 7650
Wire Notes Line
	3900 4300 600  4300
Wire Wire Line
	7400 2400 7900 2400
Wire Wire Line
	7400 2500 7900 2500
Wire Wire Line
	7400 2600 7900 2600
Wire Wire Line
	7400 2700 7900 2700
Wire Wire Line
	7400 2800 7900 2800
Wire Wire Line
	7400 2900 7900 2900
Wire Wire Line
	5550 2400 5200 2400
Wire Wire Line
	5550 2500 5200 2500
Wire Wire Line
	5550 2600 5200 2600
Wire Wire Line
	5550 2700 5200 2700
Wire Notes Line
	600  2300 4300 2300
Wire Notes Line
	4300 2300 4300 800 
Wire Notes Line
	4300 800  600  800 
Wire Notes Line
	600  800  600  2300
Wire Notes Line
	600  2400 600  4100
Wire Notes Line
	600  4100 3500 4100
Wire Notes Line
	3500 4100 3500 2400
Wire Notes Line
	3500 2400 600  2400
Wire Notes Line
	8000 650  8000 4200
Wire Notes Line
	8000 4200 11100 4200
Wire Notes Line
	11100 4200 11100 600 
Wire Notes Line
	11100 600  4400 600 
Wire Notes Line
	8000 600  8000 900 
Wire Notes Line
	4400 600  4400 3200
Wire Notes Line
	4000 3200 8000 3200
Wire Wire Line
	4700 4800 5150 4800
Wire Wire Line
	4700 4900 4950 4900
Wire Wire Line
	4950 4900 4950 5100
Wire Wire Line
	5450 4800 5750 4800
Connection ~ 5550 5750
Wire Wire Line
	5000 5750 5000 5900
Wire Wire Line
	6550 5000 6650 5000
Wire Wire Line
	6150 5500 5550 5500
Wire Wire Line
	5550 5500 5550 5750
Wire Wire Line
	6150 4800 6150 5300
Wire Wire Line
	7550 5400 8100 5400
Wire Wire Line
	7650 5100 7650 5400
Wire Wire Line
	9500 5300 10050 5300
Wire Wire Line
	9600 5000 9600 5300
Wire Wire Line
	9600 4650 9850 4650
Wire Wire Line
	8100 5200 8100 4650
Wire Wire Line
	8100 4650 9100 4650
Wire Wire Line
	9100 4650 9100 5300
Wire Wire Line
	5550 2800 5200 2800
Wire Notes Line
	4000 3200 4000 6300
Wire Notes Line
	4000 6300 10400 6300
Wire Notes Line
	10400 6300 10400 4200
Wire Wire Line
	4950 4600 4950 4800
Connection ~ 4950 4800
Wire Wire Line
	6050 4800 6250 4800
Connection ~ 6150 4800
Wire Wire Line
	7150 5400 7250 5400
Connection ~ 7650 5400
Wire Wire Line
	7650 4600 7650 4800
Wire Wire Line
	5100 5750 5000 5750
Wire Wire Line
	9100 5300 9200 5300
Connection ~ 9600 5300
Wire Wire Line
	9600 4700 9600 4650
Wire Wire Line
	8500 4900 8650 4900
Wire Wire Line
	2850 2700 2850 2950
Wire Wire Line
	1000 1650 1000 2050
Wire Wire Line
	1850 1900 1850 1950
Wire Wire Line
	1850 1950 2750 1950
Wire Wire Line
	1950 1300 1950 1050
$Comp
L C C2
U 1 1 55263B14
P 3900 1650
F 0 "C2" H 3925 1750 50  0000 L CNN
F 1 "100uF" H 3925 1550 50  0000 L CNN
F 2 "" H 3938 1500 30  0000 C CNN
F 3 "" H 3900 1650 60  0000 C CNN
	1    3900 1650
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 55263B77
P 1850 1750
F 0 "C1" H 1875 1850 50  0000 L CNN
F 1 "100uF" H 1875 1650 50  0000 L CNN
F 2 "" H 1888 1600 30  0000 C CNN
F 3 "" H 1850 1750 60  0000 C CNN
	1    1850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1600 1850 1500
Connection ~ 1850 1500
Wire Wire Line
	800  1050 900  1050
Wire Wire Line
	850  1050 850  1300
$Comp
L +BATT #PWR1
U 1 1 55264BD5
P 800 1050
F 0 "#PWR1" H 800 900 50  0001 C CNN
F 1 "+BATT" H 800 1190 50  0000 C CNN
F 2 "" H 800 1050 60  0000 C CNN
F 3 "" H 800 1050 60  0000 C CNN
	1    800  1050
	1    0    0    -1  
$EndComp
Connection ~ 850  1050
Connection ~ 2250 1500
Wire Wire Line
	4950 3950 4950 4300
Wire Wire Line
	8500 5700 8800 5700
Wire Wire Line
	6550 5800 6550 5850
Wire Wire Line
	6550 5850 6800 5850
$Comp
L POT RV1
U 1 1 552858ED
P 5900 5750
F 0 "RV1" H 5900 5650 50  0000 C CNN
F 1 "100K" H 5900 5750 50  0000 C CNN
F 2 "" H 5900 5750 60  0000 C CNN
F 3 "" H 5900 5750 60  0000 C CNN
	1    5900 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5750 5650 5750
Wire Wire Line
	6150 5750 6350 5750
Wire Wire Line
	6350 5750 6350 5900
Wire Wire Line
	5900 5600 5900 5500
Connection ~ 5900 5500
$Comp
L POT RV2
U 1 1 5528629C
P 6900 4800
F 0 "RV2" H 6900 4700 50  0000 C CNN
F 1 "100k" H 6900 4800 50  0000 C CNN
F 2 "" H 6900 4800 60  0000 C CNN
F 3 "" H 6900 4800 60  0000 C CNN
	1    6900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4800 6650 4800
Wire Wire Line
	6900 4650 6600 4650
Wire Wire Line
	6600 4650 6600 4800
Connection ~ 6600 4800
Wire Wire Line
	7150 4800 7200 4800
Wire Wire Line
	7200 4800 7200 5400
Connection ~ 7200 5400
$Sheet
S 1400 6400 950  700 
U 5528903B
F0 "Parlante" 60
F1 "Parlante.sch" 60
$EndSheet
Wire Notes Line
	3900 7650 600  7650
Text Notes 1700 6050 0    60   ~ 0
PARLANTE
Text Label 4950 3950 3    60   ~ 0
VCC1
Text Label 5000 5900 1    60   ~ 0
VCC2
Text Label 6800 5850 2    60   ~ 0
VCC2
Text Label 8800 5700 2    60   ~ 0
VCC2
$EndSCHEMATC
