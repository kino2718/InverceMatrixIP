# Set the reference directory for source file relative paths (by default the value is script directory path)
#set origin_dir "."

# Create project
create_project BoundaryCell ./BoundaryCell -part xc7z020clg400-1

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [get_projects BoundaryCell]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/BoundaryCell.cache/ip" -objects $obj
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

# Source the BoundaryCell.tcl file to create the bd
source "script/BoundaryCell.tcl"

# create the wrapper file for the top block design
make_wrapper -files [get_files BoundaryCell.bd] -top -import
#add_files -norecurse -fileset [get_filesets sources_1] "BoundaryCell/BoundaryCell.srcs/sources_1/bd/BoundaryCell/hdl/BoundaryCell_wrapper.vhd"

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
#set obj [get_filesets sources_1]
#set_property -name "top" -value "BoundaryCell" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "src/constrs/BoundaryCell_ooc.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "src/constrs/BoundaryCell_ooc.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj
set_property -name "used_in" -value "synthesis implementation out_of_context" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
set files [list \
 "[file normalize "../../common/sim/AXISSimMaster.vhd"]"\
 "[file normalize "../../common/sim/AXISSimSlave.vhd"]"\
 "[file normalize "sim/tb/tb_BoundaryCell.vhd"]"\
 "[file normalize "sim/test/input.txt"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sim_1' fileset file properties for remote files
set file "../../common/sim/AXISSimMaster.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "../../common/sim/AXISSimSlave.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "sim/tb/tb_BoundaryCell.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "tb_BoundaryCell" -objects $obj

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

puts "INFO: Project created:BoundaryCell"

# create IP
set ip_repo ../../ip_repo
set ip_dir $ip_repo/BoundaryCell
ipx::package_project -root_dir $ip_dir -vendor kino2718.net -library user -taxonomy /UserIP -module BoundaryCell -import_files
set_property vendor kino2718.net [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property library user [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property name BoundaryCell [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property version 1.0 [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property display_name "BoundaryCell for InverceMatrix" [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property description "BoundaryCell IP used in QRDecomp Cell" [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property vendor_display_name kino2718.net [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property company_url http://kino2718.net [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property supported_families {zynq Production kintex7 Production kintex7l Production artix7 Production artix7l Production aartix7 Production zynq Production azynq Production spartan7 Production kintexuplus Production zynquplus Production kintexu Production} [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
set_property core_revision 1 [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
ipx::create_xgui_files [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
ipx::update_checksums [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
ipx::save_core [ipx::find_open_core kino2718.net:user:BoundaryCell:1.0]
update_ip_catalog -rebuild -repo_path $ip_repo
