create_clock -period 4.000 -name Clk -waveform {0.000 2.000} [get_ports -filter { NAME =~  "*clk*" && DIRECTION == "IN" }]
