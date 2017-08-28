`define X 2
`define Y 2
`define data_width 8
`define total_width (`x_size+`y_size+`pck_num+`data_width)
`define sw_no `X*`Y  //number of swithces 
`define x_size 1
`define y_size 1
`define pck_num 2
`define iter `data_width/8