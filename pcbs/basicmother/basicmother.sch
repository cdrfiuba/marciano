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
LIBS:zigbit_dual
LIBS:ptn04050c
LIBS:ptn78000w
LIBS:drv8432
LIBS:lm4950
LIBS:drv8843
LIBS:lmz12002
LIBS:basicmother-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date "11 jan 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8000 5700 0    60   ~ 0
~SLEEP
Text Label 8000 5150 0    60   ~ 0
PWM_B1
Text Label 8000 5000 0    60   ~ 0
PWM_A2
Text Label 8000 5550 0    60   ~ 0
~RESET
Text Label 8000 4850 0    60   ~ 0
PWM_A1
Text Label 8000 5850 0    60   ~ 0
~FAULT
Text Label 8000 5300 0    60   ~ 0
PWM_B2
$Comp
L MBED U2
U 1 1 52D07D57
P 2400 6350
F 0 "U2" H 2400 6650 60  0000 C CNN
F 1 "MBED" H 2400 6950 60  0000 C CNN
F 2 "Popurri_CDR:MBED" H 2400 6350 60  0001 C CNN
F 3 "" H 2400 6350 60  0000 C CNN
	1    2400 6350
	1    0    0    -1  
$EndComp
$Comp
L ZIGBIT_DUAL_DIP U1
U 1 1 52D07DB1
P 2350 3750
F 0 "U1" H 1800 4850 60  0000 C CNN
F 1 "ZIGBIT_DUAL_DIP" H 2600 4850 60  0000 C CNN
F 2 "Popurri_CDR:ZIGBIT_DIP_40" H 2350 3750 60  0001 C CNN
F 3 "" H 2350 3750 60  0000 C CNN
	1    2350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3900 900  3900
Wire Wire Line
	1400 4000 900  4000
Text Label 900  3900 0    60   ~ 0
ZIGBIT_TX
Text Label 900  4000 0    60   ~ 0
ZIGBIT_RX
Wire Wire Line
	1450 6600 950  6600
Wire Wire Line
	1450 6700 950  6700
Text Label 950  6600 0    60   ~ 0
ZIGBIT_TX
Text Label 950  6700 0    60   ~ 0
ZIGBIT_RX
$Comp
L DIL16 P1
U 1 1 52D07F82
P 2100 1600
F 0 "P1" H 2100 2050 60  0000 C CNN
F 1 "DIL16" V 2100 1600 50  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 2100 1600 60  0001 C CNN
F 3 "" H 2100 1600 60  0000 C CNN
	1    2100 1600
	1    0    0    -1  
$EndComp
Text Label 1200 1250 0    60   ~ 0
DIPSW_1
Wire Wire Line
	1200 1250 1750 1250
Wire Wire Line
	1200 1350 1750 1350
Wire Wire Line
	1200 1450 1750 1450
Wire Wire Line
	1200 1550 1750 1550
Wire Wire Line
	1200 1650 1750 1650
Wire Wire Line
	1200 1750 1750 1750
Wire Wire Line
	1200 1850 1750 1850
Wire Wire Line
	1200 1950 1750 1950
Text Label 1200 1350 0    60   ~ 0
DIPSW_2
Text Label 1200 1450 0    60   ~ 0
DIPSW_3
Text Label 1200 1550 0    60   ~ 0
DIPSW_4
Text Label 1200 1650 0    60   ~ 0
DIPSW_5
Text Label 1200 1750 0    60   ~ 0
DIPSW_6
Text Label 1200 1850 0    60   ~ 0
DIPSW_7
Text Label 1200 1950 0    60   ~ 0
DIPSW_8
Wire Wire Line
	2450 1950 2450 1250
Wire Wire Line
	2450 1250 2700 1250
$Comp
L GND #PWR01
U 1 1 52D080A9
P 2700 1250
F 0 "#PWR01" H 2700 1250 30  0001 C CNN
F 1 "GND" H 2700 1180 30  0001 C CNN
F 2 "" H 2700 1250 60  0000 C CNN
F 3 "" H 2700 1250 60  0000 C CNN
	1    2700 1250
	0    -1   -1   0   
$EndComp
Text Label 850  3100 0    60   ~ 0
DIPSW_1
Wire Wire Line
	850  3100 1400 3100
Wire Wire Line
	850  3200 1400 3200
