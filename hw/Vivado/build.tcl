open_project project_noc.xpr
synth_design -name synth_2 -part xc7vx690tffg1761-2 -mode out_of_context -constrset constrs_1 -top nbyn
opt_design
place_design
route_design
report_utilization
report_timing_summary