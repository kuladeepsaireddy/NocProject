create_clock -period 4.000 -name Clk -waveform {0.000 2.000} [get_ports -filter { NAME =~  "*clk*" && DIRECTION == "IN" }]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports -filter {NAME =~  "*clk*" && DIRECTION == "IN"}]
