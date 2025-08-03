//clock and reset
set_property PACKAGE_PIN W19 [get_ports clock]
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clock_IBUF]
set_property PACKAGE_PIN V17 [get_ports resetn]					
	set_property IOSTANDARD LVCMOS33 [get_ports resetn]


//----------inputs----------------
//one, two, three (floor selection inputs)
set_property PACKAGE_PIN V16 [get_ports one]					
	set_property IOSTANDARD LVCMOS33 [get_ports one]
set_property PACKAGE_PIN W16 [get_ports two]					
	set_property IOSTANDARD LVCMOS33 [get_ports two]
set_property PACKAGE_PIN W17 [get_ports three]					
	set_property IOSTANDARD LVCMOS33 [get_ports three]

//hold_open(door hold open input)
set_property PACKAGE_PIN V15 [get_ports hold_open]					
	set_property IOSTANDARD LVCMOS33 [get_ports hold_open]
//---------------------------------



//----------outputs----------------
//door indicator
set_property PACKAGE_PIN U3 [get_ports door]					
	set_property IOSTANDARD LVCMOS33 [get_ports door]
	
//7-seg display
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
	
set_property PACKAGE_PIN U2 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN U4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN V4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
set_property PACKAGE_PIN W4 [get_ports {an[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]
//----------------------------------
