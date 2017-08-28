`define headerSize 1078
`define imageSize 262144
`timescale 1ns/1ps

module Test_tb();
reg  clk;
reg  [7:0] o_data;
//reg  [7:0] o_data;
wire [7:0] tb_o_data_pci;
wire tb_o_ready_pci ;
reg tb_i_ready_pci=1'b1;
reg tb_i_valid_pci;
wire tb_o_valid_pci;
integer file2;
reg sendDone=0;
integer file;
integer file1;
integer j;
integer x;
integer i;
integer counter;
reg[7:0] header;
reg[7:0]image_data;
integer rtn;
integer rtn1;
initial
begin
file=$fopen("../../../lena512.bmp","rb");
file1=$fopen("../../../final_main.bmp","wb");
file2=$fopen("../../../test.bmp","wb");
if(file == 0)
begin
    $display("Cannot open the image file");
    $stop;
end
for(i=0;i<`headerSize;i=i+1)
 begin
   rtn = $fscanf(file,"%c",header);
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
end


/*

always @(posedge clk)
 begin
   if(!$feof(file))
    begin
     for(x=0;x<32;x=x+1)
       begin
        $fscanf(file,"%c",image_data);
        o_data[x*8+:8]='d255-image_data;
        $fwrite(file1,"%c",o_data[x*8+:8]);
      end
    end
   else
     begin   
       $fclose(file);
       $fclose(file1);
		 $stop;
     end
  end





*/
always@(posedge clk)
 begin
  if(tb_o_ready_pci & !sendDone)
   begin
        rtn = $fscanf(file,"%c",image_data);
        o_data<=image_data;
		$fwrite(file2,"%c",image_data);
	  tb_i_valid_pci<=1'b1;
     if($feof(file))
       begin
          $fclose(file);
		  $fclose(file2);
		  sendDone = 1'b1;
       end
     else
       begin
         sendDone=1'b0;
       end	
    end
  else
    begin
      tb_i_valid_pci<=1'b0;
    end	
 end

 
 
 always @(posedge clk)
begin
    if(tb_o_valid_pci)
	 begin
	   if(counter < `imageSize)
	    begin
        	 
           $fwrite(file1,"%c",tb_o_data_pci);
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

