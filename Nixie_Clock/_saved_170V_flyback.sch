EESchema Schematic File Version 4
LIBS:Nixie_Clock-cache
EELAYER 26 0
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
L Regulator_Switching:LT3757AEMSE U?
U 1 1 5DFF98C1
P 4650 2800
F 0 "U?" H 4700 3478 50  0000 C CNN
F 1 "LT3757AEMSE" H 4700 3387 50  0000 C CNN
F 2 "Package_SO:MSOP-10-1EP_3x3mm_P0.5mm_EP1.68x1.88mm" H 4700 2250 50  0001 L CNN
F 3 "http://cds.linear.com/docs/en/datasheet/3757Afe.pdf" H 4650 2800 50  0001 C CNN
	1    4650 2800
	1    0    0    -1  
$EndComp
Text GLabel 3350 2800 0    50   Input ~ 0
5V
Wire Wire Line
	3350 2800 4150 2800
Wire Wire Line
	4150 2900 4250 2900
Wire Wire Line
	4150 2800 4150 2900
$EndSCHEMATC
