//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Fri Apr 28 14:48:29 2017
//Host        : LAPTOP-SOIKEGN2 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (heartbeat,
    pci_exp_rxn,
    pci_exp_rxp,
    pci_exp_txn,
    pci_exp_txp,
    pcie_link_status,
    sys_clk_n,
    sys_clk_p,
    sys_reset_n);
  output heartbeat;
  input [7:0]pci_exp_rxn;
  input [7:0]pci_exp_rxp;
  output [7:0]pci_exp_txn;
  output [7:0]pci_exp_txp;
  output pcie_link_status;
  input sys_clk_n;
  input sys_clk_p;
  input sys_reset_n;

  (* DEBUG_IN_BD = "true" *) (* MARK_DEBUG *) wire [255:0]dyract_0_Stream_Wr_TDATA;
  (* DEBUG_IN_BD = "true" *) (* MARK_DEBUG *) wire dyract_0_Stream_Wr_TREADY;
  (* DEBUG_IN_BD = "true" *) (* MARK_DEBUG *) wire dyract_0_Stream_Wr_TVALID;
  wire dyract_0_heartbeat;
  wire dyract_0_o_axi_strm_clk;
  wire [7:0]dyract_0_pci_exp_txn;
  wire [7:0]dyract_0_pci_exp_txp;
  wire dyract_0_pcie_link_status;
  (* DEBUG_IN_BD = "true" *) (* MARK_DEBUG *) wire [255:0]myNoc_0_nocMaster_TDATA;
  (* DEBUG_IN_BD = "true" *) (* MARK_DEBUG *) wire myNoc_0_nocMaster_TREADY;
  (* DEBUG_IN_BD = "true" *) (* MARK_DEBUG *) wire myNoc_0_nocMaster_TVALID;
  wire [7:0]pci_exp_rxn_1;
  wire [7:0]pci_exp_rxp_1;
  wire sys_clk_n_1;
  wire sys_clk_p_1;
  wire sys_reset_n_1;

  assign heartbeat = dyract_0_heartbeat;
  assign pci_exp_rxn_1 = pci_exp_rxn[7:0];
  assign pci_exp_rxp_1 = pci_exp_rxp[7:0];
  assign pci_exp_txn[7:0] = dyract_0_pci_exp_txn;
  assign pci_exp_txp[7:0] = dyract_0_pci_exp_txp;
  assign pcie_link_status = dyract_0_pcie_link_status;
  assign sys_clk_n_1 = sys_clk_n;
  assign sys_clk_p_1 = sys_clk_p;
  assign sys_reset_n_1 = sys_reset_n;
  design_1_dyract_0_0 dyract_0
       (.heartbeat(dyract_0_heartbeat),
        .i_rd_data(myNoc_0_nocMaster_TDATA),
        .i_rd_data_valid(myNoc_0_nocMaster_TVALID),
        .i_wr_data_ready(dyract_0_Stream_Wr_TREADY),
        .o_axi_strm_clk(dyract_0_o_axi_strm_clk),
        .o_rd_data_ready(myNoc_0_nocMaster_TREADY),
        .o_wr_data(dyract_0_Stream_Wr_TDATA),
        .o_wr_data_valid(dyract_0_Stream_Wr_TVALID),
        .pci_exp_rxn(pci_exp_rxn_1),
        .pci_exp_rxp(pci_exp_rxp_1),
        .pci_exp_txn(dyract_0_pci_exp_txn),
        .pci_exp_txp(dyract_0_pci_exp_txp),
        .pcie_link_status(dyract_0_pcie_link_status),
        .sys_clk_n(sys_clk_n_1),
        .sys_clk_p(sys_clk_p_1),
        .sys_reset_n(sys_reset_n_1));
  design_1_myNoc_0_0 myNoc_0
       (.clk(dyract_0_o_axi_strm_clk),
        .i_data_pci(dyract_0_Stream_Wr_TDATA),
        .i_ready_pci(myNoc_0_nocMaster_TREADY),
        .i_valid_pci(dyract_0_Stream_Wr_TVALID),
        .o_data_pci(myNoc_0_nocMaster_TDATA),
        .o_ready_pci(dyract_0_Stream_Wr_TREADY),
        .o_valid_pci(myNoc_0_nocMaster_TVALID));
endmodule
