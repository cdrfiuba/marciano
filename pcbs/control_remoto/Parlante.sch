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
LIBS:plugs
LIBS:controlremoto-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5900 1650 5900 1850
Wire Wire Line
	5900 1850 6050 1850
$Comp
L POT RV3
U 1 1 552892CA
P 6050 2100
F 0 "RV3" H 6050 2000 50  0000 C CNN
F 1 "10k" H 6050 2100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 6050 2100 60  0001 C CNN
F 3 "" H 6050 2100 60  0000 C CNN
	1    6050 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 2000 6200 2000
Wire Wire Line
	6200 2000 6200 2100
$Comp
L GND #PWR025
U 1 1 5528938B
P 6500 2300
F 0 "#PWR025" H 6500 2050 50  0001 C CNN
F 1 "GND" H 6500 2150 50  0000 C CNN
F 2 "" H 6500 2300 60  0000 C CNN
F 3 "" H 6500 2300 60  0000 C CNN
	1    6500 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2200 6500 2200
Wire Wire Line
	6500 2200 6500 2300
$Comp
L C C7
U 1 1 55289583
P 7250 1450
F 0 "C7" H 7275 1550 50  0000 L CNN
F 1 "100n" H 7275 1350 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 7288 1300 30  0001 C CNN
F 3 "" H 7250 1450 60  0000 C CNN
	1    7250 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1450 7050 1750
$Comp
L GND #PWR026
U 1 1 5528968C
P 7600 1600
F 0 "#PWR026" H 7600 1350 50  0001 C CNN
F 1 "GND" H 7600 1450 50  0000 C CNN
F 2 "" H 7600 1600 60  0000 C CNN
F 3 "" H 7600 1600 60  0000 C CNN
	1    7600 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7400 1600 7600 1600
$Comp
L GND #PWR027
U 1 1 552896EE
P 6950 2650
F 0 "#PWR027" H 6950 2400 50  0001 C CNN
F 1 "GND" H 6950 2500 50  0000 C CNN
F 2 "" H 6950 2650 60  0000 C CNN
F 3 "" H 6950 2650 60  0000 C CNN
	1    6950 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2500 6950 2650
Wire Wire Line
	6950 1400 6950 1700
NoConn ~ 7050 2500
NoConn ~ 7150 2500
Wire Wire Line
	7550 2100 8350 2100
$Comp
L R R7
U 1 1 5528990D
P 8000 2500
F 0 "R7" V 8080 2500 50  0000 C CNN
F 1 "10" V 8000 2500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 7930 2500 30  0001 C CNN
F 3 "" H 8000 2500 30  0000 C CNN
	1    8000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2350 8000 2100
Connection ~ 8000 2100
$Comp
L C C8
U 1 1 55289949
P 8000 3000
F 0 "C8" H 8025 3100 50  0000 L CNN
F 1 "47n" H 8025 2900 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 8038 2850 30  0001 C CNN
F 3 "" H 8000 3000 60  0000 C CNN
	1    8000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2650 8000 2850
$Comp
L GND #PWR028
U 1 1 552899D4
P 8000 3350
F 0 "#PWR028" H 8000 3100 50  0001 C CNN
F 1 "GND" H 8000 3200 50  0000 C CNN
F 2 "" H 8000 3350 60  0000 C CNN
F 3 "" H 8000 3350 60  0000 C CNN
	1    8000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3350 8000 3150
Wire Wire Line
	8550 2100 8950 2100
$Comp
L GND #PWR029
U 1 1 55289C14
P 8900 2950
F 0 "#PWR029" H 8900 2700 50  0001 C CNN
F 1 "GND" H 8900 2800 50  0000 C CNN
F 2 "" H 8900 2950 60  0000 C CNN
F 3 "" H 8900 2950 60  0000 C CNN
	1    8900 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 55289CEE
P 6050 2450
F 0 "#PWR030" H 6050 2200 50  0001 C CNN
F 1 "GND" H 6050 2300 50  0000 C CNN
F 2 "" H 6050 2450 60  0000 C CNN
F 3 "" H 6050 2450 60  0000 C CNN
	1    6050 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2350 6050 2450
