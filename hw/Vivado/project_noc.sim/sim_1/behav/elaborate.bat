@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 6c07c30891e64cfabd8bfaf5d31acc7a -m64 --debug typical --relax --mt 2 -L axis_infrastructure_v1_1_0 -L fifo_generator_v13_0_1 -L axis_data_fifo_v1_1_8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot rd_image_behav xil_defaultlib.rd_image xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
