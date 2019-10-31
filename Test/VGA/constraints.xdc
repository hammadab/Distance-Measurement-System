# Clock signal
set_property PACKAGE_PIN W5 [get_ports Clock]
set_property IOSTANDARD LVCMOS33 [get_ports Clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clock]

# Switches
set_property PACKAGE_PIN V17 [get_ports {red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]

set_property PACKAGE_PIN V16 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]

set_property PACKAGE_PIN W16 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]

set_property PACKAGE_PIN W17 [get_ports {red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]

set_property PACKAGE_PIN W15 [get_ports {green[0]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]

set_property PACKAGE_PIN V15 [get_ports {green[1]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]

set_property PACKAGE_PIN W14 [get_ports {green[2]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]

set_property PACKAGE_PIN W13 [get_ports {green[3]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]

set_property PACKAGE_PIN V2 [get_ports {blue[0]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]

set_property PACKAGE_PIN T3 [get_ports {blue[1]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]

set_property PACKAGE_PIN T2 [get_ports {blue[2]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]

set_property PACKAGE_PIN R3 [get_ports {blue[3]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]

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