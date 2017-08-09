onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L axis_infrastructure_v1_1_0 -L fifo_generator_v13_0_1 -L axis_data_fifo_v1_1_8 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.myFifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {myFifo.udo}

run -all

quit -force
