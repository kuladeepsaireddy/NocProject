vlib work
vlib msim

vlib msim/axis_infrastructure_v1_1_0
vlib msim/fifo_generator_v13_0_1
vlib msim/axis_data_fifo_v1_1_8
vlib msim/xil_defaultlib

vmap axis_infrastructure_v1_1_0 msim/axis_infrastructure_v1_1_0
vmap fifo_generator_v13_0_1 msim/fifo_generator_v13_0_1
vmap axis_data_fifo_v1_1_8 msim/axis_data_fifo_v1_1_8
vmap xil_defaultlib msim/xil_defaultlib

vlog -work axis_infrastructure_v1_1_0 -64 "+incdir+../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../project_noc.srcs/sources_1/ip/myFifo/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../project_noc.srcs/sources_1/ip/myFifo/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_mux_enc.v" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter.v" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter_wrapper.v" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_axis2vector.v" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_vector2axis.v" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_clock_synchronizer.v" \
"../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_cdc_handshake.v" \

vcom -work fifo_generator_v13_0_1 -64 \
"../../../ipstatic/fifo_generator_v13_0_1/simulation/fifo_generator_vhdl_beh.vhd" \
"../../../ipstatic/fifo_generator_v13_0_1/hdl/fifo_generator_v13_0_rfs.vhd" \

vlog -work axis_data_fifo_v1_1_8 -64 "+incdir+../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../project_noc.srcs/sources_1/ip/myFifo/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../project_noc.srcs/sources_1/ip/myFifo/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../ipstatic/axis_data_fifo_v1_1_8/hdl/verilog/axis_data_fifo_v1_1_axis_data_fifo.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../project_noc.srcs/sources_1/ip/myFifo/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../project_noc.srcs/sources_1/ip/myFifo/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../../project_noc.srcs/sources_1/ip/myFifo/sim/myFifo.v" \

vlog -work xil_defaultlib "glbl.v"

