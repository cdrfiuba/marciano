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
LIBS:basicmother-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date "11 jan 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7850 2800 0    60   ~ 0
Bajar de 14.8 a 5
Text Notes 2850 2900 0    60   ~ 0
Elevar de 5 a 12 con PTN04050c
Wire Wire Line
	3050 3100 2550 3100
Wire Wire Line
	4250 3100 4900 3100
Wire Wire Line
	4500 3000 4500 3150
$Comp
L +5V #PWR?
U 1 1 54D591BB
P 2900 3300
F 0 "#PWR?" H 2900 3390 20  0001 C CNN
F 1 "+5V" H 2900 3390 30  0000 C CNN
F 2 "" H 2900 3300 60  0000 C CNN
F 3 "" H 2900 3300 60  0000 C CNN
	1    2900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3300 2900 3400
Wire Wire Line
	2900 3350 3050 3350
$Comp
L GND #PWR?
U 1 1 54D591BC
P 2550 3150
F 0 "#PWR?" H 2550 3150 30  0001 C CNN
F 1 "GND" H 2550 3080 30  0001 C CNN
F 2 "" H 2550 3150 60  0000 C CNN
F 3 "" H 2550 3150 60  0000 C CNN
	1    2550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3100 2550 3150
$Comp
L +12V #PWR?
U 1 1 54D591BD
P 4500 3000
F 0 "#PWR?" H 4500 2950 20  0001 C CNN
F 1 "+12V" H 4500 3100 30  0000 C CNN
F 2 "" H 4500 3000 60  0000 C CNN
F 3 "" H 4500 3000 60  0000 C CNN
	1    4500 3000
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C?
U 1 1 54D591BF
P 4500 3350
F 0 "C?" H 4550 3450 40  0000 L CNN
F 1 "100uA" H 4550 3250 40  0000 L CNN
F 2 "" H 4600 3200 30  0000 C CNN
F 3 "" H 4500 3350 300 0000 C CNN
	1    4500 3350
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C?
U 1 1 54D591C0
P 2900 3600
F 0 "C?" H 2950 3700 40  0000 L CNN
F 1 "100uA" H 2950 3500 40  0000 L CNN
F 2 "" H 3000 3450 30  0000 C CNN
F 3 "" H 2900 3600 300 0000 C CNN
	1    2900 3600
	1    0    0    -1  
$EndComp
Connection ~ 2900 3350
Connection ~ 4500 3100
Wire Wire Line
	2900 3800 2900 3950
$Comp
L GND #PWR?
U 1 1 54D591C1
P 2900 3950
F 0 "#PWR?" H 2900 3950 30  0001 C CNN
F 1 "GND" H 2900 3880 30  0001 C CNN
F 2 "" H 2900 3950 60  0000 C CNN
F 3 "" H 2900 3950 60  0000 C CNN
	1    2900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3550 4500 3650
$Comp
L GND #PWR?
U 1 1 54D591C2
P 4500 3650
F 0 "#PWR?" H 4500 3650 30  0001 C CNN
F 1 "GND" H 4500 3580 30  0001 C CNN
F 2 "" H 4500 3650 60  0000 C CNN
F 3 "" H 4500 3650 60  0000 C CNN
	1    4500 3650
	1    0    0    -1  
$EndComp
$Comp
L PTN78000W U?
U 1 1 54D591CE
P 8300 3300
F 0 "U?" H 8300 3200 60  0000 C CNN
F 1 "PTN78000W" H 8300 3400 60  0000 C CNN
F 2 "" H 8300 3300 60  0000 C CNN
F 3 "" H 8300 3300 60  0000 C CNN
	1    8300 3300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 54D591C8
P 4000 6150
F 0 "P?" H 4000 6300 50  0000 C CNN
F 1 "CONN_01X02" V 4100 6150 50  0000 C CNN
F 2 "" H 4000 6150 60  0000 C CNN
F 3 "" H 4000 6150 60  0000 C CNN
	1    4000 6150
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 54D591C7
P 5250 6100
F 0 "P?" H 5250 6250 50  0000 C CNN
F 1 "CONN_01X02" V 5350 6100 50  0000 C CNN
F 2 "" H 5250 6100 60  0000 C CNN
F 3 "" H 5250 6100 60  0000 C CNN
	1    5250 6100
	0    1    1    0   
$EndComp
NoConn ~ 5600 50  
Wire Wire Line
	3600 5750 3950 5750
Wire Wire Line
	3950 5750 3950 5950
Wire Wire Line
	4050 5750 4250 5750
Wire Wire Line
	4050 5950 4050 5750
Wire Wire Line
	5300 5750 5500 5750
Wire Wire Line
	5300 5900 5300 5750
$Comp
L GND #PWR?
U 1 1 54D591AC
P 5050 5750
F 0 "#PWR?" H 5050 5750 30  0001 C CNN
F 1 "GND" H 5050 5680 30  0001 C CNN
F 2 "" H 5050 5750 60  0000 C CNN
F 3 "" H 5050 5750 60  0000 C CNN
	1    5050 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 5750 5050 5750
