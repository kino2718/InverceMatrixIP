# Set the reference directory for source file relative paths (by default the value is script directory path)
#set origin_dir "."

# Create project
create_project PynqInverceMatrix3 ./PynqInverceMatrix3 -part xc7z020clg400-1

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [get_projects PynqInverceMatrix3]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/PynqInverceMatrix3.cache/ip" -objects $obj
set_property -name "part" -value "xc7z020clg400-1" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set ip_repo ../../ip_repo
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "[file normalize $ip_repo]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild

# Source the PynqInverceMatrix3.tcl file to create the bd
source "script/PynqInverceMatrix3.tcl"

# create the wrapper file for the top block design
make_wrapper -files [get_files PynqInverceMatrix3.bd] -top -import
#add_files -norecurse -fileset [get_filesets sources_1] "PynqInverceMatrix3/PynqInverceMatrix3.srcs/sources_1/bd/PynqInverceMatrix3/hdl/PynqInverceMatrix3_wrapper.vhd"

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
#set obj [get_filesets sources_1]
#set_property -name "top" -value "PynqInverceMatrix3" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "PynqInverceMatrix3_wrapper" -objects $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part xc7z020clg400-1 -flow {Vivado Synthesis 2017} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2017" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property -name "part" -value "xc7z020clg400-1" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part xc7z020clg400-1 -flow {Vivado Implementation 2017} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2017" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property -name "part" -value "xc7z020clg400-1" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:PynqInverceMatrix3"

update_compile_order -fileset sources_1

# call implement
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1

write_bd_tcl ./PynqInverceMatrix3/PynqInverceMatrix3.tcl

# move and rename bitstream to final location
file copy -force ./PynqInverceMatrix3/PynqInverceMatrix3.runs/impl_1/PynqInverceMatrix3_wrapper.bit ../../../../pynq/PynqInverceMatrix3.bit
file copy -force  ./PynqInverceMatrix3/PynqInverceMatrix3.tcl ../../../../pynq/PynqInverceMatrix3.tcl
