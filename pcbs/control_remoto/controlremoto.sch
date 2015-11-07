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
LIBS:audio-jack-stereo
LIBS:controlremoto-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Control remoto - Marciano"
Date "mié 15 abr 2015"
Rev "1.0"
Comp "Club de Robótica - FIUBA"
Comment1 "Julieta Marasco - Ariel Burman"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4500 2300 0    60   ~ 0
RXD = TX
Text Notes 4500 2200 0    60   ~ 0
TXD = RX
$Comp
L +5V #PWR01
U 1 1 4D407D30
P 5200 1050
F 0 "#PWR01" H 5200 1140 20  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1400 1050 60  0001 C CNN
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
NoConn ~ 5550 2900
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
Text Label 7900 2100 2    60   ~ 0
ACEL_INT2
Text Label 7900 2000 2    60   ~ 0
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
L GND #PWR02
U 1 1 4D37716E
P 10450 3300
F 0 "#PWR02" H 10450 3300 30  0001 C CNN
F 1 "GND" H 10450 3230 30  0001 C CNN
F 2 "" H 10450 3300 60  0001 C CNN
F 3 "" H 10450 3300 60  0001 C CNN
	1    10450 3300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 4D376D61
P 3900 1200
F 0 "#PWR03" H 3900 1290 20  0001 C CNN
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
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" H 3050 3100 60  0001 C CNN
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
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" H 2850 3100 60  0001 C CNN
F 3 "" H 2850 3100 60  0001 C CNN
	1    2850 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 4D3759D2
P 3900 2050
F 0 "#PWR04" H 3900 2050 30  0001 C CNN
F 1 "GND" H 3900 1980 30  0001 C CNN
F 2 "" H 3900 2050 60  0001 C CNN
F 3 "" H 3900 2050 60  0001 C CNN
	1    3900 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 4D375976
P 2100 1350
F 0 "#PWR05" H 2100 1350 30  0001 C CNN
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
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" H 2900 1950 60  0001 C CNN
F 3 "" H 2900 1950 60  0001 C CNN
	1    2900 1950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 4D3758AC
P 1000 2050
F 0 "#PWR06" H 1000 2050 30  0001 C CNN
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
F 2 "Sockets_DIP:DIP-16__300_ELL" H 9800 3550 60  0001 C CNN
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
F 2 "Power_CDR:PTN04050C-EUU" H 2900 1500 60  0001 C CNN
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
F 2 "Popurri_CDR:MBED" H 6500 1950 60  0001 C CNN
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
F 2 "Popurri_CDR:ZIGBIT_DIP_40" H 9600 1900 60  0001 C CNN
F 3 "" H 9600 1900 60  0001 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 55037531
P 800 1600
F 0 "P1" H 800 1750 50  0000 C CNN
F 1 "CONN_BATT" V 900 1600 50  0000 C CNN
F 2 "Popurri_CDR:molex_2_recto" H 800 1600 60  0001 C CNN
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
F 2 "Sockets_DIP:DIP-8__300_ELL" H 1950 3700 60  0001 C CNN
F 3 "" H 1950 3700 60  0000 C CNN
	1    1950 3700
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR07
U 1 1 55036EFD
P 1000 3350
F 0 "#PWR07" H 1000 3200 60  0001 C CNN
F 1 "+3V3" H 1000 3490 60  0000 C CNN
F 2 "" H 1000 3350 60  0000 C CNN
F 3 "" H 1000 3350 60  0000 C CNN
	1    1000 3350
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR08
U 1 1 55036F39
P 2600 3450
F 0 "#PWR08" H 2600 3300 60  0001 C CNN
F 1 "+3V3" H 2600 3590 60  0000 C CNN
F 2 "" H 2600 3450 60  0000 C CNN
F 3 "" H 2600 3450 60  0000 C CNN
	1    2600 3450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR09
