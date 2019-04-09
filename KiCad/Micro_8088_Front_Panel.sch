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
P 5950 2800
F 0 "D2" H 5943 3016 50  0000 C CNN
F 1 "HDD_LED" H 5943 2925 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5950 2800 50  0001 C CNN
F 3 "~" H 5950 2800 50  0001 C CNN
	1    5950 2800
	1    0    0    -1  
$EndComp
$Comp
L my_components:Switch_Tactile SW2
U 1 1 5CAC3E32
P 5900 3600
F 0 "SW2" H 5900 3855 50  0000 C CNN
F 1 "Reset_Switch" H 5900 3764 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H7.3mm" H 5900 3600 60  0001 C CNN
F 3 "" H 5900 3600 60  0000 C CNN
	1    5900 3600
	1    0    0    -1  
$EndComp
$Comp
L my_components:Switch_Tactile SW1
U 1 1 5CAC46C8
P 7600 3600
F 0 "SW1" H 7600 3855 50  0000 C CNN
F 1 "Power_Switch" H 7600 3764 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H7.3mm" H 7600 3600 60  0001 C CNN
F 3 "" H 7600 3600 60  0000 C CNN
	1    7600 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 5CAC50FB
P 6700 3200
F 0 "J1" H 6750 3617 50  0000 C CNN
F 1 "Front_Panel" H 6750 3526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6700 3200 50  0001 C CNN
F 3 "~" H 6700 3200 50  0001 C CNN
	1    6700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3000 6300 3000
Wire Wire Line
	6300 3000 6300 2800
Wire Wire Line
	6300 2800 6100 2800
Wire Wire Line
	6500 3100 5500 3100
Wire Wire Line
	5500 3100 5500 2800
Wire Wire Line
	5500 2800 5800 2800
$Comp
L Device:LED D1
U 1 1 5CAC380F
P 7550 2800
F 0 "D1" H 7543 3016 50  0000 C CNN
F 1 "Power_LED" H 7543 2925 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 7550 2800 50  0001 C CNN
F 3 "~" H 7550 2800 50  0001 C CNN
	1    7550 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7000 3100 8000 3100
Wire Wire Line
	7000 3000 7200 3000
Wire Wire Line
	7200 3000 7200 2800
Wire Wire Line
	8000 2800 8000 3100
Wire Wire Line
	7200 2800 7400 2800
Wire Wire Line
	7700 2800 8000 2800
Wire Wire Line
	7000 3200 8000 3200
Wire Wire Line
	8000 3200 8000 3600
Wire Wire Line
	7000 3300 7200 3300
Wire Wire Line
	7200 3300 7200 3600
Wire Wire Line
	7200 3600 7300 3600
Wire Wire Line
	7900 3600 8000 3600
Wire Wire Line
	5600 3600 5500 3600
Wire Wire Line
	5500 3600 5500 3200
Wire Wire Line
	5500 3200 6500 3200
Wire Wire Line
	6500 3300 6300 3300
Wire Wire Line
	6300 3300 6300 3600
Wire Wire Line
	6300 3600 6200 3600
NoConn ~ 6500 3400
NoConn ~ 7000 3400
$Comp
L Mechanical:MountingHole H1
U 1 1 5CAD6709
P 6750 4000
F 0 "H1" H 6850 4046 50  0000 L CNN
F 1 "MountingHole" H 6850 3955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 6750 4000 50  0001 C CNN
F 3 "~" H 6750 4000 50  0001 C CNN
	1    6750 4000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5CAD6C57
P 6750 4200
F 0 "H2" H 6850 4246 50  0000 L CNN
F 1 "MountingHole" H 6850 4155 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 6750 4200 50  0001 C CNN
F 3 "~" H 6750 4200 50  0001 C CNN
	1    6750 4200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