Text Label 850  3200 0    60   ~ 0
DIPSW_2
Text Label 850  3300 0    60   ~ 0
DIPSW_3
Wire Wire Line
	1400 3300 850  3300
Wire Wire Line
	850  4300 1400 4300
Wire Wire Line
	850  4400 1400 4400
Wire Wire Line
	850  4500 1400 4500
Text Label 850  4300 0    60   ~ 0
DIPSW_4
Text Label 850  4400 0    60   ~ 0
DIPSW_5
Text Label 850  4500 0    60   ~ 0
DIPSW_6
Text Label 3750 3500 2    60   ~ 0
DIPSW_7
Text Label 3750 3000 2    60   ~ 0
DIPSW_8
Wire Wire Line
	3300 5400 3750 5400
Wire Wire Line
	3750 5400 3750 4600
Wire Wire Line
	3750 4600 3300 4600
Wire Wire Line
	1200 5050 3300 5050
Wire Wire Line
	3300 5050 3300 4700
Wire Wire Line
	1050 5400 1450 5400
$Comp
L GND #PWR02
U 1 1 52D0823D
P 1050 5400
F 0 "#PWR02" H 1050 5400 30  0001 C CNN
F 1 "GND" H 1050 5330 30  0001 C CNN
F 2 "" H 1050 5400 60  0000 C CNN
F 3 "" H 1050 5400 60  0000 C CNN
	1    1050 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	1200 5050 1200 5400
Connection ~ 1200 5400
Wire Wire Line
	4850 4900 5200 4900
Wire Wire Line
	5200 5000 4850 5000
Wire Wire Line
	5200 5100 4850 5100
Wire Wire Line
	5200 5200 4850 5200
Wire Wire Line
	5200 5300 4850 5300
Wire Wire Line
	5700 4900 6050 4900
Wire Wire Line
	5700 5100 6050 5100
Wire Wire Line
	5700 5200 6050 5200
Wire Wire Line
	5700 5300 6050 5300
Text Label 4850 4900 0    60   ~ 0
VPRG
Text Label 4850 5000 0    60   ~ 0
SIN
Text Label 4850 5100 0    60   ~ 0
SCLK
Text Label 4850 5200 0    60   ~ 0
XLAT
Text Label 4850 5300 0    60   ~ 0
BLANK
Text Label 6050 5200 2    60   ~ 0
DCPRG
Text Label 6050 5100 2    60   ~ 0
GSCLK
Wire Wire Line
	6050 4900 6050 4750
Wire Wire Line
	6050 5300 6050 5450
$Comp
L GND #PWR03
U 1 1 52D08440
P 6050 5450
F 0 "#PWR03" H 6050 5450 30  0001 C CNN
F 1 "GND" H 6050 5380 30  0001 C CNN
F 2 "" H 6050 5450 60  0000 C CNN
F 3 "" H 6050 5450 60  0000 C CNN
	1    6050 5450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 52D0844F
P 6050 4750
F 0 "#PWR04" H 6050 4840 20  0001 C CNN
F 1 "+5V" H 6050 4900 30  0000 C CNN
F 2 "" H 6050 4750 60  0000 C CNN
F 3 "" H 6050 4750 60  0000 C CNN
	1    6050 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  3500 1400 3500
Text Label 700  3500 0    60   ~ 0
ZIGBIT_RESET
Wire Wire Line
	750  6100 1450 6100
Text Label 750  6100 0    60   ~ 0
ZIGBIT_RESET
Wire Notes Line
	600  2350 3900 2350
Wire Notes Line
	3900 2350 3900 7650
Wire Notes Line
	3900 7650 600  7650
Wire Notes Line
	600  7650 600  2350
NoConn ~ 1400 2800
NoConn ~ 1400 2900
NoConn ~ 1400 3000
NoConn ~ 1400 3400
NoConn ~ 1400 3600
NoConn ~ 1400 3700
NoConn ~ 1400 3800
NoConn ~ 3300 2800
NoConn ~ 3300 2900
NoConn ~ 3300 3100
NoConn ~ 3300 3200
NoConn ~ 3300 3300
NoConn ~ 3300 3400
NoConn ~ 3300 3600
NoConn ~ 3300 3700
NoConn ~ 3300 3800
NoConn ~ 3300 3900
NoConn ~ 3300 4000
NoConn ~ 3300 4100
NoConn ~ 3300 4200
NoConn ~ 3300 4300
NoConn ~ 3300 4400
NoConn ~ 3300 4500
NoConn ~ 1400 4700
NoConn ~ 1400 4600
NoConn ~ 1400 4200
NoConn ~ 1400 4100
Wire Wire Line
	3300 3500 3750 3500
