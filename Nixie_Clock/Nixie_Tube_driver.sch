EESchema Schematic File Version 4
LIBS:Nixie_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L 74xx_IEEE:74141 U?
U 1 1 5E03B6CB
P 2350 1800
AR Path="/5E03B6CB" Ref="U?"  Part="1" 
AR Path="/5E03B664/5E03B6CB" Ref="Um1"  Part="1" 
F 0 "Um1" H 2100 2400 50  0000 C CNN
F 1 "74141" H 2550 2400 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2350 1800 50  0001 C CNN
F 3 "" H 2350 1800 50  0001 C CNN
	1    2350 1800
	1    0    0    -1  
$EndComp
Text GLabel 2950 800  0    50   Input ~ 0
170V
$Comp
L Device:R R11
U 1 1 5E040985
P 4450 1950
F 0 "R11" V 4243 1950 50  0000 C CNN
F 1 "10k" V 4334 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4380 1950 50  0001 C CNN
F 3 "~" H 4450 1950 50  0001 C CNN
	1    4450 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 800  6250 800 
Text HLabel 1250 1650 0    50   Input ~ 0
m01
Text HLabel 1250 1750 0    50   Input ~ 0
m02
Text HLabel 1250 1850 0    50   Input ~ 0
m03
Text HLabel 1250 1950 0    50   Input ~ 0
m04
Text HLabel 1250 3450 0    50   Input ~ 0
m14
Text HLabel 1250 3150 0    50   Input ~ 0
m11
Text HLabel 1250 3250 0    50   Input ~ 0
m12
Text HLabel 1250 3350 0    50   Input ~ 0
m13
Text HLabel 1250 4700 0    50   Input ~ 0
h01
Text HLabel 1250 4800 0    50   Input ~ 0
h02
Text HLabel 1250 4900 0    50   Input ~ 0
h03
Text HLabel 1250 5000 0    50   Input ~ 0
h04
Text HLabel 1250 6200 0    50   Input ~ 0
h11
Text HLabel 1250 6300 0    50   Input ~ 0
h12
Text HLabel 1250 6400 0    50   Input ~ 0
h13
Text HLabel 1250 6500 0    50   Input ~ 0
h14
Wire Wire Line
	1250 1650 1750 1650
Wire Wire Line
	1750 1750 1250 1750
Wire Wire Line
	1250 1850 1750 1850
Wire Wire Line
	1250 1950 1750 1950
Wire Wire Line
	1250 3150 1750 3150
Wire Wire Line
	1250 3250 1750 3250
Wire Wire Line
	1250 3350 1750 3350
Wire Wire Line
	1250 3450 1750 3450
Wire Wire Line
	1250 4700 1750 4700
Wire Wire Line
	1250 4800 1750 4800
Wire Wire Line
	1250 4900 1750 4900
Wire Wire Line
	1250 5000 1750 5000
Wire Wire Line
	1250 6200 1750 6200
Wire Wire Line
	1250 6300 1750 6300
Wire Wire Line
	1250 6400 1750 6400
Wire Wire Line
	1250 6500 1750 6500
$Comp
L Device:R R12
U 1 1 5E1D0DF7
P 4450 3450
F 0 "R12" V 4243 3450 50  0000 C CNN
F 1 "10k" V 4334 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4380 3450 50  0001 C CNN
F 3 "~" H 4450 3450 50  0001 C CNN
	1    4450 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5E1D1073
P 4450 5000
F 0 "R13" V 4243 5000 50  0000 C CNN
F 1 "10k" V 4334 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4380 5000 50  0001 C CNN
F 3 "~" H 4450 5000 50  0001 C CNN
	1    4450 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 5E1D107A
P 4450 6500
F 0 "R14" V 4243 6500 50  0000 C CNN
F 1 "10k" V 4334 6500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4380 6500 50  0001 C CNN
F 3 "~" H 4450 6500 50  0001 C CNN
	1    4450 6500
	0    1    1    0   
$EndComp
Text HLabel 3050 800  3    50   Input ~ 0
170V
$Comp
L nixies-us:IN-14 Nm1
U 1 1 5E27B219
P 3600 1850
F 0 "Nm1" H 3400 2550 45  0000 C CNN
F 1 "IN-14" H 3600 1850 45  0001 L BNN
F 2 "nixies-us:nixies-us-IN-14" H 3630 2000 20  0001 C CNN
F 3 "" H 3600 1850 50  0001 C CNN
	1    3600 1850
	1    0    0    -1  