Wire Wire Line
	7050 1450 7100 1450
Wire Wire Line
	7400 1450 7400 1600
Wire Notes Line
	5450 3650 9350 3650
Wire Notes Line
	9350 1150 5450 1150
Wire Notes Line
	5450 1150 5450 3650
Text Notes 7050 1250 0    60   ~ 0
PARLANTE
Wire Wire Line
	5900 1350 5900 1450
Wire Wire Line
	5500 1350 5900 1350
Wire Wire Line
	8500 2250 9200 2250
$Comp
L JACK_TRS_6PINS J1
U 1 1 552867E4
P 9600 2450
F 0 "J1" H 9600 2850 50  0000 C CNN
F 1 "JACK_TRS_6PINS" H 9550 2150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 9700 2300 60  0001 C CNN
F 3 "" H 9700 2300 60  0000 C CNN
	1    9600 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 2450 9200 2450
$Comp
L R R11
U 1 1 55286982
P 8800 2550
F 0 "R11" V 8880 2550 50  0000 C CNN
F 1 "1k" V 8800 2550 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8730 2550 30  0001 C CNN
F 3 "" H 8800 2550 30  0000 C CNN
	1    8800 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 2850 9200 2750
Wire Wire Line
	9200 2550 8950 2550
Wire Wire Line
	8650 2550 8650 2850
Wire Wire Line
	8650 2850 9200 2850
Wire Wire Line
	9200 2650 8900 2650
Wire Wire Line
	8900 2650 8900 2950
Connection ~ 8900 2850
Wire Wire Line
	8950 2100 8950 2250
Connection ~ 8950 2250
$Comp
L R R12
U 1 1 55286E6F
P 8950 2350
F 0 "R12" V 9030 2350 50  0000 C CNN
F 1 "1k" V 8950 2350 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8880 2350 30  0001 C CNN
F 3 "" H 8950 2350 30  0000 C CNN
	1    8950 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9100 2350 9200 2350
$Comp
L GND #PWR031
U 1 1 55287138
P 8750 2350
F 0 "#PWR031" H 8750 2100 50  0001 C CNN
F 1 "GND" H 8750 2200 50  0000 C CNN
F 2 "" H 8750 2350 60  0000 C CNN
F 3 "" H 8750 2350 60  0000 C CNN
	1    8750 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 2350 8750 2350
Wire Wire Line
	8500 2250 8500 2450
Wire Notes Line
	9200 3650 10500 3650
Wire Notes Line
	10500 3650 10500 1150
Wire Notes Line
	10500 1150 9300 1150
$Comp
L LM386_mod U7
U 1 1 55287B8D
P 7050 2100
F 0 "U7" H 7250 2250 60  0000 C CNN
F 1 "LM386_mod" H 7450 2350 60  0000 C CNN
F 2 "Sockets_DIP:DIP-8__300_ELL" H 7050 2100 60  0001 C CNN
F 3 "" H 7050 2100 60  0000 C CNN
	1    7050 2100
	1    0    0    -1  
$EndComp
Text Label 6950 1400 3    60   ~ 0
VCC2
$Comp
L INDUCTOR L3
U 1 1 55287E3F
P 9100 1450
F 0 "L3" V 9050 1450 50  0000 C CNN
F 1 "1u" V 9200 1450 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" H 9100 1450 60  0001 C CNN
F 3 "" H 9100 1450 60  0000 C CNN
	1    9100 1450
	0    -1   -1   0   
$EndComp
$Comp
L C C14
U 1 1 55287ECA
P 9750 1600
F 0 "C14" H 9775 1700 50  0000 L CNN
F 1 "1u" H 9775 1500 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 9788 1450 30  0001 C CNN
F 3 "" H 9750 1600 60  0000 C CNN
	1    9750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1450 9750 1450
Wire Wire Line
	8800 1450 8400 1450
Text Label 8400 1450 0    60   ~ 0
VCC1
Wire Wire Line
	9750 1750 9200 1750
