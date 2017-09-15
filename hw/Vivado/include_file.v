`define X 8
`define Y 8
`define data_width 256
`define total_width (`x_size+`y_size+`pck_num+`data_width)
`define sw_no `X*`Y  //number of swithces 
`define x_size 3
`define y_size 3
`define pck_num 6
`define iter `data_width/8