Wire Wire Line
	5200 5900 5200 5750
Text Notes 4750 6600 1    60   ~ 0
CONECTOR DE BATERIA
Wire Notes Line
	4750 6600 4750 5400
Wire Notes Line
	5750 6600 4750 6600
Wire Notes Line
	5750 5400 5750 6600
Wire Notes Line
	4750 5400 5750 5400
Text Notes 3500 6600 1    60   ~ 0
CONECTOR DE ENCENDIDO
Wire Notes Line
	3500 6600 3500 5400
Wire Notes Line
	4500 6600 3500 6600
Wire Notes Line
	4500 5400 4500 6600
Wire Notes Line
	3500 5400 4500 5400
Wire Wire Line
	7050 3400 7600 3400
$Comp
L +15V #PWR?
U 1 1 54D5A534
P 7050 3300
F 0 "#PWR?" H 7050 3150 60  0001 C CNN
F 1 "+15V" H 7050 3440 60  0000 C CNN
F 2 "" H 7050 3300 60  0000 C CNN
F 3 "" H 7050 3300 60  0000 C CNN
	1    7050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3300 7050 3400
$Comp
L +15V #PWR?
U 1 1 54D5A5D0
P 3600 5700
F 0 "#PWR?" H 3600 5550 60  0001 C CNN
F 1 "+15V" H 3600 5840 60  0000 C CNN
F 2 "" H 3600 5700 60  0000 C CNN
F 3 "" H 3600 5700 60  0000 C CNN
	1    3600 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5700 3600 5750
$Comp
L +BATT #PWR?
U 1 1 54D5A61A
P 4250 5700
F 0 "#PWR?" H 4250 5550 60  0001 C CNN
F 1 "+BATT" H 4250 5840 60  0000 C CNN
F 2 "" H 4250 5700 60  0000 C CNN
F 3 "" H 4250 5700 60  0000 C CNN
	1    4250 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5750 4250 5700
$Comp
L +BATT #PWR?
U 1 1 54D5A73D
P 5500 5700
F 0 "#PWR?" H 5500 5550 60  0001 C CNN
F 1 "+BATT" H 5500 5840 60  0000 C CNN
F 2 "" H 5500 5700 60  0000 C CNN
F 3 "" H 5500 5700 60  0000 C CNN
	1    5500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5750 5500 5700
Wire Wire Line
	9000 3050 9950 3050
$Comp
L +5V #PWR?
U 1 1 54D5A841
P 9500 2950
F 0 "#PWR?" H 9500 2800 60  0001 C CNN
F 1 "+5V" H 9500 3090 60  0000 C CNN
F 2 "" H 9500 2950 60  0000 C CNN
F 3 "" H 9500 2950 60  0000 C CNN
	1    9500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3050 9500 2950
$Comp
L CAPAPOL C?
U 1 1 54D5AA9E
P 9450 3350
F 0 "C?" H 9500 3450 40  0000 L CNN
F 1 "100uA" H 9500 3250 40  0000 L CNN
F 2 "" H 9550 3200 30  0000 C CNN
F 3 "" H 9450 3350 300 0000 C CNN
	1    9450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3050 9450 3150
Connection ~ 9450 3050
Wire Wire Line
	9450 4350 9450 3550
Wire Wire Line
	7100 4350 9950 4350
Wire Wire Line
	7400 4350 7400 3050
Wire Wire Line
	7400 3050 7600 3050
$Comp
L GND #PWR?
U 1 1 54D5AB55
P 8150 4450
F 0 "#PWR?" H 8150 4450 30  0001 C CNN
F 1 "GND" H 8150 4380 30  0001 C CNN
F 2 "" H 8150 4450 60  0000 C CNN
F 3 "" H 8150 4450 60  0000 C CNN
	1    8150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4450 8150 4350
Connection ~ 8150 4350
$Comp
L R R?
U 1 1 54D5AB93
P 9150 3900
F 0 "R?" V 9230 3900 50  0000 C CNN
F 1 "21k" V 9157 3901 50  0000 C CNN
F 2 "" V 9080 3900 30  0000 C CNN
F 3 "" H 9150 3900 30  0000 C CNN
	1    9150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3550 9150 3550
Wire Wire Line
	9150 3550 9150 3650
Wire Wire Line
	9150 4150 9150 4350
Connection ~ 9150 4350
$Comp
L C C?
U 1 1 54D5ACD6
P 7100 3850
F 0 "C?" H 7150 3950 50  0000 L CNN
F 1 "2.2u" H 7150 3750 50  0000 L CNN
F 2 "" H 7138 3700 30  0000 C CNN
F 3 "" H 7100 3850 60  0000 C CNN
	1    7100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3650 7100 3400
Connection ~ 7100 3400
Wire Wire Line
	7100 4350 7100 4050
