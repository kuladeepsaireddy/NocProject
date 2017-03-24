module nbyn_pe_main(
input wire clk,
//from switch
input wire [264:0] i_data,
input wire i_valid,
//to switch
output  [264:0] o_data,
output  o_valid,
input wire i_ready,
//to from external world
input wire [264:0] main_input,
input wire main_valid_pe,
//output reg main_ready_pe,
output reg [264:0] main_output,

//////scheduler noc interface//////
output wire o_ready_scheduler,
output reg o_valid_scheduler
);




//reg l_valid;
//reg [15:0] l_data;

//wire [15:0] fifo_wr_data;
//wire fifo_wr_valid;

//assign fifo_wr_data = (l_valid == 1) ? l_data : main_input;
//assign fifo_wr_valid = l_valid | main_valid_pe;

/*reg [1:0] state;
localparam IDLE = 'd0,
           PROC = 'd1,
		   WAIT = 'd2;
		 
	*/	   

/*always@(posedge clk)
begin
 if(i_ready)
  begin
    o_ready_scheduler<=1'b1;
  end
 else
   o_ready_scheduler<=1'b0;
 
end*/

always @(posedge clk )//or posedge reset)
begin	
		if(i_valid)
		begin
		    //l_data[15:8] <= i_data[15:8]+1;
			 //l_data[7:0] <= 'h00;
			 main_output <=i_data;
			 o_valid_scheduler<=1'b1;
			 //l_valid <= 1'b1;
      end
	   
end

myFifo fifo (

  .s_axis_aresetn(1'b1),          // input wire s_axis_aresetn
  .s_axis_aclk(clk),                // input wire s_axis_aclk
  .s_axis_tvalid(main_valid_pe),            // input wire s_axis_tvalid
  .s_axis_tready(o_ready_scheduler),            // output wire s_axis_tready
  .s_axis_tdata(main_input),              // input wire [15 : 0] s_axis_tdata
  .m_axis_tvalid(o_valid),            // output wire m_axis_tvalid
  .m_axis_tready(i_ready),            // input wire m_axis_tready
  .m_axis_tdata(o_data),              // output wire [15 : 0] m_axis_tdata
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);


endmodule