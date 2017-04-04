module scheduler_noc(
input clk,
// PCI - Scheduler interface 
input i_valid,
input [255:0] i_data,
output reg o_ready,
// From scheduler to PCI
output reg [255:0] o_data_pci,
output reg o_valid_pci,
input i_ready_pci,
//Scheduler-NOC interfaces
input i_ready,
output reg o_valid,
output reg [264:0] o_data,
//from NOC to Schedler
input wea,
input [264:0] i_data_pe

);
reg [1:0] x_coord = 'd0;
reg [1:0] y_coord = 'd1;
reg [4:0] pck_no = 'd0;
reg [4:0] counter = 'd0;
reg [4:0] addr_counter = 'd0;
reg counter_valid;
reg [4 : 0] addra;
reg [4 : 0] addrb;
reg [255 : 0] dina;
wire  [255 : 0] doutb;









always @(posedge clk)
begin
 if(i_valid & o_ready )
   begin
      o_data[264:9]<=i_data;
	  o_data[8:4]<=pck_no;
	  o_data[3:2]<=y_coord;
	  o_data[1:0]<=x_coord;
	  o_valid<=1'b1;
	  
	  if(y_coord < 3)
	   begin
	     y_coord<=y_coord+1;
		if(pck_no < 'd31)
		 begin
		   pck_no<=pck_no+1;
	     end
	    else
		 begin
		   pck_no<= 'd0;
		 end
       end

	  else
	   begin
	    if(x_coord < 3)
		  begin
      	    x_coord <= x_coord+1;
			y_coord<='b0;
			pck_no<=pck_no+1;
		  end
		else
		  begin
			x_coord <= 'd0;
			y_coord <= 'd1;
            pck_no <= pck_no+1;
		  end
	  end	  
	 /* if(x_coord !>3)
	   begin
	    x_coord<=x_coord+1;
		pck_no<=pck+1;
           if(y_coord !>3 )
             begin	   
              y_coord<=y_coord+1;
             end
	      else
	        begin 
		      y_coord<='d1;
		    end
	  end
	  
	  else
	    begin
         x_coord <='d1;
         pck_no<=pck+1;
           if(y_coord !>3 )
             begin	   
              y_coord<=y_coord+1;
             end
	       else
	        begin 
		      y_coord<='d1;
		    end
	    end		 
    end
*/
	  
   end
   
   
 else
  begin
   o_valid<=1'b0;
  end
end

always@(posedge clk)
begin
 if(i_ready)
  begin
    o_ready<=1'b1;
  end
 else
  o_ready<=1'b0;

end

always@(posedge clk)
begin
 if(wea)
  begin
  addra<= i_data_pe[8:4];
  dina<= i_data_pe[264:9];
  counter<= counter +1;
  if(counter == 'd15)
    counter_valid<=1'b1;
  end
end

always@(posedge clk)
begin
 if(counter_valid & i_ready_pci)
  begin
    o_data_pci<=doutb;
	o_valid_pci<=1'b1;
	addrb<= addr_counter;
	counter<=counter-1;
	if(addr_counter<31)
	addr_counter<=addr_counter+1;
	else
	addr_counter<='d0;
  end
  
 else
   o_valid_pci<=1'b0;
end


blk_mem_gen_0 sch_ram(
  .clka(clk),    // input wire clka
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [4 : 0] addra
  .dina(dina),    // input wire [255 : 0] dina
  .clkb(clk),    // input wire clkb
  .addrb(addrb),  // input wire [4 : 0] addrb
  .doutb(doutb)  // output wire [255 : 0] doutb
);

/*sch_ram sch_ram (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [4 : 0] addra
  .dina(dina), // input [255 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addrb), // input [4 : 0] addrb
  .doutb(doutb) // output [255 : 0] doutb
);*/

endmodule