Text Label 9750 1450 2    60   ~ 0
VCC2
$Comp
L GND #PWR032
U 1 1 552879C2
P 9200 1800
F 0 "#PWR032" H 9200 1550 50  0001 C CNN
F 1 "GND" H 9200 1650 50  0000 C CNN
F 2 "" H 9200 1800 60  0000 C CNN
F 3 "" H 9200 1800 60  0000 C CNN
	1    9200 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1750 9200 1800
Text HLabel 950  1300 0    60   Input ~ 0
VCC
Text HLabel 950  1550 0    60   Input ~ 0
GND
Text HLabel 950  1800 0    60   Input ~ 0
IN
Wire Wire Line
	4800 1800 5500 1800
Wire Wire Line
	5500 1800 5500 1350
Wire Wire Line
	950  1550 1150 1550
Wire Wire Line
	1150 1550 1150 2100
$Comp
L GND #PWR033
U 1 1 552885DB
P 1150 2100
F 0 "#PWR033" H 1150 1850 50  0001 C CNN
F 1 "GND" H 1150 1950 50  0000 C CNN
F 2 "" H 1150 2100 60  0000 C CNN
F 3 "" H 1150 2100 60  0000 C CNN
	1    1150 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1300 1250 1300
Text Label 1250 1300 2    60   ~ 0
VCC1
$Comp
L TL082 U6
U 1 1 552DFF48
P 2550 1800
F 0 "U6" H 2500 2000 60  0000 L CNN
F 1 "TL082" H 2500 1550 60  0000 L CNN
F 2 "Sockets_DIP:DIP-8__300_ELL" H 2550 1800 60  0001 C CNN
F 3 "" H 2550 1800 60  0000 C CNN
	1    2550 1800
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L2
U 1 1 552E04F1
P 3200 800
F 0 "L2" V 3150 800 50  0000 C CNN
F 1 "1u" V 3300 800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" H 3200 800 60  0001 C CNN
F 3 "" H 3200 800 60  0000 C CNN
	1    3200 800 
	0    -1   -1   0   
$EndComp
$Comp
L C C13
U 1 1 552E04F7
P 3850 950
F 0 "C13" H 3875 1050 50  0000 L CNN
F 1 "1u" H 3875 850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 3888 800 30  0001 C CNN
F 3 "" H 3850 950 60  0000 C CNN
	1    3850 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 800  3850 800 
Wire Wire Line
	2900 800  2500 800 
Text Label 2500 800  0    60   ~ 0
VCC1
Text Label 3850 800  2    60   ~ 0
VCC3
$Comp
L GND #PWR034
U 1 1 552E0502
P 3850 1200
F 0 "#PWR034" H 3850 950 50  0001 C CNN
F 1 "GND" H 3850 1050 50  0000 C CNN
F 2 "" H 3850 1200 60  0000 C CNN
F 3 "" H 3850 1200 60  0000 C CNN
	1    3850 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1400 2450 1300
Wire Wire Line
	2450 1300 2700 1300
Text Label 2700 1300 2    60   ~ 0
VCC3
$Comp
L GND #PWR035
U 1 1 552E0670
P 2450 2400
F 0 "#PWR035" H 2450 2150 50  0001 C CNN
F 1 "GND" H 2450 2250 50  0000 C CNN
F 2 "" H 2450 2400 60  0000 C CNN
F 3 "" H 2450 2400 60  0000 C CNN
	1    2450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2400 2450 2200
Wire Wire Line
	2050 1900 2000 1900
Wire Wire Line
	2000 1900 2000 2250
Wire Wire Line
	2000 2250 3100 2250
Wire Wire Line
	3100 2250 3100 1800
Wire Wire Line
	3050 1800 3150 1800
$Comp
L TL082 U6
U 2 1 552E0798
P 4300 1800
F 0 "U6" H 4250 2000 60  0000 L CNN
F 1 "TL082" H 4250 1550 60  0000 L CNN
F 2 "Sockets_DIP:DIP-8__300_ELL" H 4300 1800 60  0001 C CNN
F 3 "" H 4300 1800 60  0000 C CNN
	2    4300 1800
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 552E0876
P 1500 1800
F 0 "R13" V 1580 1800 50  0000 C CNN
F 1 "1k" V 1500 1800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 1430 1800 30  0001 C CNN
F 3 "" H 1500 1800 30  0000 C CNN
	1    1500 1800
	0    1    1    0   