U 1 1 55037478
P 2950 2650
F 0 "#PWR09" H 2950 2500 60  0001 C CNN
F 1 "+3V3" H 2950 2790 60  0000 C CNN
F 2 "" H 2950 2650 60  0000 C CNN
F 3 "" H 2950 2650 60  0000 C CNN
	1    2950 2650
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR010
U 1 1 55037912
P 7500 950
F 0 "#PWR010" H 7500 800 60  0001 C CNN
F 1 "+3V3" H 7500 1090 60  0000 C CNN
F 2 "" H 7500 950 60  0000 C CNN
F 3 "" H 7500 950 60  0000 C CNN
	1    7500 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR011
U 1 1 55037C8C
P 10750 2700
F 0 "#PWR011" H 10750 2550 60  0001 C CNN
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
F 1 "CONN_BTN00" V 1050 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 950 4900 60  0001 C CNN
F 3 "" H 950 4900 60  0000 C CNN
	1    950  4900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 55038444
P 1550 4900
F 0 "P4" H 1550 5050 50  0000 C CNN
F 1 "CONN_BTN01" V 1650 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1550 4900 60  0001 C CNN
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
F 1 "CONN_BTN02" V 2250 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2150 4900 60  0001 C CNN
F 3 "" H 2150 4900 60  0000 C CNN
	1    2150 4900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P8
U 1 1 55038A39
P 2750 4900
F 0 "P8" H 2750 5050 50  0000 C CNN
F 1 "CONN_BTN03" V 2850 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2750 4900 60  0001 C CNN
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
F 1 "CONN_BTN05" V 1050 5600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 950 5600 60  0001 C CNN
F 3 "" H 950 5600 60  0000 C CNN
	1    950  5600
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P5
U 1 1 55038BE1
P 1550 5600
F 0 "P5" H 1550 5750 50  0000 C CNN
F 1 "CONN_BTN06" V 1650 5600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1550 5600 60  0001 C CNN
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
F 1 "CONN_BTN07" V 2250 5600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2150 5600 60  0001 C CNN
F 3 "" H 2150 5600 60  0000 C CNN
	1    2150 5600
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P9
U 1 1 55038BF7
P 2750 5600
F 0 "P9" H 2750 5750 50  0000 C CNN
F 1 "CONN_BTN08" V 2850 5600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2750 5600 60  0001 C CNN
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
F 1 "CONN_BTN04" V 3450 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3350 4900 60  0001 C CNN
F 3 "" H 3350 4900 60  0000 C CNN
	1    3350 4900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P11
U 1 1 55038D1B
P 3350 5600
F 0 "P11" H 3350 5750 50  0000 C CNN
F 1 "CONN_BTN09" V 3450 5600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3350 5600 60  0001 C CNN
F 3 "" H 3350 5600 60  0000 C CNN
	1    3350 5600
	0    1    1    0   
$EndComp
Text Notes 1950 4300 0    60   ~ 0
BOTONES
Text Label 5200 2700 0    60   ~ 0
BTN_00
Text Label 5200 2600 0    60   ~ 0
BTN_01
Text Label 5200 2500 0    60   ~ 0
BTN_02
Text Label 5200 2400 0    60   ~ 0
BTN_03
Text Label 5200 2000 0    60   ~ 0
BTN_04
Text Label 7900 2800 2    60   ~ 0
BTN_05
Text Label 7900 2700 2    60   ~ 0
BTN_06
Text Label 7900 2600 2    60   ~ 0
BTN_07
Text Label 7900 2500 2    60   ~ 0
BTN_08
Text Label 7900 2400 2    60   ~ 0
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
L R R4
U 1 1 5503BE55
P 5750 4450
F 0 "R4" V 5830 4450 50  0000 C CNN
F 1 "2.2k" V 5757 4451 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5680 4450 30  0001 C CNN
F 3 "" H 5750 4450 30  0000 C CNN
	1    5750 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5503C1EC
