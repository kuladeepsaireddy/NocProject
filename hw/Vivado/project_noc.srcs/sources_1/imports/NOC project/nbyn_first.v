`define headerSize 1078
`define imageSize 8192
`timescale 1ns/1ps

module rd_image();
reg  clk;
reg  [255:0] o_data;



integer file;
integer file1;
integer j;
integer x;
integer i;

reg[7:0] header;
reg[7:0]image_data;
initial
begin
file=$fopen("lena512.bmp","rb");
file1=$fopen("final.bmp","wb");
if(file == 0)
begin
    $display("Cannot open the image file");
    $stop;
end
for(i=0;i<`headerSize;i=i+1)
 begin
   $fscanf(file,"%c",header);
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
  forever
  begin
      clk = ~clk;
		#1;
  end
end




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








endmodule