$EndComp
$Comp
L nixies-us:IN-14 Nm10
U 1 1 5E27B2B4
P 3600 3350
F 0 "Nm10" H 3400 4000 45  0000 C CNN
F 1 "IN-14" H 3600 3350 45  0001 L BNN
F 2 "nixies-us:nixies-us-IN-14" H 3630 3500 20  0001 C CNN
F 3 "" H 3600 3350 50  0001 C CNN
	1    3600 3350
	1    0    0    -1  
$EndComp
$Comp
L nixies-us:IN-14 Nh1
U 1 1 5E27C36E
P 3600 4900
F 0 "Nh1" H 3400 5550 45  0000 C CNN
F 1 "IN-14" H 3600 4900 45  0001 L BNN
F 2 "nixies-us:nixies-us-IN-14" H 3630 5050 20  0001 C CNN
F 3 "" H 3600 4900 50  0001 C CNN
	1    3600 4900
	1    0    0    -1  
$EndComp
$Comp
L nixies-us:IN-14 Nh10
U 1 1 5E27C375
P 3600 6400
F 0 "Nh10" H 3400 7050 45  0000 C CNN
F 1 "IN-14" H 3600 6400 45  0001 L BNN
F 2 "nixies-us:nixies-us-IN-14" H 3630 6550 20  0001 C CNN
F 3 "" H 3600 6400 50  0001 C CNN
	1    3600 6400
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74141 Um?
U 1 1 5E27C6C4
P 2350 3300
AR Path="/5E27C6C4" Ref="Um?"  Part="1" 
AR Path="/5E03B664/5E27C6C4" Ref="Um2"  Part="1" 
F 0 "Um2" H 2100 3900 50  0000 C CNN
F 1 "74141" H 2550 3900 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2350 3300 50  0001 C CNN
F 3 "" H 2350 3300 50  0001 C CNN
	1    2350 3300
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74141 Um?
U 1 1 5E27C9E7
P 2350 4850
AR Path="/5E27C9E7" Ref="Um?"  Part="1" 
AR Path="/5E03B664/5E27C9E7" Ref="Um3"  Part="1" 
F 0 "Um3" H 2100 5450 50  0000 C CNN
F 1 "74141" H 2550 5450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2350 4850 50  0001 C CNN
F 3 "" H 2350 4850 50  0001 C CNN
	1    2350 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74141 Um?
U 1 1 5E27CD01
P 2350 6350
AR Path="/5E27CD01" Ref="Um?"  Part="1" 
AR Path="/5E03B664/5E27CD01" Ref="Um4"  Part="1" 
F 0 "Um4" H 2100 6950 50  0000 C CNN
F 1 "74141" H 2550 6950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2350 6350 50  0001 C CNN
F 3 "" H 2350 6350 50  0001 C CNN
	1    2350 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1450 3300 1450
Wire Wire Line
	2950 1550 3300 1550
Wire Wire Line
	2950 1650 3300 1650
Wire Wire Line
	2950 1750 3300 1750
Wire Wire Line
	2950 1850 3300 1850
Wire Wire Line
	3300 1950 2950 1950
Wire Wire Line
	2950 2050 3300 2050
Wire Wire Line
	2950 2150 3300 2150
Wire Wire Line
	2950 2250 3300 2250
Wire Wire Line
	2950 1350 3100 1350
Wire Wire Line
	3100 1350 3100 2350
Wire Wire Line
	3100 2350 3300 2350
Wire Wire Line
	2950 2950 3300 2950
Wire Wire Line
	2950 3050 3300 3050
Wire Wire Line
	2950 3150 3300 3150
Wire Wire Line
	2950 3250 3300 3250
Wire Wire Line
	2950 3350 3300 3350
Wire Wire Line
	3300 3450 2950 3450
Wire Wire Line
	2950 3550 3300 3550
Wire Wire Line
	2950 3650 3300 3650
Wire Wire Line
	2950 3750 3300 3750
Wire Wire Line
	2950 2850 3100 2850
Wire Wire Line
	3100 2850 3100 3850
Wire Wire Line
	3100 3850 3300 3850
Wire Wire Line
	2950 4500 3300 4500
Wire Wire Line
	2950 4600 3300 4600
Wire Wire Line
	2950 4700 3300 4700
Wire Wire Line
	2950 4800 3300 4800
Wire Wire Line
	2950 4900 3300 4900
Wire Wire Line
	3300 5000 2950 5000
Wire Wire Line
	2950 5100 3300 5100
Wire Wire Line
	2950 5200 3300 5200
Wire Wire Line
	2950 5300 3300 5300
Wire Wire Line
	2950 4400 3100 4400
Wire Wire Line
	3100 4400 3100 5400
Wire Wire Line
	3100 5400 3300 5400