$EndComp
$Comp
L C C11
U 1 1 552E0967
P 1750 2050
F 0 "C11" H 1775 2150 50  0000 L CNN
F 1 "33n" H 1775 1950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 1788 1900 30  0001 C CNN
F 3 "" H 1750 2050 60  0000 C CNN
	1    1750 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1800 1900 1800
Wire Wire Line
	1750 1800 1750 1900
Wire Wire Line
	1750 2200 1750 2350
$Comp
L GND #PWR036
U 1 1 552E0A9C
P 1750 2350
F 0 "#PWR036" H 1750 2100 50  0001 C CNN
F 1 "GND" H 1750 2200 50  0000 C CNN
F 2 "" H 1750 2350 60  0000 C CNN
F 3 "" H 1750 2350 60  0000 C CNN
	1    1750 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1800 950  1800
Wire Wire Line
	1900 1800 1900 1700
Wire Wire Line
	1900 1700 2050 1700
Connection ~ 1750 1800
Wire Wire Line
	3800 1900 3750 1900
Wire Wire Line
	3750 1900 3750 2400
Wire Wire Line
	3750 2400 4850 2400
Wire Wire Line
	4850 2400 4850 1800
$Comp
L R R14
U 1 1 552E0E36
P 3300 1800
F 0 "R14" V 3380 1800 50  0000 C CNN
F 1 "1k" V 3300 1800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3230 1800 30  0001 C CNN
F 3 "" H 3300 1800 30  0000 C CNN
	1    3300 1800
	0    1    1    0   
$EndComp
$Comp
L C C12
U 1 1 552E0E3C
P 3550 2050
F 0 "C12" H 3575 2150 50  0000 L CNN
F 1 "33n" H 3575 1950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 3588 1900 30  0001 C CNN
F 3 "" H 3550 2050 60  0000 C CNN
	1    3550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1800 3700 1800
Wire Wire Line
	3550 1800 3550 1900
Wire Wire Line
	3550 2200 3550 2350
$Comp
L GND #PWR037
U 1 1 552E0E46
P 3550 2350
F 0 "#PWR037" H 3550 2100 50  0001 C CNN
F 1 "GND" H 3550 2200 50  0000 C CNN
F 2 "" H 3550 2350 60  0000 C CNN
F 3 "" H 3550 2350 60  0000 C CNN
	1    3550 2350
	1    0    0    -1  
$EndComp
Connection ~ 3550 1800
Wire Wire Line
	3700 1800 3700 1700
Wire Wire Line
	3700 1700 3800 1700
Connection ~ 3100 1800
Wire Wire Line
	4200 1400 4200 1300
Wire Wire Line
	4200 1300 4400 1300
Wire Wire Line
	3850 1200 3850 1100
Text Label 4400 1300 2    60   ~ 0
VCC3
Wire Wire Line
	4200 2200 4200 2500
$Comp
L GND #PWR038
U 1 1 552E12B9
P 4200 2500
F 0 "#PWR038" H 4200 2250 50  0001 C CNN
F 1 "GND" H 4200 2350 50  0000 C CNN
F 2 "" H 4200 2500 60  0000 C CNN
F 3 "" H 4200 2500 60  0000 C CNN
	1    4200 2500
	1    0    0    -1  
$EndComp
Connection ~ 4850 1800
$Comp
L CP_Small C6
U 1 1 552E6B77
P 5900 1550
F 0 "C6" H 5910 1620 50  0000 L CNN
F 1 "10u" H 5910 1470 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 5900 1550 60  0001 C CNN
F 3 "" H 5900 1550 60  0000 C CNN
	1    5900 1550
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C9
U 1 1 552E8A96
P 8450 2100
F 0 "C9" H 8460 2170 50  0000 L CNN
F 1 "220u" H 8460 2020 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 8450 2100 60  0001 C CNN
F 3 "" H 8450 2100 60  0000 C CNN
	1    8450 2100
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