Wire Wire Line
	3300 3000 3750 3000
Wire Wire Line
	3300 6800 3750 6800
Wire Wire Line
	3300 6900 3750 6900
Wire Wire Line
	3300 7000 3750 7000
Wire Wire Line
	3300 7100 3750 7100
Text Label 3750 6800 2    60   ~ 0
PWM_A1
Text Label 3750 6900 2    60   ~ 0
PWM_A2
Text Label 3750 7000 2    60   ~ 0
PWM_B1
Text Label 3750 7100 2    60   ~ 0
PWM_B2
Wire Wire Line
	1450 7100 950  7100
Wire Wire Line
	1450 7200 950  7200
Wire Wire Line
	1450 7300 950  7300
Wire Notes Line
	1000 2050 3000 2050
Wire Notes Line
	3000 2050 3000 850 
Wire Notes Line
	3000 850  1000 850 
Wire Notes Line
	1000 850  1000 2050
Wire Notes Line
	4400 4450 4400 5750
Wire Notes Line
	4400 5750 6700 5750
Wire Notes Line
	6700 5750 6700 4450
Wire Notes Line
	6700 4450 4400 4450
$Comp
L ATMEGA88-P IC1
U 1 1 52D08BC6
P 5800 2350
F 0 "IC1" H 4950 3650 40  0000 L BNN
F 1 "ATMEGA88-P" H 6150 1000 40  0000 L BNN
F 2 "Sockets_DIP:DIP-28__300" H 5800 2350 30  0001 C CIN
F 3 "~" H 5800 2350 60  0000 C CNN
	1    5800 2350
	1    0    0    -1  
$EndComp
Wire Notes Line
	4350 800  8450 800 
Wire Notes Line
	4350 4100 8450 4100
Wire Notes Line
	4350 4100 4350 800 
Text Notes 1700 1000 0    60   ~ 0
DIPSWITCH
NoConn ~ 5700 5000
Wire Wire Line
	6700 1300 7100 1300
Wire Wire Line
	6700 1200 7100 1200
Wire Wire Line
	6700 1400 7100 1400
Wire Wire Line
	6700 1500 7400 1500
Wire Wire Line
	6700 1700 7400 1700
Wire Wire Line
	6700 3200 7100 3200
Wire Wire Line
	6700 3500 7100 3500
Text Label 7100 3500 2    60   ~ 0
VPRG
Text Label 7100 1500 2    60   ~ 0
SIN
Text Label 7100 1700 2    60   ~ 0
SCLK
Text Label 7100 1300 2    60   ~ 0
XLAT
Text Label 7100 1400 2    60   ~ 0
BLANK
Text Label 7100 1200 2    60   ~ 0
GSCLK
Text Label 7100 3200 2    60   ~ 0
DCPRG
$Comp
L CRYSTAL X1
U 1 1 52EC3056
P 7450 1950
F 0 "X1" H 7450 2100 60  0000 C CNN
F 1 "18.432 MHz" H 7450 1800 60  0000 C CNN
F 2 "Crystals:Crystal_HC49-U_Vertical" H 7450 1950 60  0001 C CNN
F 3 "" H 7450 1950 60  0000 C CNN
	1    7450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1950 7150 1950
Wire Wire Line
	7000 1950 7000 1900
Wire Wire Line
	7000 1900 6700 1900
Wire Wire Line
	7750 1950 7850 1950
Wire Wire Line
	7850 1800 7850 2000
Wire Wire Line
	7850 1800 6700 1800
Connection ~ 7850 1950
Wire Wire Line
	7850 2200 7850 2250
Wire Wire Line
	7050 2000 7050 1950
Connection ~ 7050 1950
Wire Wire Line
	7050 2200 7050 2250
$Comp
L GND #PWR05
U 1 1 52EC3333
P 7850 2250
F 0 "#PWR05" H 7850 2250 30  0001 C CNN
F 1 "GND" H 7850 2180 30  0001 C CNN
F 2 "" H 7850 2250 60  0000 C CNN
F 3 "" H 7850 2250 60  0000 C CNN
	1    7850 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 52EC3345