P 5450 5250
F 0 "#PWR012" H 5450 5000 60  0001 C CNN
F 1 "GND" H 5450 5100 60  0000 C CNN
F 2 "" H 5450 5250 60  0000 C CNN
F 3 "" H 5450 5250 60  0000 C CNN
	1    5450 5250
	1    0    0    -1  
$EndComp
$Comp
L TL082 U4
U 1 1 5503C54F
P 7050 5400
F 0 "U4" H 7000 5600 60  0000 L CNN
F 1 "TL082" H 7000 5150 60  0000 L CNN
F 2 "Sockets_DIP:DIP-8__300_ELL" H 7050 5400 60  0001 C CNN
F 3 "" H 7050 5400 60  0000 C CNN
	1    7050 5400
	1    0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 5503CEBD
P 6750 5900
F 0 "#PWR013" H 6750 5650 60  0001 C CNN
F 1 "GND" H 6750 5750 60  0000 C CNN
F 2 "" H 6750 5900 60  0000 C CNN
F 3 "" H 6750 5900 60  0000 C CNN
	1    6750 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5503D3DB
P 7050 5000
F 0 "#PWR014" H 7050 4750 60  0001 C CNN
F 1 "GND" H 7050 4850 60  0000 C CNN
F 2 "" H 7050 5000 60  0000 C CNN
F 3 "" H 7050 5000 60  0000 C CNN
	1    7050 5000
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 5503E512
P 6300 4800
F 0 "R6" V 6380 4800 50  0000 C CNN
F 1 "1k" V 6307 4801 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6230 4800 30  0001 C CNN
F 3 "" H 6300 4800 30  0000 C CNN
	1    6300 4800
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 5503F6CC
P 6800 4800
F 0 "R8" V 6880 4800 50  0000 C CNN
F 1 "10k" V 6807 4801 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6730 4800 30  0001 C CNN
F 3 "" H 6800 4800 30  0000 C CNN
	1    6800 4800
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5504021C
P 7800 5400
F 0 "R9" V 7880 5400 50  0000 C CNN
F 1 "820" V 7807 5401 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 7730 5400 30  0001 C CNN
F 3 "" H 7800 5400 30  0000 C CNN
	1    7800 5400
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 55040934
P 8050 4950
F 0 "C4" H 8100 5050 50  0000 L CNN
F 1 "100n" H 8100 4850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2_P5" H 8088 4800 30  0001 C CNN
F 3 "" H 8050 4950 60  0000 C CNN
	1    8050 4950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 55041513
P 8050 4600
F 0 "#PWR015" H 8050 4350 60  0001 C CNN
F 1 "GND" H 8050 4450 60  0000 C CNN
F 2 "" H 8050 4600 60  0000 C CNN
F 3 "" H 8050 4600 60  0000 C CNN
	1    8050 4600
	-1   0    0    1   
$EndComp
$Comp
L TL082 U4
U 2 1 550417E5
P 8800 5300
F 0 "U4" H 8750 5500 60  0000 L CNN
F 1 "TL082" H 8750 5050 60  0000 L CNN
F 2 "Sockets_DIP:DIP-8__300_ELL" H 8800 5300 60  0001 C CNN
F 3 "" H 8800 5300 60  0000 C CNN
	2    8800 5300
	1    0    0    1   
$EndComp
$Comp
L R R10
U 1 1 550419A9
P 9550 5300
F 0 "R10" V 9630 5300 50  0000 C CNN
F 1 "820" V 9557 5301 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 9480 5300 30  0001 C CNN
F 3 "" H 9550 5300 30  0000 C CNN
	1    9550 5300
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 550419B1
P 9800 4850
F 0 "C5" H 9850 4950 50  0000 L CNN
F 1 "100n" H 9850 4750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2_P5" H 9838 4700 30  0001 C CNN
F 3 "" H 9800 4850 60  0000 C CNN
	1    9800 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 550419B8
