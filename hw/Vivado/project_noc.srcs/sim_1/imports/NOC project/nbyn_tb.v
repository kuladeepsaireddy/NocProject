`timescale 1ns/1ps
`define X 4
`define Y 4
module toptestbench();

reg tb_clk;
reg [255:0] tb_i_data_pci;
wire [255:0] tb_o_data_pci;
reg tb_i_valid_pci;
wire tb_o_ready_pci;
wire tb_o_valid_pci;
reg tb_i_ready_pci;


initial
begin
  tb_clk = 1'b0;
  forever
  begin
      tb_clk = ~tb_clk;
		#5;
  end
end

initial
begin
@(posedge tb_clk);
//mytb.ys[0].xs[0].instnce.nbyn_instance.tb_main_valid_pe=1'b0;
tb_i_valid_pci=1'b0;
tb_i_ready_pci=1'b0;
#100
@(posedge tb_clk);
tb_i_ready_pci=1'b1;
tb_i_valid_pci=1'b1;
tb_i_data_pci=256'h1;

@(posedge tb_clk);
tb_i_data_pci=256'h2;
@(posedge tb_clk);
tb_i_data_pci=256'h3;
@(posedge tb_clk);
tb_i_data_pci=256'h4;
@(posedge tb_clk);
tb_i_data_pci=256'h5;
@(posedge tb_clk);
tb_i_data_pci=256'h6;
@(posedge tb_clk);
tb_i_data_pci=256'h7;
@(posedge tb_clk);
tb_i_data_pci=256'h8;
@(posedge tb_clk);
tb_i_data_pci=256'h9;
@(posedge tb_clk);
tb_i_data_pci=256'ha;
@(posedge tb_clk);
tb_i_data_pci=256'hb;
@(posedge tb_clk);
tb_i_data_pci=256'hc;
@(posedge tb_clk);
tb_i_data_pci=256'hd;
@(posedge tb_clk);
tb_i_data_pci=256'he;
@(posedge tb_clk);
tb_i_data_pci=256'hf;
@(posedge tb_clk);
tb_i_data_pci=256'h21;
@(posedge tb_clk);
tb_i_data_pci=256'h22;
@(posedge tb_clk);
tb_i_data_pci=256'h23;
@(posedge tb_clk);
tb_i_data_pci=256'h24;
@(posedge tb_clk);
tb_i_valid_pci=1'b0;

end





nbyn_full DUT(
.clk(tb_clk),
// PCI - Scheduler interface ////
.i_valid_pci(tb_i_valid_pci),
.i_data_pci(tb_i_data_pci),
.o_ready_pci(tb_o_ready_pci),

///From scheduler to PCI///

.o_data_pci(tb_o_data_pci),
.o_valid_pci(tb_o_valid_pci),
.i_ready_pci(tb_i_ready_pci)
);



endmodule