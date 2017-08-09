-makelib ies/axis_infrastructure_v1_1_0 \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_mux_enc.v" \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter.v" \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter_wrapper.v" \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_axis2vector.v" \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_vector2axis.v" \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_clock_synchronizer.v" \
  "../../../ipstatic/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_cdc_handshake.v" \
-endlib
-makelib ies/fifo_generator_v13_0_1 \
  "../../../ipstatic/fifo_generator_v13_0_1/simulation/fifo_generator_vhdl_beh.vhd" \
  "../../../ipstatic/fifo_generator_v13_0_1/hdl/fifo_generator_v13_0_rfs.vhd" \
-endlib
-makelib ies/axis_data_fifo_v1_1_8 \
  "../../../ipstatic/axis_data_fifo_v1_1_8/hdl/verilog/axis_data_fifo_v1_1_axis_data_fifo.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../project_noc.srcs/sources_1/ip/myFifo/sim/myFifo.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

