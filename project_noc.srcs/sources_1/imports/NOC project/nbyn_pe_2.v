module nbyn_pe(
input wire clk,
input wire [264:0] i_data,
input wire i_valid,
output  reg [264:0] o_data,
output reg o_valid,
input wire i_ready

);

always @(posedge clk)
begin 
if(i_valid)
 begin
   if(i_ready)
    begin
	 o_data[264:9] <= 'd255 - i_data[264:9];
	 o_data[3:0] <= 'h00;
	 o_data[8:4]<=i_data[8:4];
	 o_valid <= 1'b1;
	 end
   else
     o_valid <=1'b0;
	end
else
 o_valid<=1'b0;
 end



endmodule