P 7050 2250
F 0 "#PWR06" H 7050 2250 30  0001 C CNN
F 1 "GND" H 7050 2180 30  0001 C CNN
F 2 "" H 7050 2250 60  0000 C CNN
F 3 "" H 7050 2250 60  0000 C CNN
	1    7050 2250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 52EC3350
P 4750 1150
F 0 "#PWR07" H 4750 1240 20  0001 C CNN
F 1 "+5V" H 4750 1300 30  0000 C CNN
F 2 "" H 4750 1150 60  0000 C CNN
F 3 "" H 4750 1150 60  0000 C CNN
	1    4750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1150 4750 1200
Wire Wire Line
	4550 1200 4800 1200
$Comp
L +5V #PWR08
U 1 1 52EC33D1
P 4750 1450
F 0 "#PWR08" H 4750 1540 20  0001 C CNN
F 1 "+5V" H 4750 1600 30  0000 C CNN
F 2 "" H 4750 1450 60  0000 C CNN
F 3 "" H 4750 1450 60  0000 C CNN
	1    4750 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1450 4750 1500
Wire Wire Line
	4750 1500 4800 1500
Wire Wire Line
	4650 1900 4650 1800
Wire Wire Line
	4650 1800 4800 1800
Wire Wire Line
	4650 2100 4650 2200
$Comp
L GND #PWR09
U 1 1 52EC3556
P 4650 2200
F 0 "#PWR09" H 4650 2200 30  0001 C CNN
F 1 "GND" H 4650 2130 30  0001 C CNN
F 2 "" H 4650 2200 60  0000 C CNN
F 3 "" H 4650 2200 60  0000 C CNN
	1    4650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3400 4700 3400
Wire Wire Line
	4700 3400 4700 3600
Wire Wire Line
	4800 3500 4700 3500
Connection ~ 4700 3500
$Comp
L GND #PWR010
U 1 1 52EC3663
P 4700 3600
F 0 "#PWR010" H 4700 3600 30  0001 C CNN
F 1 "GND" H 4700 3530 30  0001 C CNN
F 2 "" H 4700 3600 60  0000 C CNN
F 3 "" H 4700 3600 60  0000 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1200 4550 1250
Connection ~ 4750 1200
Wire Wire Line
	4550 1450 4550 1600
$Comp
L GND #PWR011
U 1 1 52EC3783
P 4550 1600
F 0 "#PWR011" H 4550 1600 30  0001 C CNN
F 1 "GND" H 4550 1530 30  0001 C CNN
F 2 "" H 4550 1600 60  0000 C CNN
F 3 "" H 4550 1600 60  0000 C CNN
	1    4550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3600 7350 3600
Wire Wire Line
	7550 3700 7350 3700
Wire Wire Line
	7550 3800 7350 3800
Wire Wire Line
	8050 3800 8250 3800
Wire Wire Line
	8050 3700 8250 3700
Wire Wire Line
	8250 3600 8050 3600
Text Label 7350 3600 0    60   ~ 0
MISO
Text Label 7400 1600 2    60   ~ 0
MISO
Wire Wire Line
	7400 1600 6700 1600
$Comp
L +5V #PWR012
U 1 1 52EC3BE6
P 8250 3500
F 0 "#PWR012" H 8250 3590 20  0001 C CNN
F 1 "+5V" H 8250 3650 30  0000 C CNN
F 2 "" H 8250 3500 60  0000 C CNN
F 3 "" H 8250 3500 60  0000 C CNN
	1    8250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3500 8250 3600
Text Label 7350 3700 0    60   ~ 0
SCK
Text Label 7400 1700 2    60   ~ 0
SCK
Text Label 8250 3700 2    60   ~ 0
MOSI
Text Label 7400 1500 2    60   ~ 0
MOSI
Text Label 7350 3800 0    60   ~ 0
RST
Text Label 6950 2650 2    60   ~ 0
RST
Wire Wire Line
	6700 2650 7300 2650
$Comp
L GND #PWR013
U 1 1 52EC3EB6
P 8250 3850
F 0 "#PWR013" H 8250 3850 30  0001 C CNN
F 1 "GND" H 8250 3780 30  0001 C CNN
F 2 "" H 8250 3850 60  0000 C CNN
F 3 "" H 8250 3850 60  0000 C CNN
	1    8250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3800 8250 3850
