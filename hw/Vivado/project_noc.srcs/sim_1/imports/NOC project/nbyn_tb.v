`define headerSize 1078
`define imageSize 262144
`timescale 1ns/1ps

module Test_tb();
reg  clk;
wire  [23:0] o_data_pe;
//reg  [7:0] o_data;
reg [23:0] i_data_pe;
wire o_ready_pe ;
reg i_valid_pe;
wire o_valid_pe;




initial
 begin
  clk = 1'b0;
  forever
  begin
      clk = ~clk;
		#1;
  end
end


initial
 begin
 #10
 @(posedge clk)
  i_data_pe<='habc6;
  i_valid_pe<=1'b1;
 
 
end



nbyn_full DUT(
.clk(clk),
// PCI - Scheduler interface ////
.i_valid_pe(i_valid_pe),
.o_ready_pe(o_ready_pe),
.o_valid_pe(o_valid_pe),
.i_data_pe(i_data_pe),
.o_data_pe(o_data_pe)

);

 
 
endmodule

