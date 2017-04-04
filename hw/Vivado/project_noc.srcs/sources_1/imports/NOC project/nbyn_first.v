`define headerSize 1078
`define imageSize 8192
`timescale 1ns/1ps

module rd_image();
reg  clk;
reg  [255:0] o_data;
wire [255:0] tb_o_data_pci;
wire tb_o_ready_pci = 1'b1;
reg tb_i_ready_pci=1'b1;
reg tb_i_valid_pci;
wire tb_o_valid_pci;

integer file;
integer file1;
integer j;
integer x;
integer i;
integer rtn;
integer counter;

reg [7:0]  header;
reg [7:0] image_data;
initial
begin
file=$fopen("../../../lena512.bmp","rb");
file1=$fopen("../../../final.bmp","wb");
if(file == 0)
begin
    $display("Cannot open the image file");
    $stop;
end
for(i=0;i<`headerSize;i=i+1)
begin
    rtn = $fscanf(file,"%c",header);
    if(rtn <= 0)
    begin
       $display("Cannot read from file");
	   $stop;
	end
    $fwrite(file1,"%c",header);  
end



//while(!$feof(file))
/*for(j=0;j<`imageSize;j=j+1)
begin
 for(x=0;x<32;x=x+1)
  begin
   $fscanf(file,"%c",image_data);
   o_data[x*8+:8]=image_data;
   $fwrite(file1,"%c",o_data[x*8+:8]);
  end
end  

$fclose(file);
$fclose(file1);
 
*/ clk = 1'b0;
 counter=0;
  forever
  begin
      clk = ~clk;
		#1;
  end

  //tb_o_ready_pci=1'b1;
  //tb_i_ready_pci=1'b1;
end




always @(posedge clk)
 begin
   if(!$feof(file))
    begin
     for(x=0;x<32;x=x+1)
       begin
        rtn = $fscanf(file,"%c",image_data);
        o_data[x*8+:8]=image_data;
	   end
   	 tb_i_valid_pci<=1'b1;	
    end
  else
    begin   
     $fclose(file);
    end
 end
 
 
always @(posedge clk)
begin
    if(tb_o_valid_pci)
	 begin
	   if(counter < `imageSize)
	    begin
         for (j=0;j<32;j=j+1)
          begin		 
           $fwrite(file1,"%c",tb_o_data_pci[j*8+:8]);
          end
		  counter<=counter +1;
	    end 
       else
	    begin
		  $fclose(file1);
		  $stop;
		end
     end
end

nbyn_full DUT(
.clk(clk),
// PCI - Scheduler interface ////
.i_valid_pci(tb_i_valid_pci),
.i_data_pci(o_data),
.o_ready_pci(tb_o_ready_pci),

///From scheduler to PCI///

.o_data_pci(tb_o_data_pci),
.o_valid_pci(tb_o_valid_pci),
.i_ready_pci(tb_i_ready_pci)
);






endmodule