$Comp
L CONN_02X03 P3
U 1 1 54D55BCC
P 7800 3700
F 0 "P3" H 7800 3900 50  0000 C CNN
F 1 "CONN_02X03" H 7800 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 7800 2500 60  0001 C CNN
F 3 "" H 7800 2500 60  0000 C CNN
	1    7800 3700
	1    0    0    -1  
$EndComp
$Comp
L Csmall C4
U 1 1 54D55CB4
P 7850 2100
F 0 "C4" H 7875 2150 30  0000 L CNN
F 1 "22n" H 7875 2050 30  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 7850 2100 60  0001 C CNN
F 3 "" H 7850 2100 60  0000 C CNN
	1    7850 2100
	1    0    0    -1  
$EndComp
$Comp
L Csmall C3
U 1 1 54D55CF9
P 7050 2100
F 0 "C3" H 7075 2150 30  0000 L CNN
F 1 "22n" H 7075 2050 30  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 7050 2100 60  0001 C CNN
F 3 "" H 7050 2100 60  0000 C CNN
	1    7050 2100
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 P2
U 1 1 54D55E7F
P 5450 5100
F 0 "P2" H 5450 5400 50  0000 C CNN
F 1 "CONN_02X05" H 5450 4800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05" H 5450 3900 60  0001 C CNN
F 3 "" H 5450 3900 60  0000 C CNN
	1    5450 5100
	1    0    0    -1  
$EndComp
$Comp
L Csmall C2
U 1 1 54D56837
P 4650 2000
F 0 "C2" H 4675 2050 30  0000 L CNN
F 1 "100n" H 4675 1950 30  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 4650 2000 60  0001 C CNN
F 3 "" H 4650 2000 60  0000 C CNN
	1    4650 2000
	1    0    0    -1  
$EndComp
$Comp
L Csmall C1
U 1 1 54D568CC
P 4550 1350
F 0 "C1" H 4575 1400 30  0000 L CNN
F 1 "100n" H 4575 1300 30  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 4550 1350 60  0001 C CNN
F 3 "" H 4550 1350 60  0000 C CNN
	1    4550 1350
	1    0    0    -1  
$EndComp
Wire Notes Line
	8450 4100 8450 800 
Text Notes 5650 1000 0    60   ~ 0
Control de los ojos
Text Notes 4850 4600 0    60   ~ 0
Conector para los ojos
Text Notes 1300 2500 0    60   ~ 0
Comunicacion con el control remoto
$Comp
L CONN_01X02 P5
U 1 1 54D56E87
P 10350 5550
F 0 "P5" H 10350 5700 50  0000 C CNN
F 1 "CONN_01X02" V 10450 5550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 10350 5550 60  0001 C CNN
F 3 "" H 10350 5550 60  0000 C CNN
	1    10350 5550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 54D57006
P 10350 5250
F 0 "P4" H 10350 5400 50  0000 C CNN
F 1 "CONN_01X02" V 10450 5250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 10350 5250 60  0001 C CNN
F 3 "" H 10350 5250 60  0000 C CNN
	1    10350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 5850 8000 5850
Wire Wire Line
	8000 4850 8550 4850
Wire Wire Line
	8550 5550 8000 5550
Wire Wire Line
	8000 5000 8550 5000
Wire Wire Line
	8550 5150 8000 5150
Wire Wire Line
	8000 5700 8550 5700
Wire Wire Line
	8550 5300 8000 5300
$Sheet
S 10200 950  750  1000
U 54D57D39
F0 "Power" 60
F1 "power.sch" 60
F2 "12V" I L 10200 1350 60 
F3 "14.8V" I L 10200 1550 60 
F4 "5V" I L 10200 1150 60 
F5 "GND" I L 10200 1750 60 
$EndSheet
Wire Wire Line
	10200 1150 10050 1150
Wire Wire Line
	10050 1150 10050 900 
Wire Wire Line
	10200 1350 9900 1350
Wire Wire Line
	9900 1350 9900 900 
Wire Wire Line
	10200 1550 9700 1550
Wire Wire Line
	9700 1550 9700 900 
Wire Wire Line
	10200 1750 9850 1750
Wire Wire Line
	9850 1750 9850 2050
