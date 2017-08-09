@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim rd_image_behav -key {Behavioral:sim_1:Functional:rd_image} -tclbatch rd_image.tcl -view D:/mygit/NocProject/hw/Vivado/rd_image_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
