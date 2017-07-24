
################################################################
# This is a generated script based on design: InverceMatrix2
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source InverceMatrix2_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
}


# CHANGE DESIGN NAME HERE
set design_name InverceMatrix2

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set m_axis [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis ]
  set s_axis [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {0} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {2} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $s_axis

  # Create ports
  set aclk [ create_bd_port -dir I -type clk aclk ]
  set_property -dict [ list \
CONFIG.CLK_DOMAIN {InverceMatrix2_aclk} \
CONFIG.FREQ_HZ {100000000} \
 ] $aclk
  set aresetn [ create_bd_port -dir I -type rst aresetn ]

  # Create instance: BackSubtraction2_col1, and set properties
  set BackSubtraction2_col1 [ create_bd_cell -type ip -vlnv kino2718.net:user:BackSubtraction2:1.0 BackSubtraction2_col1 ]

  # Create instance: BackSubtraction2_col2, and set properties
  set BackSubtraction2_col2 [ create_bd_cell -type ip -vlnv kino2718.net:user:BackSubtraction2:1.0 BackSubtraction2_col2 ]

  # Create instance: QRDecomp2_0, and set properties
  set QRDecomp2_0 [ create_bd_cell -type ip -vlnv kino2718.net:user:QRDecomp2:1.0 QRDecomp2_0 ]

  # Create instance: Reorder2_0, and set properties
  set Reorder2_0 [ create_bd_cell -type ip -vlnv kino2718.net:user:Reorder2:1.0 Reorder2_0 ]

  # Create instance: axis_broadcaster_0, and set properties
  set axis_broadcaster_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_0 ]

  # Create instance: axis_broadcaster_1, and set properties
  set axis_broadcaster_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1 ]

  # Create instance: axis_broadcaster_2, and set properties
  set axis_broadcaster_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_2 ]

  # Create interface connections
  connect_bd_intf_net -intf_net BackSubtraction2_col1_m_axis_result [get_bd_intf_pins BackSubtraction2_col1/m_axis_result] [get_bd_intf_pins Reorder2_0/s_axis_col1]
  connect_bd_intf_net -intf_net BackSubtraction2_col2_m_axis_result [get_bd_intf_pins BackSubtraction2_col2/m_axis_result] [get_bd_intf_pins Reorder2_0/s_axis_col2]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_qt11 [get_bd_intf_pins BackSubtraction2_col1/s_axis_y1] [get_bd_intf_pins QRDecomp2_0/m_axis_qt11]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_qt12 [get_bd_intf_pins BackSubtraction2_col2/s_axis_y1] [get_bd_intf_pins QRDecomp2_0/m_axis_qt12]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_qt21 [get_bd_intf_pins BackSubtraction2_col1/s_axis_y2] [get_bd_intf_pins QRDecomp2_0/m_axis_qt21]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_qt22 [get_bd_intf_pins BackSubtraction2_col2/s_axis_y2] [get_bd_intf_pins QRDecomp2_0/m_axis_qt22]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_r11 [get_bd_intf_pins QRDecomp2_0/m_axis_r11] [get_bd_intf_pins axis_broadcaster_0/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_r12 [get_bd_intf_pins QRDecomp2_0/m_axis_r12] [get_bd_intf_pins axis_broadcaster_1/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp2_0_m_axis_r22 [get_bd_intf_pins QRDecomp2_0/m_axis_r22] [get_bd_intf_pins axis_broadcaster_2/S_AXIS]
  connect_bd_intf_net -intf_net Reorder2_0_m_axis [get_bd_intf_ports m_axis] [get_bd_intf_pins Reorder2_0/m_axis]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M00_AXIS [get_bd_intf_pins BackSubtraction2_col1/s_axis_r11] [get_bd_intf_pins axis_broadcaster_0/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M01_AXIS [get_bd_intf_pins BackSubtraction2_col2/s_axis_r11] [get_bd_intf_pins axis_broadcaster_0/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1_M00_AXIS [get_bd_intf_pins BackSubtraction2_col1/s_axis_r12] [get_bd_intf_pins axis_broadcaster_1/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1_M01_AXIS [get_bd_intf_pins BackSubtraction2_col2/s_axis_r12] [get_bd_intf_pins axis_broadcaster_1/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_2_M00_AXIS [get_bd_intf_pins BackSubtraction2_col1/s_axis_r22] [get_bd_intf_pins axis_broadcaster_2/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_2_M01_AXIS [get_bd_intf_pins BackSubtraction2_col2/s_axis_r22] [get_bd_intf_pins axis_broadcaster_2/M01_AXIS]
  connect_bd_intf_net -intf_net s_axis_1 [get_bd_intf_ports s_axis] [get_bd_intf_pins QRDecomp2_0/s_axis]

  # Create port connections
  connect_bd_net -net aclk_1 [get_bd_ports aclk] [get_bd_pins BackSubtraction2_col1/aclk] [get_bd_pins BackSubtraction2_col2/aclk] [get_bd_pins QRDecomp2_0/aclk] [get_bd_pins Reorder2_0/aclk] [get_bd_pins axis_broadcaster_0/aclk] [get_bd_pins axis_broadcaster_1/aclk] [get_bd_pins axis_broadcaster_2/aclk]
  connect_bd_net -net aresetn_1 [get_bd_ports aresetn] [get_bd_pins BackSubtraction2_col1/aresetn] [get_bd_pins BackSubtraction2_col2/aresetn] [get_bd_pins QRDecomp2_0/aresetn] [get_bd_pins Reorder2_0/aresetn] [get_bd_pins axis_broadcaster_0/aresetn] [get_bd_pins axis_broadcaster_1/aresetn] [get_bd_pins axis_broadcaster_2/aresetn]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