Connection ~ 7400 4350
Text Notes 6450 3950 0    60   ~ 0
ceramico \nvalor minimo\nX5R o X7R
$Comp
L C C?
U 1 1 54D5AE89
P 9950 3600
F 0 "C?" H 10000 3700 50  0000 L CNN
F 1 "100n" H 10000 3500 50  0000 L CNN
F 2 "" H 9988 3450 30  0000 C CNN
F 3 "" H 9950 3600 60  0000 C CNN
	1    9950 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3050 9950 3400
Connection ~ 9500 3050
Wire Wire Line
	9950 4350 9950 3800
Connection ~ 9450 4350
$Comp
L C C?
U 1 1 54D5AF73
P 4900 3350
F 0 "C?" H 4950 3450 50  0000 L CNN
F 1 "100n" H 4950 3250 50  0000 L CNN
F 2 "" H 4938 3200 30  0000 C CNN
F 3 "" H 4900 3350 60  0000 C CNN
	1    4900 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3100 4900 3150
Connection ~ 4500 3600
Wire Wire Line
	4900 3550 4900 3600
Wire Wire Line
	4900 3600 4500 3600
NoConn ~ 7600 3550
$Comp
L R R?
U 1 1 54D5B373
P 4350 3900
F 0 "R?" V 4430 3900 50  0000 C CNN
F 1 "1.35k" V 4357 3901 50  0000 C CNN
F 2 "" V 4280 3900 30  0000 C CNN
F 3 "" H 4350 3900 30  0000 C CNN
	1    4350 3900
	1    0    0    -1  
$EndComp
$Comp
L PTN4050 U?
U 1 1 54D591BE
P 3650 3350
F 0 "U?" H 3650 3500 60  0000 C CNN
F 1 "PTN4050" H 3650 3200 60  0000 C CNN
F 2 "" H 3650 3350 60  0000 C CNN
F 3 "" H 3650 3350 60  0000 C CNN
	1    3650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3650 4350 3600
Wire Wire Line
	4350 3600 4250 3600
Wire Wire Line
	4350 4150 4350 4250
$Comp
L GND #PWR?
U 1 1 54D5B521
P 4350 4250
F 0 "#PWR?" H 4350 4250 30  0001 C CNN
F 1 "GND" H 4350 4180 30  0001 C CNN
F 2 "" H 4350 4250 60  0000 C CNN
F 3 "" H 4350 4250 60  0000 C CNN
	1    4350 4250
	1    0    0    -1  
$EndComp
Text HLabel 950  2000 0    60   Input ~ 0
12V
Wire Wire Line
	950  2000 1250 2000
Wire Wire Line
	1250 2000 1250 1600
Text HLabel 950  2200 0    60   Input ~ 0
14.8V
Wire Wire Line
	950  2200 1450 2200
Wire Wire Line
	1450 2200 1450 1600
Text HLabel 950  1800 0    60   Input ~ 0
5V
Wire Wire Line
	950  1800 1100 1800
Wire Wire Line
	1100 1800 1100 1600
$Comp
L +12V #PWR?
U 1 1 54D5BD2B
P 1250 1600
F 0 "#PWR?" H 1250 1550 20  0001 C CNN
F 1 "+12V" H 1250 1700 30  0000 C CNN
F 2 "" H 1250 1600 60  0000 C CNN
F 3 "" H 1250 1600 60  0000 C CNN
	1    1250 1600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 54D5BD42
P 1100 1600
F 0 "#PWR?" H 1100 1690 20  0001 C CNN
F 1 "+5V" H 1100 1690 30  0000 C CNN
F 2 "" H 1100 1600 60  0000 C CNN
F 3 "" H 1100 1600 60  0000 C CNN
	1    1100 1600
	1    0    0    -1  
$EndComp
$Comp
L +15V #PWR?
U 1 1 54D5BD89
P 1450 1600
F 0 "#PWR?" H 1450 1450 60  0001 C CNN
F 1 "+15V" H 1450 1740 60  0000 C CNN
F 2 "" H 1450 1600 60  0000 C CNN
F 3 "" H 1450 1600 60  0000 C CNN
	1    1450 1600
	1    0    0    -1  
$EndComp
Text HLabel 900  2450 0    60   Input ~ 0
GND
Wire Wire Line
	900  2450 1450 2450
Wire Wire Line
	1450 2450 1450 2600
$Comp
L GND #PWR?
U 1 1 54D5C2B6
P 1450 2600
F 0 "#PWR?" H 1450 2600 30  0001 C CNN
F 1 "GND" H 1450 2530 30  0001 C CNN
F 2 "" H 1450 2600 60  0000 C CNN
F 3 "" H 1450 2600 60  0000 C CNN
	1    1450 2600
	1    0    0    -1  
$EndComp
Wire Notes Line
	2400 2750 5250 2750
Wire Notes Line
	5250 2750 5250 4450
Wire Notes Line
	5250 4450 2400 4450
Wire Notes Line
	2400 4450 2400 2750
Wire Notes Line
	6350 2500 10300 2500
Wire Notes Line
	10300 2500 10300 4750
Wire Notes Line
	10300 4750 6350 4750
Wire Notes Line
	6350 4750 6350 2500
$EndSCHEMATC
