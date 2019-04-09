EESchema Schematic File Version 4
EELAYER 29 0
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
$Comp
L Device:LED D2
U 1 1 5CAC2E61
P 4950 2500
F 0 "D2" H 4943 2716 50  0000 C CNN
F 1 "HDD_LED" H 4943 2625 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 4950 2500 50  0001 C CNN
F 3 "~" H 4950 2500 50  0001 C CNN
	1    4950 2500
	1    0    0    -1  
$EndComp
$Comp
L my_components:Switch_Tactile SW2
U 1 1 5CAC3E32
P 4900 3300
F 0 "SW2" H 4900 3555 50  0000 C CNN
F 1 "Reset_Switch" H 4900 3464 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H7.3mm" H 4900 3300 60  0001 C CNN
F 3 "" H 4900 3300 60  0000 C CNN
	1    4900 3300
	1    0    0    -1  
$EndComp
$Comp
L my_components:Switch_Tactile SW1
U 1 1 5CAC46C8
P 6600 3300
F 0 "SW1" H 6600 3555 50  0000 C CNN
F 1 "Power_Switch" H 6600 3464 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H7.3mm" H 6600 3300 60  0001 C CNN
F 3 "" H 6600 3300 60  0000 C CNN
	1    6600 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 5CAC50FB
P 5700 2900
F 0 "J1" H 5750 3317 50  0000 C CNN
F 1 "Front_Panel" H 5750 3226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 5700 2900 50  0001 C CNN
F 3 "~" H 5700 2900 50  0001 C CNN
	1    5700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2700 5300 2700
Wire Wire Line
	5300 2700 5300 2500
Wire Wire Line
	5300 2500 5100 2500
Wire Wire Line
	5500 2800 4500 2800
Wire Wire Line
	4500 2800 4500 2500
Wire Wire Line
	4500 2500 4800 2500
$Comp
L Device:LED D1
U 1 1 5CAC380F
P 6550 2500
F 0 "D1" H 6543 2716 50  0000 C CNN
F 1 "Power_LED" H 6543 2625 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6550 2500 50  0001 C CNN
F 3 "~" H 6550 2500 50  0001 C CNN
	1    6550 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6000 2800 7000 2800
Wire Wire Line
	6000 2700 6200 2700
Wire Wire Line
	6200 2700 6200 2500
Wire Wire Line
	7000 2500 7000 2800
Wire Wire Line
	6200 2500 6400 2500
Wire Wire Line
	6700 2500 7000 2500
Wire Wire Line
	6000 2900 7000 2900
Wire Wire Line
	7000 2900 7000 3300
Wire Wire Line
	6000 3000 6200 3000
Wire Wire Line
	6200 3000 6200 3300
Wire Wire Line
	6200 3300 6300 3300
Wire Wire Line
	6900 3300 7000 3300
Wire Wire Line
	4600 3300 4500 3300
Wire Wire Line
	4500 3300 4500 2900
Wire Wire Line
	4500 2900 5500 2900
Wire Wire Line
	5500 3000 5300 3000
Wire Wire Line
	5300 3000 5300 3300
Wire Wire Line
	5300 3300 5200 3300
NoConn ~ 5500 3100
NoConn ~ 6000 3100
$Comp
L Mechanical:MountingHole H1
U 1 1 5CAD6709
P 5750 3700
F 0 "H1" H 5850 3746 50  0000 L CNN
F 1 "MountingHole" H 5850 3655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5750 3700 50  0001 C CNN
F 3 "~" H 5750 3700 50  0001 C CNN
	1    5750 3700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5CAD6C57
P 5750 3900
F 0 "H2" H 5850 3946 50  0000 L CNN
F 1 "MountingHole" H 5850 3855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5750 3900 50  0001 C CNN
F 3 "~" H 5750 3900 50  0001 C CNN
	1    5750 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
