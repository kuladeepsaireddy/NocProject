// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_data_fifo_v1_1_8_axis_data_fifo,Vivado 2015.4" *)
module myFifo(s_axis_aresetn, s_axis_aclk, s_axis_tvalid, s_axis_tready, s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tdata, axis_data_count, axis_wr_data_count, axis_rd_data_count);
  input s_axis_aresetn;
  input s_axis_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [271:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output [271:0]m_axis_tdata;
  output [31:0]axis_data_count;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;
endmodule
