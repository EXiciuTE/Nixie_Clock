EESchema Schematic File Version 4
LIBS:Nixie_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "Nixie_Clock"
Date "2019-12-22"
Rev "1.0"
Comp ""
Comment1 "Erik Friedel"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 9850 4600 950  950 
U 5DFF9AAB
F0 "170V Power Supply" 50
F1 "170V_power_supply.sch" 50
F2 "170V" I L 9850 5100 50 
$EndSheet
$Comp
L power:+5V #PWR01
U 1 1 5DFF9B38
P 2150 2350
F 0 "#PWR01" H 2150 2200 50  0001 C CNN
F 1 "+5V" H 2165 2523 50  0000 C CNN
F 2 "" H 2150 2350 50  0001 C CNN
F 3 "" H 2150 2350 50  0001 C CNN
	1    2150 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5DFF9B6F
P 2150 2450
F 0 "#PWR02" H 2150 2200 50  0001 C CNN
F 1 "GND" H 2155 2277 50  0000 C CNN
F 2 "" H 2150 2450 50  0001 C CNN
F 3 "" H 2150 2450 50  0001 C CNN
	1    2150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2350 2150 2350
Wire Wire Line
	1800 2450 2150 2450
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5E02A82F
P 1600 2350
F 0 "J1" H 1494 2025 50  0000 C CNN
F 1 "External_Power_Pins" H 1494 2116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1600 2350 50  0001 C CNN
F 3 "~" H 1600 2350 50  0001 C CNN
	1    1600 2350
	-1   0    0    1   
$EndComp
Text GLabel 1800 2250 2    50   Input ~ 0
~SHDN
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U3
U 1 1 5E03A40A
P 5100 4400
F 0 "U3" H 4459 4446 50  0000 R CNN
F 1 "ATmega328P-PU" H 4459 4355 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5100 4400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 5100 4400 50  0001 C CNN
	1    5100 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector:AVR-ISP-6 J3
U 1 1 5E03AB84
P 6200 2200
F 0 "J3" H 5870 2296 50  0000 R CNN
F 1 "AVR-ISP-6" H 5870 2205 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 5950 2250 50  0001 C CNN
F 3 " ~" H 4925 1650 50  0001 C CNN
	1    6200 2200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E03AE18
P 6750 2100
F 0 "#PWR03" H 6750 1950 50  0001 C CNN
F 1 "+5V" H 6765 2273 50  0000 C CNN
F 2 "" H 6750 2100 50  0001 C CNN
F 3 "" H 6750 2100 50  0001 C CNN
	1    6750 2100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E03AE1E
P 5750 2100
F 0 "#PWR05" H 5750 1850 50  0001 C CNN
F 1 "GND" H 5755 1927 50  0000 C CNN
F 2 "" H 5750 2100 50  0001 C CNN
F 3 "" H 5750 2100 50  0001 C CNN
	1    5750 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 2100 6700 2100
Wire Wire Line
	5800 2100 5750 2100
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 5E03B0E3
P 1600 2950
F 0 "J2" H 1494 2625 50  0000 C CNN
F 1 "Serial-programmer" H 1494 2716 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1600 2950 50  0001 C CNN
F 3 "~" H 1600 2950 50  0001 C CNN
	1    1600 2950
	-1   0    0    1   
$EndComp
Text GLabel 6100 2750 0    50   Input ~ 0
~Reset
Text GLabel 2000 3050 2    50   Input ~ 0
~Reset
Text GLabel 6250 4800 2    50   Input ~ 0
~Reset
Wire Wire Line
	1800 3050 2000 3050
Text Label 5700 4900 0    50   ~ 0
Pin0_RX
Text Label 5700 5000 0    50   ~ 0
Pin1_TX
Text Label 1800 2850 0    50   ~ 0
Pin0_RX
Text Label 1800 2950 0    50   ~ 0
Pin1_TX
$Comp
L Device:R R10
U 1 1 5E03BB5A
P 6400 4650
F 0 "R10" V 6193 4650 50  0000 C CNN
F 1 "10k" V 6284 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6330 4650 50  0001 C CNN
F 3 "~" H 6400 4650 50  0001 C CNN
	1    6400 4650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5E03BC09
