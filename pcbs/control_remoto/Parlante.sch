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
$Comp
L C C6
U 1 1 5528929F
P 1100 1200
F 0 "C6" H 1125 1300 50  0000 L CNN
F 1 "C" H 1125 1100 50  0000 L CNN
F 2 "" H 1138 1050 30  0000 C CNN
F 3 "" H 1100 1200 60  0000 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1350 1100 1450
Wire Wire Line
	1100 1450 1250 1450
$Comp
L POT RV3
U 1 1 552892CA
P 1250 1700
F 0 "RV3" H 1250 1600 50  0000 C CNN
F 1 "10k" H 1250 1700 50  0000 C CNN
F 2 "" H 1250 1700 60  0000 C CNN
F 3 "" H 1250 1700 60  0000 C CNN
	1    1250 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 1600 1400 1600
Wire Wire Line
	1400 1600 1400 1700
$Comp
L GND #PWR24
U 1 1 5528938B
P 1700 1900
F 0 "#PWR24" H 1700 1650 50  0001 C CNN
F 1 "GND" H 1700 1750 50  0000 C CNN
F 2 "" H 1700 1900 60  0000 C CNN
F 3 "" H 1700 1900 60  0000 C CNN
	1    1700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1800 1700 1800
Wire Wire Line
	1700 1800 1700 1900
$Comp
L C C7
U 1 1 55289583
P 2450 1050
F 0 "C7" H 2475 1150 50  0000 L CNN
F 1 "100n" H 2475 950 50  0000 L CNN
F 2 "" H 2488 900 30  0000 C CNN
F 3 "" H 2450 1050 60  0000 C CNN
	1    2450 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 1050 2250 1350
$Comp
L GND #PWR27
U 1 1 5528968C
P 2800 1200
F 0 "#PWR27" H 2800 950 50  0001 C CNN
F 1 "GND" H 2800 1050 50  0000 C CNN
F 2 "" H 2800 1200 60  0000 C CNN
F 3 "" H 2800 1200 60  0000 C CNN
	1    2800 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 1200 2800 1200
$Comp
L GND #PWR26
U 1 1 552896EE
P 2150 2250
F 0 "#PWR26" H 2150 2000 50  0001 C CNN
F 1 "GND" H 2150 2100 50  0000 C CNN
F 2 "" H 2150 2250 60  0000 C CNN
F 3 "" H 2150 2250 60  0000 C CNN
	1    2150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2100 2150 2250
Wire Wire Line
	2150 1000 2150 1300
NoConn ~ 2250 2100
NoConn ~ 2350 2100
$Comp
L C C9
U 1 1 55289796
P 3700 1700
F 0 "C9" H 3725 1800 50  0000 L CNN
F 1 "250u" H 3725 1600 50  0000 L CNN
F 2 "" H 3738 1550 30  0000 C CNN
F 3 "" H 3700 1700 60  0000 C CNN
	1    3700 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 1700 3550 1700
$Comp
L R R7
U 1 1 5528990D
P 3200 2100
F 0 "R7" V 3280 2100 50  0000 C CNN
F 1 "10" V 3200 2100 50  0000 C CNN
F 2 "" V 3130 2100 30  0000 C CNN
F 3 "" H 3200 2100 30  0000 C CNN
	1    3200 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1950 3200 1700
Connection ~ 3200 1700
$Comp
L C C8
U 1 1 55289949
P 3200 2600
F 0 "C8" H 3225 2700 50  0000 L CNN
F 1 "47n" H 3225 2500 50  0000 L CNN
F 2 "" H 3238 2450 30  0000 C CNN
F 3 "" H 3200 2600 60  0000 C CNN
	1    3200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2250 3200 2450
$Comp
L GND #PWR28
U 1 1 552899D4
P 3200 2950
F 0 "#PWR28" H 3200 2700 50  0001 C CNN
F 1 "GND" H 3200 2800 50  0000 C CNN
F 2 "" H 3200 2950 60  0000 C CNN
F 3 "" H 3200 2950 60  0000 C CNN
	1    3200 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2950 3200 2750
Wire Wire Line
	3850 1700 4150 1700
$Comp
L GND #PWR30
U 1 1 55289C14
P 4100 2550
F 0 "#PWR30" H 4100 2300 50  0001 C CNN
F 1 "GND" H 4100 2400 50  0000 C CNN
F 2 "" H 4100 2550 60  0000 C CNN
F 3 "" H 4100 2550 60  0000 C CNN
	1    4100 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR23
