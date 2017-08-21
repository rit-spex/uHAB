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
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Notes Line
	650  850  650  5250
Wire Notes Line
	650  5250 3700 5250
Wire Notes Line
	3700 5250 3700 850 
Wire Notes Line
	3700 850  650  850 
Wire Notes Line
	3900 850  3900 5250
Wire Notes Line
	3900 5250 6900 5250
Wire Notes Line
	6900 5250 6900 850 
Wire Notes Line
	6900 850  3900 850 
Wire Notes Line
	7100 850  7100 5250
Wire Notes Line
	7100 5250 10100 5250
Wire Notes Line
	10100 5250 10100 850 
Wire Notes Line
	10100 850  7100 850 
Text Notes 1700 1050 0    60   ~ 0
Power Management
Text Notes 5000 1000 0    60   ~ 0
Micro Controller
Text Notes 8500 950  0    60   ~ 0
Sensors
Wire Notes Line
	700  5400 700  7650
Wire Notes Line
	700  7650 4650 7650
Wire Notes Line
	4650 7650 4650 5400
Wire Notes Line
	4650 5400 700  5400
Wire Notes Line
	4800 5450 4800 7650
Wire Notes Line
	4800 7650 6900 7650
Wire Notes Line
	6900 7650 6900 5400
Wire Notes Line
	6900 5400 4800 5400
Wire Notes Line
	4800 5400 4800 5500
Text Notes 2600 5550 0    60   ~ 0
Comms
Text Notes 5650 5550 0    60   ~ 0
Connectors
$Comp
L USB_OTG J?
U 1 1 599A084F
P 1000 1600
F 0 "J?" H 800 2050 50  0000 L CNN
F 1 "USB_OTG" H 800 1950 50  0000 L CNN
F 2 "" H 1150 1550 50  0001 C CNN
F 3 "" H 1150 1550 50  0001 C CNN
	1    1000 1600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