P 6600 4650
F 0 "#PWR09" H 6600 4500 50  0001 C CNN
F 1 "+5V" H 6615 4823 50  0000 C CNN
F 2 "" H 6600 4650 50  0001 C CNN
F 3 "" H 6600 4650 50  0001 C CNN
	1    6600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4650 6250 4700
Connection ~ 6250 4700
Wire Wire Line
	6250 4700 6250 4800
$Comp
L Device:C C12
U 1 1 5E03C161
P 4850 2450
F 0 "C12" H 4965 2496 50  0000 L CNN
F 1 "100n" H 4965 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4888 2300 50  0001 C CNN
F 3 "~" H 4850 2450 50  0001 C CNN
	1    4850 2450
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C13
U 1 1 5E03C1A7
P 4850 2650
F 0 "C13" H 4650 2700 50  0000 L CNN
F 1 "47u" H 4600 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 4888 2500 50  0001 C CNN
F 3 "~" H 4850 2650 50  0001 C CNN
	1    4850 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5100 2900 5200 2900
Connection ~ 4700 2650
Wire Wire Line
	4700 2650 4700 2450
$Comp
L power:+5V #PWR07
U 1 1 5E03C6D1
P 4700 2400
F 0 "#PWR07" H 4700 2250 50  0001 C CNN
F 1 "+5V" H 4650 2550 50  0000 C CNN
F 2 "" H 4700 2400 50  0001 C CNN
F 3 "" H 4700 2400 50  0001 C CNN
	1    4700 2400
	1    0    0    -1  
$EndComp
Connection ~ 4700 2450
$Comp
L power:GND #PWR06
U 1 1 5E03CD44
P 5100 5900
F 0 "#PWR06" H 5100 5650 50  0001 C CNN
F 1 "GND" H 5105 5727 50  0000 C CNN
F 2 "" H 5100 5900 50  0001 C CNN
F 3 "" H 5100 5900 50  0001 C CNN
	1    5100 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5E03F4D6
P 2550 2450
F 0 "D2" H 2550 2250 50  0000 C CNN
F 1 "LED" H 2550 2350 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2550 2450 50  0001 C CNN
F 3 "~" H 2550 2450 50  0001 C CNN
	1    2550 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5E03F5E7
P 2550 2350
F 0 "R9" V 2343 2350 50  0000 C CNN
F 1 "330" V 2434 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2480 2350 50  0001 C CNN
F 3 "~" H 2550 2350 50  0001 C CNN
	1    2550 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 2350 2400 2350
Connection ~ 2150 2350
Wire Wire Line
	2700 2350 2700 2450
Wire Wire Line
	2400 2450 2150 2450
Connection ~ 2150 2450
NoConn ~ 4500 3200
Text Label 6200 2800 3    50   ~ 0
SCK
Text Label 6300 2800 3    50   ~ 0
MOSI
Text Label 6400 2800 3    50   ~ 0
MISO
Wire Wire Line
	4700 2900 5100 2900
Connection ~ 5100 2900
Wire Wire Line
	4700 2650 4700 2900
Wire Wire Line
	5700 3700 6200 3700
Wire Wire Line
	6200 2600 6200 3700
Wire Wire Line
	6400 3600 5700 3600
Wire Wire Line
	6400 2600 6400 3600
Wire Wire Line
	6600 4650 6550 4650