U 1 1 55289CEE
P 1250 2050
F 0 "#PWR23" H 1250 1800 50  0001 C CNN
F 1 "GND" H 1250 1900 50  0000 C CNN
F 2 "" H 1250 2050 60  0000 C CNN
F 3 "" H 1250 2050 60  0000 C CNN
	1    1250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1950 1250 2050
Wire Wire Line
	2250 1050 2300 1050
Wire Wire Line
	2600 1050 2600 1200
Wire Notes Line
	650  3250 4550 3250
Wire Notes Line
	4550 750  650  750 
Wire Notes Line
	650  750  650  3250
Text Notes 2250 850  0    60   ~ 0
PARLANTE
Wire Wire Line
	1100 1050 1100 950 
Wire Wire Line
	1100 950  800  950 
Text Label 800  950  0    60   ~ 0
In
Wire Wire Line
	3700 1850 4400 1850
$Comp
L JACK_TRS_6PINS J1
U 1 1 552867E4
P 4800 2050
F 0 "J1" H 4800 2450 50  0000 C CNN
F 1 "JACK_TRS_6PINS" H 4750 1750 50  0000 C CNN
F 2 "" H 4900 1900 60  0000 C CNN
F 3 "" H 4900 1900 60  0000 C CNN
	1    4800 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 2050 4400 2050
$Comp
L R R11
U 1 1 55286982
P 4000 2150
F 0 "R11" V 4080 2150 50  0000 C CNN
F 1 "1k" V 4000 2150 50  0000 C CNN
F 2 "" V 3930 2150 30  0000 C CNN
F 3 "" H 4000 2150 30  0000 C CNN
	1    4000 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 2450 4400 2350
Wire Wire Line
	4400 2150 4150 2150
Wire Wire Line
	3850 2150 3850 2450
Wire Wire Line
	3850 2450 4400 2450
Wire Wire Line
	4400 2250 4100 2250
Wire Wire Line
	4100 2250 4100 2550
Connection ~ 4100 2450
Wire Wire Line
	4150 1700 4150 1850
Connection ~ 4150 1850
$Comp
L R R12
U 1 1 55286E6F
P 4150 1950
F 0 "R12" V 4230 1950 50  0000 C CNN
F 1 "1k" V 4150 1950 50  0000 C CNN
F 2 "" V 4080 1950 30  0000 C CNN
F 3 "" H 4150 1950 30  0000 C CNN
	1    4150 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 1950 4400 1950
$Comp
L GND #PWR29
U 1 1 55287138
P 3950 1950
F 0 "#PWR29" H 3950 1700 50  0001 C CNN
F 1 "GND" H 3950 1800 50  0000 C CNN
F 2 "" H 3950 1950 60  0000 C CNN
F 3 "" H 3950 1950 60  0000 C CNN
	1    3950 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 1950 3950 1950
Wire Wire Line
	3700 1850 3700 2050
Wire Notes Line
	4400 3250 5700 3250
Wire Notes Line
	5700 3250 5700 750 
Wire Notes Line
	5700 750  4500 750 
$Comp
L LM386_mod U?
U 1 1 55287B8D
P 2250 1700
F 0 "U?" H 2400 1900 60  0000 C CNN
F 1 "LM386_mod" H 2400 2000 60  0000 C CNN
F 2 "" H 2250 1700 60  0000 C CNN
F 3 "" H 2250 1700 60  0000 C CNN
	1    2250 1700
	1    0    0    -1  
$EndComp
Text Label 2150 1000 3    60   ~ 0
VCC2
$Comp
L INDUCTOR L?
U 1 1 55287E3F
P 4300 1050
F 0 "L?" V 4250 1050 50  0000 C CNN
F 1 "1u" V 4400 1050 50  0000 C CNN
F 2 "" H 4300 1050 60  0000 C CNN
F 3 "" H 4300 1050 60  0000 C CNN
	1    4300 1050
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 55287ECA
P 4950 1200
F 0 "C?" H 4975 1300 50  0000 L CNN
F 1 "1u" H 4975 1100 50  0000 L CNN
F 2 "" H 4988 1050 30  0000 C CNN
F 3 "" H 4950 1200 60  0000 C CNN
	1    4950 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1050 4950 1050
Wire Wire Line
	4000 1050 3600 1050
Text Label 3600 1050 0    60   ~ 0
VCC1
Wire Wire Line
	4950 1350 4400 1350
Text Label 4400 1350 0    60   ~ 0
VCC2
$EndSCHEMATC
