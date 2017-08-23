`define X 4
`define Y 4
`define data_width 8
`define total_width (`x_size+`y_size+`pck_num+`data_width)
`define sw_no `X*`Y  //number of swithces 
`define x_size 2
`define y_size 2
`define pck_num 4
`define iter `data_width/8