P 10050 4650
F 0 "#PWR016" H 10050 4400 60  0001 C CNN
F 1 "GND" H 10050 4500 60  0000 C CNN
F 2 "" H 10050 4650 60  0000 C CNN
F 3 "" H 10050 4650 60  0000 C CNN
	1    10050 4650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR017
U 1 1 55041D07
P 8850 4900
F 0 "#PWR017" H 8850 4650 60  0001 C CNN
F 1 "GND" H 8850 4750 60  0000 C CNN
F 2 "" H 8850 4900 60  0000 C CNN
F 3 "" H 8850 4900 60  0000 C CNN
	1    8850 4900
	0    -1   -1   0   
$EndComp
Text Label 5200 2800 0    60   ~ 0
MIC
Text Label 10250 5300 2    60   ~ 0
MIC
Text Notes 5750 3400 0    60   ~ 0
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
	2450 3950 3350 3950
Wire Wire Line
	2450 3500 2600 3500
Wire Wire Line
	5550 2200 5050 2200
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
	10300 3200 10300 3900
Connection ~ 2950 2700
Wire Wire Line
	2950 2650 2950 2700
Wire Wire Line
	3050 2700 3050 2950
Wire Wire Line
	2850 2700 3050 2700
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
	3900 1750 3900 2050
Wire Wire Line
	7600 2200 7400 2200
Wire Wire Line
	3900 1200 3900 1550
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
	5300 4800 5850 4800
Wire Wire Line
	6050 4800 6150 4800
Connection ~ 5950 5750
Wire Wire Line
	5700 5750 5700 5900
Wire Wire Line
	6950 5000 7050 5000
Wire Wire Line
	6550 4800 6550 5300
Wire Wire Line
	7950 5400 8300 5400
Wire Wire Line
	8050 5100 8050 5400
Wire Wire Line
	9700 5300 10250 5300
Wire Wire Line
	9800 5000 9800 5300
Wire Wire Line
	9800 4650 10050 4650
Wire Wire Line
	8300 5200 8300 4650
Wire Wire Line
	8300 4650 9300 4650
Wire Wire Line
	9300 4650 9300 5300
Wire Wire Line
	5550 2800 5200 2800
Wire Notes Line
	4000 3200 4000 6300
Wire Notes Line
	4000 6300 10400 6300
Wire Notes Line
	10400 6300 10400 4200
Wire Wire Line
	5750 4600 5750 4800
Connection ~ 5750 4800
Wire Wire Line
	6450 4800 6650 4800
Connection ~ 6550 4800
Wire Wire Line
	7550 5400 7650 5400
Connection ~ 8050 5400
Wire Wire Line
	8050 4600 8050 4800
Wire Wire Line
	5700 5750 6050 5750
Wire Wire Line
	9300 5300 9400 5300
Connection ~ 9800 5300
Wire Wire Line
	9800 4700 9800 4650
Wire Wire Line
	8700 4900 8850 4900
Wire Wire Line
	2850 2700 2850 2950
Wire Wire Line
	1000 1650 1000 2050
Wire Wire Line
	1850 1850 1850 1950
Wire Wire Line
	1950 1300 1950 1050
Wire Wire Line
	1850 1650 1850 1500
Connection ~ 1850 1500
Wire Wire Line
	800  1050 900  1050
Wire Wire Line
	850  1050 850  1300
$Comp
L +BATT #PWR018
U 1 1 55264BD5
P 800 1050
F 0 "#PWR018" H 800 900 50  0001 C CNN
F 1 "+BATT" H 800 1190 50  0000 C CNN
F 2 "" H 800 1050 60  0000 C CNN
F 3 "" H 800 1050 60  0000 C CNN
	1    800  1050
	1    0    0    -1  
$EndComp
Connection ~ 850  1050
Wire Wire Line
	5750 3950 5750 4300
Wire Wire Line
	8700 5700 9000 5700
Wire Wire Line
	6950 5800 6950 5850
Wire Wire Line
	6950 5850 7200 5850
