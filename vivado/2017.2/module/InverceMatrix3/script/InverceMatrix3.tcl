
################################################################
# This is a generated script based on design: InverceMatrix3
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
# source InverceMatrix3_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
}


# CHANGE DESIGN NAME HERE
set design_name InverceMatrix3

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
CONFIG.FREQ_HZ {100000000} \
 ] $aclk
  set aresetn [ create_bd_port -dir I -type rst aresetn ]

  # Create instance: BackSubtraction3_col1, and set properties
  set BackSubtraction3_col1 [ create_bd_cell -type ip -vlnv kino2718.net:user:BackSubtraction3:1.0 BackSubtraction3_col1 ]

  # Create instance: BackSubtraction3_col2, and set properties
  set BackSubtraction3_col2 [ create_bd_cell -type ip -vlnv kino2718.net:user:BackSubtraction3:1.0 BackSubtraction3_col2 ]

  # Create instance: BackSubtraction3_col3, and set properties
  set BackSubtraction3_col3 [ create_bd_cell -type ip -vlnv kino2718.net:user:BackSubtraction3:1.0 BackSubtraction3_col3 ]

  # Create instance: QRDecomp3_0, and set properties
  set QRDecomp3_0 [ create_bd_cell -type ip -vlnv kino2718.net:user:QRDecomp3:1.0 QRDecomp3_0 ]

  # Create instance: Reorder3_0, and set properties
  set Reorder3_0 [ create_bd_cell -type ip -vlnv kino2718.net:user:Reorder3:1.0 Reorder3_0 ]

  # Create instance: axis_broadcaster_r11, and set properties
  set axis_broadcaster_r11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_r11 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axis_broadcaster_r11

  # Create instance: axis_broadcaster_r12, and set properties
  set axis_broadcaster_r12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_r12 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axis_broadcaster_r12

  # Create instance: axis_broadcaster_r13, and set properties
  set axis_broadcaster_r13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_r13 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axis_broadcaster_r13

  # Create instance: axis_broadcaster_r22, and set properties
  set axis_broadcaster_r22 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_r22 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axis_broadcaster_r22

  # Create instance: axis_broadcaster_r23, and set properties
  set axis_broadcaster_r23 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_r23 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axis_broadcaster_r23

  # Create instance: axis_broadcaster_r33, and set properties
  set axis_broadcaster_r33 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_r33 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axis_broadcaster_r33

  # Create interface connections
  connect_bd_intf_net -intf_net BackSubtraction3_col1_m_axis_result [get_bd_intf_pins BackSubtraction3_col1/m_axis_result] [get_bd_intf_pins Reorder3_0/s_axis_col1]
  connect_bd_intf_net -intf_net BackSubtraction3_col2_m_axis_result [get_bd_intf_pins BackSubtraction3_col2/m_axis_result] [get_bd_intf_pins Reorder3_0/s_axis_col2]
  connect_bd_intf_net -intf_net BackSubtraction3_col3_m_axis_result [get_bd_intf_pins BackSubtraction3_col3/m_axis_result] [get_bd_intf_pins Reorder3_0/s_axis_col3]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt11 [get_bd_intf_pins BackSubtraction3_col1/s_axis_y1] [get_bd_intf_pins QRDecomp3_0/m_axis_qt11]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt12 [get_bd_intf_pins BackSubtraction3_col2/s_axis_y1] [get_bd_intf_pins QRDecomp3_0/m_axis_qt12]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt13 [get_bd_intf_pins BackSubtraction3_col3/s_axis_y1] [get_bd_intf_pins QRDecomp3_0/m_axis_qt13]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt21 [get_bd_intf_pins BackSubtraction3_col1/s_axis_y2] [get_bd_intf_pins QRDecomp3_0/m_axis_qt21]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt22 [get_bd_intf_pins BackSubtraction3_col2/s_axis_y2] [get_bd_intf_pins QRDecomp3_0/m_axis_qt22]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt23 [get_bd_intf_pins BackSubtraction3_col3/s_axis_y2] [get_bd_intf_pins QRDecomp3_0/m_axis_qt23]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt31 [get_bd_intf_pins BackSubtraction3_col1/s_axis_y3] [get_bd_intf_pins QRDecomp3_0/m_axis_qt31]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt32 [get_bd_intf_pins BackSubtraction3_col2/s_axis_y3] [get_bd_intf_pins QRDecomp3_0/m_axis_qt32]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_qt33 [get_bd_intf_pins BackSubtraction3_col3/s_axis_y3] [get_bd_intf_pins QRDecomp3_0/m_axis_qt33]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_r11 [get_bd_intf_pins QRDecomp3_0/m_axis_r11] [get_bd_intf_pins axis_broadcaster_r11/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_r12 [get_bd_intf_pins QRDecomp3_0/m_axis_r12] [get_bd_intf_pins axis_broadcaster_r12/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_r13 [get_bd_intf_pins QRDecomp3_0/m_axis_r13] [get_bd_intf_pins axis_broadcaster_r13/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_r22 [get_bd_intf_pins QRDecomp3_0/m_axis_r22] [get_bd_intf_pins axis_broadcaster_r22/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_r23 [get_bd_intf_pins QRDecomp3_0/m_axis_r23] [get_bd_intf_pins axis_broadcaster_r23/S_AXIS]
  connect_bd_intf_net -intf_net QRDecomp3_0_m_axis_r33 [get_bd_intf_pins QRDecomp3_0/m_axis_r33] [get_bd_intf_pins axis_broadcaster_r33/S_AXIS]
  connect_bd_intf_net -intf_net Reorder3_0_m_axis [get_bd_intf_ports m_axis] [get_bd_intf_pins Reorder3_0/m_axis]
  connect_bd_intf_net -intf_net axis_broadcaster_r11_M00_AXIS [get_bd_intf_pins BackSubtraction3_col1/s_axis_r11] [get_bd_intf_pins axis_broadcaster_r11/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r11_M01_AXIS [get_bd_intf_pins BackSubtraction3_col2/s_axis_r11] [get_bd_intf_pins axis_broadcaster_r11/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r11_M02_AXIS [get_bd_intf_pins BackSubtraction3_col3/s_axis_r11] [get_bd_intf_pins axis_broadcaster_r11/M02_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r12_M00_AXIS [get_bd_intf_pins BackSubtraction3_col1/s_axis_r12] [get_bd_intf_pins axis_broadcaster_r12/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r12_M01_AXIS [get_bd_intf_pins BackSubtraction3_col2/s_axis_r12] [get_bd_intf_pins axis_broadcaster_r12/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r12_M02_AXIS [get_bd_intf_pins BackSubtraction3_col3/s_axis_r12] [get_bd_intf_pins axis_broadcaster_r12/M02_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r13_M00_AXIS [get_bd_intf_pins BackSubtraction3_col1/s_axis_r13] [get_bd_intf_pins axis_broadcaster_r13/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r13_M01_AXIS [get_bd_intf_pins BackSubtraction3_col2/s_axis_r13] [get_bd_intf_pins axis_broadcaster_r13/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r13_M02_AXIS [get_bd_intf_pins BackSubtraction3_col3/s_axis_r13] [get_bd_intf_pins axis_broadcaster_r13/M02_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r22_M00_AXIS [get_bd_intf_pins BackSubtraction3_col1/s_axis_r22] [get_bd_intf_pins axis_broadcaster_r22/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r22_M01_AXIS [get_bd_intf_pins BackSubtraction3_col2/s_axis_r22] [get_bd_intf_pins axis_broadcaster_r22/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r22_M02_AXIS [get_bd_intf_pins BackSubtraction3_col3/s_axis_r22] [get_bd_intf_pins axis_broadcaster_r22/M02_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r23_M00_AXIS [get_bd_intf_pins BackSubtraction3_col1/s_axis_r23] [get_bd_intf_pins axis_broadcaster_r23/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r23_M01_AXIS [get_bd_intf_pins BackSubtraction3_col2/s_axis_r23] [get_bd_intf_pins axis_broadcaster_r23/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r23_M02_AXIS [get_bd_intf_pins BackSubtraction3_col3/s_axis_r23] [get_bd_intf_pins axis_broadcaster_r23/M02_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r33_M00_AXIS [get_bd_intf_pins BackSubtraction3_col1/s_axis_r33] [get_bd_intf_pins axis_broadcaster_r33/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r33_M01_AXIS [get_bd_intf_pins BackSubtraction3_col2/s_axis_r33] [get_bd_intf_pins axis_broadcaster_r33/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_r33_M02_AXIS [get_bd_intf_pins BackSubtraction3_col3/s_axis_r33] [get_bd_intf_pins axis_broadcaster_r33/M02_AXIS]
  connect_bd_intf_net -intf_net s_axis_1 [get_bd_intf_ports s_axis] [get_bd_intf_pins QRDecomp3_0/s_axis]

  # Create port connections
  connect_bd_net -net aclk_1 [get_bd_ports aclk] [get_bd_pins BackSubtraction3_col1/aclk] [get_bd_pins BackSubtraction3_col2/aclk] [get_bd_pins BackSubtraction3_col3/aclk] [get_bd_pins QRDecomp3_0/aclk] [get_bd_pins Reorder3_0/aclk] [get_bd_pins axis_broadcaster_r11/aclk] [get_bd_pins axis_broadcaster_r12/aclk] [get_bd_pins axis_broadcaster_r13/aclk] [get_bd_pins axis_broadcaster_r22/aclk] [get_bd_pins axis_broadcaster_r23/aclk] [get_bd_pins axis_broadcaster_r33/aclk]
  connect_bd_net -net aresetn_1 [get_bd_ports aresetn] [get_bd_pins BackSubtraction3_col1/aresetn] [get_bd_pins BackSubtraction3_col2/aresetn] [get_bd_pins BackSubtraction3_col3/aresetn] [get_bd_pins QRDecomp3_0/aresetn] [get_bd_pins Reorder3_0/aresetn] [get_bd_pins axis_broadcaster_r11/aresetn] [get_bd_pins axis_broadcaster_r12/aresetn] [get_bd_pins axis_broadcaster_r13/aresetn] [get_bd_pins axis_broadcaster_r22/aresetn] [get_bd_pins axis_broadcaster_r23/aresetn] [get_bd_pins axis_broadcaster_r33/aresetn]

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