$Comp
L GND #PWR014
U 1 1 54D5D4C1
P 9850 2050
F 0 "#PWR014" H 9850 2050 30  0001 C CNN
F 1 "GND" H 9850 1980 30  0001 C CNN
F 2 "" H 9850 2050 60  0000 C CNN
F 3 "" H 9850 2050 60  0000 C CNN
	1    9850 2050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 54D5D4DC
P 10050 900
F 0 "#PWR015" H 10050 990 20  0001 C CNN
F 1 "+5V" H 10050 1050 30  0000 C CNN
F 2 "" H 10050 900 60  0000 C CNN
F 3 "" H 10050 900 60  0000 C CNN
	1    10050 900 
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR016
U 1 1 54D5D5BB
P 9900 900
F 0 "#PWR016" H 9900 850 20  0001 C CNN
F 1 "+12V" H 9900 1050 30  0000 C CNN
F 2 "" H 9900 900 60  0000 C CNN
F 3 "" H 9900 900 60  0000 C CNN
	1    9900 900 
	1    0    0    -1  
$EndComp
$Comp
L +15V #PWR017
U 1 1 54D5DC54
P 9950 4700
F 0 "#PWR017" H 9950 4550 60  0001 C CNN
F 1 "+15V" H 9950 4840 60  0000 C CNN
F 2 "" H 9950 4700 60  0000 C CNN
F 3 "" H 9950 4700 60  0000 C CNN
	1    9950 4700
	1    0    0    -1  
$EndComp
$Comp
L +15V #PWR018
U 1 1 54DE957E
P 9700 900
F 0 "#PWR018" H 9700 750 60  0001 C CNN
F 1 "+15V" H 9700 1040 60  0000 C CNN
F 2 "" H 9700 900 60  0000 C CNN
F 3 "" H 9700 900 60  0000 C CNN
	1    9700 900 
	1    0    0    -1  
$EndComp
$Sheet
S 9500 2500 1100 950 
U 54DEA09E
F0 "sound" 60
F1 "sound.sch" 60
F2 "In" I L 9500 3000 60 
F3 "GND" I L 9500 3250 60 
F4 "VIN" I L 9500 2600 60 
F5 "~SHD" I L 9500 2800 60 
$EndSheet
$Comp
L GND #PWR019
U 1 1 54DEDBE5
P 9300 3350
F 0 "#PWR019" H 9300 3350 30  0001 C CNN
F 1 "GND" H 9300 3280 30  0001 C CNN
F 2 "" H 9300 3350 60  0000 C CNN
F 3 "" H 9300 3350 60  0000 C CNN
	1    9300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3350 9300 3250
Wire Wire Line
	9300 3250 9500 3250
Wire Wire Line
	9500 3000 9150 3000
Text Label 9150 3000 0    60   ~ 0
Audio
Text Label 3750 7300 2    60   ~ 0
Audio
Wire Wire Line
	3750 7300 3300 7300
$Sheet
S 8550 4700 1250 1450
U 54DEEEE7
F0 "motordrv" 60
F1 "motordrv.sch" 60
F2 "PVDD" I R 9800 4850 60 
F3 "~FAULT" O L 8550 5850 60 
F4 "DGND" I R 9800 5850 60 
F5 "DVDD" I R 9800 5000 60 
F6 "MOUT_B2" U R 9800 5600 60 
F7 "MOUT_B1" U R 9800 5500 60 
F8 "MOUT_A2" U R 9800 5300 60 
F9 "MOUT_A1" U R 9800 5200 60 
F10 "~RESET" I L 8550 5550 60 
F11 "IN_B2" I L 8550 5300 60 
F12 "IN_B1" I L 8550 5150 60 
F13 "IN_A2" I L 8550 5000 60 
F14 "IN_A1" I L 8550 4850 60 
F15 "~SLEEP" I L 8550 5700 60 
F16 "PGND" I R 9800 6000 60 
$EndSheet
Wire Wire Line
	9950 4700 9950 4850
Wire Wire Line
	9950 4850 9800 4850
Wire Wire Line
	10150 4800 10150 5000
Wire Wire Line
	10150 5000 9800 5000
Wire Wire Line
	10150 5500 9800 5500
Wire Wire Line
	9800 5600 10150 5600
Wire Wire Line
	10150 5300 9800 5300
Wire Wire Line
	9800 5200 10150 5200
Wire Wire Line
	9500 2600 9250 2600
