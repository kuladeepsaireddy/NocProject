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
#10
@(posedge tb_clk);
tb_i_ready_pci=1'b1;
tb_i_valid_pci=1'b1;
tb_i_data_pci=256'hf11000001;

@(posedge tb_clk);
tb_i_data_pci=256'h12000111;
@(posedge tb_clk);
tb_i_data_pci=256'h13000221;
@(posedge tb_clk);
tb_i_data_pci=256'h14000431;
@(posedge tb_clk);
tb_i_data_pci=256'h15000431;
@(posedge tb_clk);
tb_i_data_pci=256'h16000431;
@(posedge tb_clk);
tb_i_data_pci=256'h17000431;
@(posedge tb_clk);
tb_i_data_pci=256'h18000431;
@(posedge tb_clk);
tb_i_data_pci=256'h19000431;
@(posedge tb_clk);
tb_i_data_pci=256'h1a000431;
@(posedge tb_clk);
tb_i_data_pci=256'h1b000431;
@(posedge tb_clk);
tb_i_data_pci=256'h1c000431;
@(posedge tb_clk);
tb_i_data_pci=256'h1d000431;
@(posedge tb_clk);
tb_i_data_pci=256'h1e4000431;
@(posedge tb_clk);
tb_i_data_pci=256'h1f000431;
@(posedge tb_clk);
tb_i_data_pci=256'h21000431;
@(posedge tb_clk);
tb_i_data_pci=256'h22000431;
@(posedge tb_clk);
tb_i_data_pci=256'h23000431;
@(posedge tb_clk);
tb_i_data_pci=256'h24000431;
@(posedge tb_clk);
tb_i_valid_pci=1'b0;

end


/*


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
);*/



endmodule