Wire Wire Line
	2950 6000 3300 6000
Wire Wire Line
	2950 6100 3300 6100
Wire Wire Line
	2950 6200 3300 6200
Wire Wire Line
	2950 6300 3300 6300
Wire Wire Line
	2950 6400 3300 6400
Wire Wire Line
	3300 6500 2950 6500
Wire Wire Line
	2950 6600 3300 6600
Wire Wire Line
	2950 6700 3300 6700
Wire Wire Line
	2950 6800 3300 6800
Wire Wire Line
	2950 5900 3100 5900
Wire Wire Line
	3100 5900 3100 6900
Wire Wire Line
	3100 6900 3300 6900
Wire Wire Line
	4000 1950 4300 1950
Wire Wire Line
	4000 3450 4300 3450
Wire Wire Line
	4000 5000 4300 5000
Wire Wire Line
	4000 6500 4300 6500
Wire Wire Line
	4600 6500 6250 6500
Wire Wire Line
	6250 800  6250 1950
Wire Wire Line
	4600 5000 6250 5000
Connection ~ 6250 5000
Wire Wire Line
	6250 5000 6250 6500
Wire Wire Line
	4600 3450 6250 3450
Connection ~ 6250 3450
Wire Wire Line
	6250 3450 6250 5000
Wire Wire Line
	4600 1950 6250 1950
Connection ~ 6250 1950
Wire Wire Line
	6250 1950 6250 3450
NoConn ~ 4000 1450
NoConn ~ 4000 2350
NoConn ~ 4000 2950
NoConn ~ 4000 3850
NoConn ~ 4000 4500
NoConn ~ 4000 5400
NoConn ~ 4000 6000
NoConn ~ 4000 6900
$Comp
L power:GND #PWR?
U 1 1 5E2C4BA0
P 2350 2350
AR Path="/5E2C4BA0" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2C4BA0" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2350 2100 50  0001 C CNN
F 1 "GND" H 2350 2200 50  0000 C CNN
F 2 "" H 2350 2350 50  0001 C CNN
F 3 "" H 2350 2350 50  0001 C CNN
	1    2350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E2C4BA6
P 2350 1250
AR Path="/5E2C4BA6" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2C4BA6" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2350 1100 50  0001 C CNN
F 1 "+5V" H 2365 1423 50  0000 C CNN
F 2 "" H 2350 1250 50  0001 C CNN
F 3 "" H 2350 1250 50  0001 C CNN
	1    2350 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2C6A1E
P 2350 3850
AR Path="/5E2C6A1E" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2C6A1E" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2350 3600 50  0001 C CNN
F 1 "GND" H 2350 3700 50  0000 C CNN
F 2 "" H 2350 3850 50  0001 C CNN
F 3 "" H 2350 3850 50  0001 C CNN
	1    2350 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E2C6A24
P 2350 2750
AR Path="/5E2C6A24" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2C6A24" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 2350 2600 50  0001 C CNN
F 1 "+5V" H 2365 2923 50  0000 C CNN
F 2 "" H 2350 2750 50  0001 C CNN
F 3 "" H 2350 2750 50  0001 C CNN
	1    2350 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2C8860
P 2350 5400
AR Path="/5E2C8860" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2C8860" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 2350 5150 50  0001 C CNN
F 1 "GND" H 2350 5250 50  0000 C CNN
F 2 "" H 2350 5400 50  0001 C CNN
F 3 "" H 2350 5400 50  0001 C CNN
	1    2350 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E2C8866
P 2350 4300
AR Path="/5E2C8866" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2C8866" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 2350 4150 50  0001 C CNN
F 1 "+5V" H 2365 4473 50  0000 C CNN
F 2 "" H 2350 4300 50  0001 C CNN
F 3 "" H 2350 4300 50  0001 C CNN
	1    2350 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2CA6D2
P 2350 6900
AR Path="/5E2CA6D2" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2CA6D2" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 2350 6650 50  0001 C CNN
F 1 "GND" H 2355 6727 50  0000 C CNN
F 2 "" H 2350 6900 50  0001 C CNN
F 3 "" H 2350 6900 50  0001 C CNN
	1    2350 6900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E2CA6D8
P 2350 5800
AR Path="/5E2CA6D8" Ref="#PWR?"  Part="1" 
AR Path="/5E03B664/5E2CA6D8" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 2350 5650 50  0001 C CNN
F 1 "+5V" H 2365 5973 50  0000 C CNN
F 2 "" H 2350 5800 50  0001 C CNN
F 3 "" H 2350 5800 50  0001 C CNN
	1    2350 5800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