Wire Wire Line
	9250 2600 9250 2400
$Comp
L +12V #PWR020
U 1 1 5503F122
P 9250 2400
F 0 "#PWR020" H 9250 2350 20  0001 C CNN
F 1 "+12V" H 9250 2550 30  0000 C CNN
F 2 "" H 9250 2400 60  0000 C CNN
F 3 "" H 9250 2400 60  0000 C CNN
	1    9250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2800 9500 2800
Text Label 9150 2800 0    60   ~ 0
~SHD
Text Label 950  6400 0    60   ~ 0
~SHD
Wire Wire Line
	950  6400 1450 6400
Wire Wire Line
	1450 5500 850  5500
Wire Wire Line
	850  5500 850  5300
$Comp
L +5V #PWR021
U 1 1 551F11B4
P 850 5300
F 0 "#PWR021" H 850 5390 20  0001 C CNN
F 1 "+5V" H 850 5450 30  0000 C CNN
F 2 "" H 850 5300 60  0000 C CNN
F 3 "" H 850 5300 60  0000 C CNN
	1    850  5300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR022
U 1 1 552017CB
P 10150 4800
F 0 "#PWR022" H 10150 4890 20  0001 C CNN
F 1 "+5V" H 10150 4950 30  0000 C CNN
F 2 "" H 10150 4800 60  0000 C CNN
F 3 "" H 10150 4800 60  0000 C CNN
	1    10150 4800
	1    0    0    -1  
$EndComp
Text Label 950  7200 0    60   ~ 0
~RESET
Text Label 950  7100 0    60   ~ 0
~FAULT
Text Label 950  7300 0    60   ~ 0
~SLEEP
Wire Wire Line
	9800 5850 10000 5850
Wire Wire Line
	10000 5850 10000 6100
Wire Wire Line
	9800 6000 10000 6000
Connection ~ 10000 6000
$Comp
L GND #PWR023
U 1 1 5520BE76
P 10000 6100
F 0 "#PWR023" H 10000 6100 30  0001 C CNN
F 1 "GND" H 10000 6030 30  0001 C CNN
F 2 "" H 10000 6100 60  0000 C CNN
F 3 "" H 10000 6100 60  0000 C CNN
	1    10000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 6200 950  6200
Wire Wire Line
	1450 6300 950  6300
Text Label 950  6300 0    60   ~ 0
EYE-TX
Text Label 950  6200 0    60   ~ 0
EYE-RX
Text Label 7100 2900 2    60   ~ 0
EYE-TX
Wire Wire Line
	7100 2900 6700 2900
Wire Wire Line
	6700 2800 7100 2800
Text Label 7100 2800 2    60   ~ 0
EYE-RX
$Comp
L Csmall C21
U 1 1 5520E435
P 7400 2950
F 0 "C21" H 7425 3000 30  0000 L CNN
F 1 "100n" H 7425 2900 30  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 7400 2950 60  0001 C CNN
F 3 "" H 7400 2950 60  0000 C CNN
	1    7400 2950
	1    0    0    -1  
$EndComp
$Comp
L R R17
U 1 1 5520E784
P 7400 2600
F 0 "R17" V 7480 2600 50  0000 C CNN
F 1 "10k" V 7400 2600 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 7330 2600 30  0001 C CNN
F 3 "" H 7400 2600 30  0000 C CNN
	1    7400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2650 7300 2800
Wire Wire Line
	7300 2800 7400 2800
Wire Wire Line
	7400 2750 7400 2850
Connection ~ 7400 2800
Wire Wire Line
	7400 3050 7400 3150
$Comp
L GND #PWR024
U 1 1 5520EB30
P 7400 3150
F 0 "#PWR024" H 7400 3150 30  0001 C CNN
F 1 "GND" H 7400 3080 30  0001 C CNN
F 2 "" H 7400 3150 60  0000 C CNN
F 3 "" H 7400 3150 60  0000 C CNN
	1    7400 3150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR025
U 1 1 5520ED96
P 7400 2400
F 0 "#PWR025" H 7400 2490 20  0001 C CNN
F 1 "+5V" H 7400 2550 30  0000 C CNN
F 2 "" H 7400 2400 60  0000 C CNN
F 3 "" H 7400 2400 60  0000 C CNN
	1    7400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2450 7400 2400
$EndSCHEMATC