$Comp
L POT RV1
U 1 1 552858ED
P 6300 5750
F 0 "RV1" H 6300 5650 50  0000 C CNN
F 1 "100K" H 6300 5750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 6300 5750 60  0001 C CNN
F 3 "" H 6300 5750 60  0000 C CNN
	1    6300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5750 6750 5750
Wire Wire Line
	6750 5750 6750 5900
Wire Wire Line
	6300 5600 6300 5500
$Comp
L POT RV2
U 1 1 5528629C
P 7300 4800
F 0 "RV2" H 7300 4700 50  0000 C CNN
F 1 "100k" H 7300 4800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7300 4800 60  0001 C CNN
F 3 "" H 7300 4800 60  0000 C CNN
	1    7300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4800 7050 4800
Wire Wire Line
	7300 4650 7000 4650
Wire Wire Line
	7000 4650 7000 4800
Connection ~ 7000 4800
Wire Wire Line
	7550 4800 7600 4800
Wire Wire Line
	7600 4800 7600 5400
Connection ~ 7600 5400
$Sheet
S 1400 6400 950  700 
U 5528903B
F0 "Parlante" 60
F1 "Parlante.sch" 60
F2 "VCC" I R 2350 6550 60 
F3 "GND" I R 2350 6950 60 
F4 "IN" I R 2350 6750 60 
$EndSheet
Wire Notes Line
	3900 7650 600  7650
Text Notes 1700 6050 0    60   ~ 0
PARLANTE
Text Label 5750 3950 3    60   ~ 0
VCC2
Text Label 5700 5900 1    60   ~ 0
VCC2
Text Label 7200 5850 2    60   ~ 0
VCC2
Text Label 9000 5700 2    60   ~ 0
VCC2
$Comp
L INDUCTOR L1
U 1 1 55288904
P 6300 3700
F 0 "L1" V 6250 3700 50  0000 C CNN
F 1 "1u" V 6400 3700 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" H 6300 3700 60  0001 C CNN
F 3 "" H 6300 3700 60  0000 C CNN
	1    6300 3700
	0    -1   -1   0   
$EndComp
$Comp
L C C10
U 1 1 552889EA
P 6700 3950
F 0 "C10" H 6750 4050 50  0000 L CNN
F 1 "1u" H 6750 3850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L18_W5_P15" H 6738 3800 30  0001 C CNN
F 3 "" H 6700 3950 60  0000 C CNN
	1    6700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3700 6700 3700
Wire Wire Line
	6700 3700 6700 3800
Wire Wire Line
	6700 4100 6700 4200
Wire Wire Line
	6000 3700 5700 3700
$Comp
L GND #PWR019
U 1 1 55288F36
P 6700 4200
F 0 "#PWR019" H 6700 3950 60  0001 C CNN
F 1 "GND" H 6700 4050 60  0000 C CNN
F 2 "" H 6700 4200 60  0000 C CNN
F 3 "" H 6700 4200 60  0000 C CNN
	1    6700 4200
	1    0    0    -1  
$EndComp
Text Label 6650 3700 0    60   ~ 0
VCC2
$Comp
L +5V #PWR020
U 1 1 552893B9
P 5700 3700
F 0 "#PWR020" H 5700 3790 20  0001 C CNN
F 1 "+5V" H 5700 3850 30  0000 C CNN
F 2 "" H 5700 3700 60  0001 C CNN
F 3 "" H 5700 3700 60  0001 C CNN
	1    5700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6550 2600 6550
Wire Wire Line
	2600 6550 2600 6350
Wire Wire Line
	2350 6750 2700 6750
Wire Wire Line
	2350 6950 2600 6950
Wire Wire Line
	2600 6950 2600 7100
Wire Wire Line
	5200 2100 5550 2100
Wire Wire Line
	5200 2000 5550 2000
Wire Wire Line
	7400 2900 7850 2900