$Sheet
S 7000 3800 1050 1050
U 5E03B664
F0 "Nixie Tube un Treiber" 50
F1 "Nixie_Tube_driver.sch" 50
F2 "m04" I B 7350 4850 50 
F3 "m14" I T 7350 3800 50 
F4 "m11" I T 7050 3800 50 
F5 "m12" I T 7150 3800 50 
F6 "m13" I T 7250 3800 50 
F7 "h01" I T 7550 3800 50 
F8 "h02" I T 7650 3800 50 
F9 "h03" I T 7750 3800 50 
F10 "h04" I T 7850 3800 50 
F11 "h11" I B 7500 4850 50 
F12 "h12" I B 7600 4850 50 
F13 "h13" I B 7700 4850 50 
F14 "h14" I B 7800 4850 50 
F15 "170V" I B 7950 4850 50 
F16 "m01" I B 7050 4850 50 
F17 "m02" I B 7150 4850 50 
F18 "m03" I B 7250 4850 50 
$EndSheet
Wire Wire Line
	5700 4900 7050 4900
Wire Wire Line
	7050 4900 7050 4850
Wire Wire Line
	5700 5000 7150 5000
Wire Wire Line
	7150 5000 7150 4850
Wire Wire Line
	5700 5100 7250 5100
Wire Wire Line
	7250 5100 7250 4850
Wire Wire Line
	5700 5200 7350 5200
Wire Wire Line
	7350 5200 7350 4850
Wire Wire Line
	5700 4600 6250 4600
Wire Wire Line
	6250 4600 6250 4350
Wire Wire Line
	6250 4350 6900 4350
Wire Wire Line
	6900 4350 6900 3750
Wire Wire Line
	6900 3750 7050 3750
Wire Wire Line
	7050 3750 7050 3800
Wire Wire Line
	5700 4500 6200 4500
Wire Wire Line
	6200 4500 6200 4300
Wire Wire Line
	6200 4300 6850 4300
Wire Wire Line
	6850 4300 6850 3700
Wire Wire Line
	6850 3700 7150 3700
Wire Wire Line
	7150 3700 7150 3800
Wire Wire Line
	5700 4400 6150 4400
Wire Wire Line
	6150 4400 6150 4250
Wire Wire Line
	6150 4250 6800 4250
Wire Wire Line
	6800 4250 6800 3650
Wire Wire Line
	6800 3650 7250 3650
Wire Wire Line
	7250 3650 7250 3800
Wire Wire Line
	5700 4300 6050 4300
Wire Wire Line
	6050 4300 6050 4200
Wire Wire Line
	6050 4200 6750 4200
Wire Wire Line
	6750 4200 6750 3600
Wire Wire Line
	6750 3600 7350 3600
Wire Wire Line
	7350 3600 7350 3800
Wire Wire Line
	5700 5300 7500 5300
Wire Wire Line
	7500 5300 7500 4850
Wire Wire Line
	5700 5400 7600 5400
Wire Wire Line
	7600 5400 7600 4850
Wire Wire Line
	5700 5500 7700 5500
Wire Wire Line
	7700 5500 7700 4850
Wire Wire Line
	5700 5600 7800 5600
Wire Wire Line
	7800 5600 7800 4850
Wire Wire Line
	7850 3200 7850 3800
Wire Wire Line
	7750 3300 7750 3800
Wire Wire Line
	7650 3400 7650 3800
Wire Wire Line
	7550 3500 7550 3800
Wire Wire Line
	9850 5100 7950 5100
Wire Wire Line
	7950 5100 7950 4850
Wire Wire Line
	5000 2450 5000 2550
$Comp
L power:GND #PWR010
U 1 1 5E1FE386
P 5000 2550
F 0 "#PWR010" H 5000 2300 50  0001 C CNN
F 1 "GND" H 5005 2377 50  0000 C CNN
F 2 "" H 5000 2550 50  0001 C CNN
F 3 "" H 5000 2550 50  0001 C CNN
	1    5000 2550
	0    -1   -1   0   
$EndComp
Connection ~ 6100 4700
Wire Wire Line
	6100 2600 6100 4700
Wire Wire Line
	6300 2600 6300 3500
