proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7vx690tffg1761-2
  set_property board_part xilinx.com:vc709:part0:1.7 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir D:/mygit/NocProject/hw/Vivado/project_noc.cache/wt [current_project]
  set_property parent.project_path D:/mygit/NocProject/hw/Vivado/project_noc.xpr [current_project]
  set_property ip_repo_paths {
  d:/mygit/NocProject/hw/Vivado/project_noc.cache/ip
  D:/mygit/NocProject/hw/Vivado/project_noc.srcs/sources_1
} [current_project]
  set_property ip_output_repo d:/mygit/NocProject/hw/Vivado/project_noc.cache/ip [current_project]
  add_files -quiet D:/mygit/NocProject/hw/Vivado/project_noc.runs/synth_1/nbyn_full.dcp
  add_files -quiet D:/mygit/NocProject/hw/Vivado/project_noc.runs/myFifo_synth_1/myFifo.dcp
  set_property netlist_only true [get_files D:/mygit/NocProject/hw/Vivado/project_noc.runs/myFifo_synth_1/myFifo.dcp]
  read_xdc -mode out_of_context -ref myFifo -cells inst d:/mygit/NocProject/hw/Vivado/project_noc.srcs/sources_1/ip/myFifo/myFifo_ooc.xdc
  set_property processing_order EARLY [get_files d:/mygit/NocProject/hw/Vivado/project_noc.srcs/sources_1/ip/myFifo/myFifo_ooc.xdc]
  read_xdc -ref myFifo -cells inst d:/mygit/NocProject/hw/Vivado/project_noc.srcs/sources_1/ip/myFifo/myFifo/myFifo.xdc
  set_property processing_order EARLY [get_files d:/mygit/NocProject/hw/Vivado/project_noc.srcs/sources_1/ip/myFifo/myFifo/myFifo.xdc]
  read_xdc D:/mygit/NocProject/hw/Vivado/project_noc.srcs/constrs_1/new/noc.xdc
  link_design -top nbyn_full -part xc7vx690tffg1761-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force nbyn_full_opt.dcp
  report_drc -file nbyn_full_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file nbyn_full.hwdef}
  place_design 
  write_checkpoint -force nbyn_full_placed.dcp
  report_io -file nbyn_full_io_placed.rpt
  report_utilization -file nbyn_full_utilization_placed.rpt -pb nbyn_full_utilization_placed.pb
  report_control_sets -verbose -file nbyn_full_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force nbyn_full_routed.dcp
  report_drc -file nbyn_full_drc_routed.rpt -pb nbyn_full_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file nbyn_full_timing_summary_routed.rpt -rpx nbyn_full_timing_summary_routed.rpx
  report_power -file nbyn_full_power_routed.rpt -pb nbyn_full_power_summary_routed.pb
  report_route_status -file nbyn_full_route_status.rpt -pb nbyn_full_route_status.pb
  report_clock_utilization -file nbyn_full_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