Text Label 7850 2900 2    60   ~ 0
Audio
Text Label 2700 6750 2    60   ~ 0
Audio
$Comp
L +5V #PWR021
U 1 1 552E5265
P 2600 6350
F 0 "#PWR021" H 2600 6440 20  0001 C CNN
F 1 "+5V" H 2600 6500 30  0000 C CNN
F 2 "" H 2600 6350 60  0001 C CNN
F 3 "" H 2600 6350 60  0001 C CNN
	1    2600 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 552E549B
P 2600 7100
F 0 "#PWR022" H 2600 6850 60  0001 C CNN
F 1 "GND" H 2600 6950 60  0000 C CNN
F 2 "" H 2600 7100 60  0000 C CNN
F 3 "" H 2600 7100 60  0000 C CNN
	1    2600 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1250 2300 1250
$Comp
L GND #PWR023
U 1 1 552E5EE6
P 1850 1950
F 0 "#PWR023" H 1850 1950 30  0001 C CNN
F 1 "GND" H 1850 1880 30  0001 C CNN
F 2 "" H 1850 1950 60  0001 C CNN
F 3 "" H 1850 1950 60  0001 C CNN
	1    1850 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 552E5F75
P 2650 2000
F 0 "#PWR024" H 2650 2000 30  0001 C CNN
F 1 "GND" H 2650 1930 30  0001 C CNN
F 2 "" H 2650 2000 60  0001 C CNN
F 3 "" H 2650 2000 60  0001 C CNN
	1    2650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1950 2650 1950
Wire Wire Line
	2650 1950 2650 2000
$Comp
L CP_Small C2
U 1 1 552E6E5C
P 3900 1650
F 0 "C2" H 3910 1720 50  0000 L CNN
F 1 "100u" H 3910 1570 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 3900 1650 60  0001 C CNN
F 3 "" H 3900 1650 60  0000 C CNN
	1    3900 1650
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C1
U 1 1 552E70C6
P 1850 1750
F 0 "C1" H 1860 1820 50  0000 L CNN
F 1 "100u" H 1860 1670 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 1850 1750 60  0001 C CNN
F 3 "" H 1850 1750 60  0000 C CNN
	1    1850 1750
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C3
U 1 1 552E96E0
P 5950 4800
F 0 "C3" H 5960 4870 50  0000 L CNN
F 1 "10u" H 5960 4720 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 5950 4800 60  0001 C CNN
F 3 "" H 5950 4800 60  0000 C CNN
	1    5950 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 2800 7400 2800
Wire Wire Line
	7900 2100 7400 2100
Wire Wire Line
	7900 2000 7400 2000
$Comp
L Jack-stereo-gnd J2
U 1 1 5535C583
P 4650 5450
F 0 "J2" H 5050 5800 60  0000 C CNN
F 1 "Jack-stereo-gnd" H 4750 5150 60  0000 C CNN
F 2 "Popurri_CDR:audio-jack-stereo" H 4650 5100 60  0001 C CNN
F 3 "" H 4650 5100 60  0000 C CNN
	1    4650 5450
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P12
U 1 1 5535CC7C
P 5100 4800
F 0 "P12" H 5100 5000 50  0000 C CNN
F 1 "CONN_01X03" V 5200 4800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x03" H 5100 4800 60  0001 C CNN
F 3 "" H 5100 4800 60  0000 C CNN
	1    5100 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 5200 5450 5200
Wire Wire Line
	5450 5200 5450 5250
Wire Wire Line
	6300 5500 6550 5500
Wire Wire Line
	5300 4700 5550 4700
Wire Wire Line
	5300 4900 5550 4900
Text Label 5550 4700 2    60   ~ 0
MicA
Text Label 5550 4900 2    60   ~ 0
MicB
Text Label 5350 5450 2    60   ~ 0
MicA
Wire Wire Line
	5350 5450 5100 5450
Text Label 5350 5550 2    60   ~ 0
MicB
Wire Wire Line
	5350 5550 5100 5550
NoConn ~ 5100 5650
NoConn ~ 5100 5350
$EndSCHEMATC
