//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Fri Apr 28 14:48:29 2017
//Host        : LAPTOP-SOIKEGN2 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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

  wire heartbeat;
  wire [7:0]pci_exp_rxn;
  wire [7:0]pci_exp_rxp;
  wire [7:0]pci_exp_txn;
  wire [7:0]pci_exp_txp;
  wire pcie_link_status;
  wire sys_clk_n;
  wire sys_clk_p;
  wire sys_reset_n;

  design_1 design_1_i
       (.heartbeat(heartbeat),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pcie_link_status(pcie_link_status),
        .sys_clk_n(sys_clk_n),
        .sys_clk_p(sys_clk_p),
        .sys_reset_n(sys_reset_n));
endmodule