Wire Wire Line
	6100 4700 6250 4700
Wire Wire Line
	5700 4700 6100 4700
Text GLabel 5700 4100 2    50   Input ~ 0
~SHDN
Wire Wire Line
	6300 3500 5700 3500
Text Label 5700 3200 0    50   ~ 0
SDA
Text Label 1850 3450 0    50   ~ 0
SDA
Text Label 5700 3300 0    50   ~ 0
SCL
Text Label 1850 3550 0    50   ~ 0
SCL
$Comp
L power:GND #PWR08
U 1 1 5E2F6185
P 9800 3150
F 0 "#PWR08" H 9800 2900 50  0001 C CNN
F 1 "GND" H 9805 2977 50  0000 C CNN
F 2 "" H 9800 3150 50  0001 C CNN
F 3 "" H 9800 3150 50  0001 C CNN
	1    9800 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5E2F618B
P 9150 3150
F 0 "Y1" V 9050 3200 50  0000 L CNN
F 1 "Crystal" V 9150 3050 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 9150 3150 50  0001 C CNN
F 3 "~" H 9150 3150 50  0001 C CNN
	1    9150 3150
	0    1    1    0   
$EndComp
$Comp
L Device:C C14
U 1 1 5E2F6192
P 9650 3000
F 0 "C14" V 9600 3100 50  0000 C CNN
F 1 "22pF" V 9500 3000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9688 2850 50  0001 C CNN
F 3 "~" H 9650 3000 50  0001 C CNN
	1    9650 3000
	0    1    1    0   
$EndComp
$Comp
L Device:C C15
U 1 1 5E2F6199
P 9650 3300
F 0 "C15" V 9700 3400 50  0000 C CNN
F 1 "22pF" V 9800 3300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9688 3150 50  0001 C CNN
F 3 "~" H 9650 3300 50  0001 C CNN
	1    9650 3300
	0    1    1    0   
$EndComp
Connection ~ 9150 3000
Wire Wire Line
	9150 3000 9500 3000
Connection ~ 9150 3300
Wire Wire Line
	9150 3300 9000 3300
Wire Wire Line
	9150 3300 9500 3300
Wire Wire Line
	9000 3000 9150 3000
Connection ~ 9800 3150
Wire Wire Line
	9800 3150 9800 3300
Text Label 5700 3800 0    50   ~ 0
XTAL1
Text Label 5700 3900 0    50   ~ 0
XTAL2
Text Label 9000 3000 2    50   ~ 0
XTAL1
Text Label 9000 3300 2    50   ~ 0
XTAL2
Wire Wire Line
	9800 3000 9800 3150
Wire Wire Line
	6200 3700 6650 3700
Wire Wire Line
	6650 3700 6650 3500
Wire Wire Line
	6650 3500 7550 3500
Connection ~ 6200 3700
Wire Wire Line
	7650 3400 6600 3400
Wire Wire Line
	6600 3400 6600 3600
Wire Wire Line
	6600 3600 6400 3600
Connection ~ 6400 3600
Wire Wire Line
	7750 3300 6550 3300
Wire Wire Line
	6550 3300 6550 3500
Wire Wire Line
	6550 3500 6300 3500
Connection ~ 6300 3500
Wire Wire Line
	7850 3200 6500 3200
Wire Wire Line
	6500 3200 6500 3400
Wire Wire Line
	6500 3400 5700 3400
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5E31B526
P 1650 3550
F 0 "J5" H 1544 3225 50  0000 C CNN
F 1 "RTC_Pins" H 1544 3316 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1650 3550 50  0001 C CNN
F 3 "~" H 1650 3550 50  0001 C CNN
	1    1650 3550
	-1   0    0    1   
$EndComp
NoConn ~ 5700 4200
Wire Wire Line
	4700 2450 4700 2400
Connection ~ 5000 2550
Wire Wire Line
	5000 2550 5000 2650
$EndSCHEMATC
