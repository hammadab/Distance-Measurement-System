# Clock signal
set_property PACKAGE_PIN W5 [get_ports Clock]
set_property IOSTANDARD LVCMOS33 [get_ports Clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clock]

#Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {Echo}]
set_property IOSTANDARD LVCMOS33 [get_ports {Echo}]

#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {Trig}]
set_property IOSTANDARD LVCMOS33 [get_ports {Trig}]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]

set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]
#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

# Switches
set_property PACKAGE_PIN V17 [get_ports {switch[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[0]}]

set_property PACKAGE_PIN V16 [get_ports {switch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[1]}]

#set_property PACKAGE_PIN T2 [get_ports {samples[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {samples[0]}]

#set_property PACKAGE_PIN R3 [get_ports {samples[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {samples[1]}]

#set_property PACKAGE_PIN W2 [get_ports {samples[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {samples[2]}]

#set_property PACKAGE_PIN U1 [get_ports {samples[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {samples[3]}]

#set_property PACKAGE_PIN T1 [get_ports {samples[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {samples[4]}]

#set_property PACKAGE_PIN R2 [get_ports {samples[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {samples[5]}]

## Switches
#set_property PACKAGE_PIN V17 [get_ports {red[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]

#set_property PACKAGE_PIN V16 [get_ports {red[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]

#set_property PACKAGE_PIN W16 [get_ports {red[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]

#set_property PACKAGE_PIN W17 [get_ports {red[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]

#set_property PACKAGE_PIN W15 [get_ports {green[0]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]

#set_property PACKAGE_PIN V15 [get_ports {green[1]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]

#set_property PACKAGE_PIN W14 [get_ports {green[2]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]

#set_property PACKAGE_PIN W13 [get_ports {green[3]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]

#set_property PACKAGE_PIN V2 [get_ports {blue[0]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]

#set_property PACKAGE_PIN T3 [get_ports {blue[1]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]

#set_property PACKAGE_PIN T2 [get_ports {blue[2]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]

#set_property PACKAGE_PIN R3 [get_ports {blue[3]}]    
#set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]

#VGA Connector
#Bank = 14, Pin name = ,					Sch name = VGA_R0
set_property PACKAGE_PIN G19 [get_ports {VGA_RED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_RED[0]}]
#Bank = 14, Pin name = ,					Sch name = VGA_R1
set_property PACKAGE_PIN H19 [get_ports {VGA_RED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_RED[1]}]
#Bank = 14, Pin name = ,					Sch name = VGA_R2
set_property PACKAGE_PIN J19 [get_ports {VGA_RED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_RED[2]}]
#Bank = 14, Pin name = ,					Sch name = VGA_R3
set_property PACKAGE_PIN N19 [get_ports {VGA_RED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_RED[3]}]
#Bank = 14, Pin name = ,					Sch name = VGA_B0
set_property PACKAGE_PIN N18 [get_ports {VGA_BLUE[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_BLUE[0]}]
#Bank = 14, Pin name = ,						Sch name = VGA_B1
set_property PACKAGE_PIN L18 [get_ports {VGA_BLUE[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_BLUE[1]}]
#Bank = 14, Pin name = ,					Sch name = VGA_B2
set_property PACKAGE_PIN K18 [get_ports {VGA_BLUE[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_BLUE[2]}]
#Bank = 14, Pin name = ,						Sch name = VGA_B3
set_property PACKAGE_PIN J18 [get_ports {VGA_BLUE[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_BLUE[3]}]
#Bank = 14, Pin name = ,					Sch name = VGA_G0
set_property PACKAGE_PIN J17 [get_ports {VGA_GREEN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_GREEN[0]}]
#Bank = 14, Pin name = ,				Sch name = VGA_G1
set_property PACKAGE_PIN H17 [get_ports {VGA_GREEN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_GREEN[1]}]
#Bank = 14, Pin name = ,					Sch name = VGA_G2
set_property PACKAGE_PIN G17 [get_ports {VGA_GREEN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_GREEN[2]}]
#Bank = 14, Pin name = ,				Sch name = VGA_G3
set_property PACKAGE_PIN D17 [get_ports {VGA_GREEN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_GREEN[3]}]
#Bank = 14, Pin name = ,						Sch name = VGA_HS
set_property PACKAGE_PIN P19 [get_ports H_sync]
set_property IOSTANDARD LVCMOS33 [get_ports H_sync]
#Bank = 14, Pin name = ,				Sch name = VGA_VS
set_property PACKAGE_PIN R19 [get_ports V_sync]
set_property IOSTANDARD LVCMOS33 [get_ports V_sync]