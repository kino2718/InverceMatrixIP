# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NBITS_FRAC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NBITS_M" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NBITS_S" -parent ${Page_0}


}

proc update_PARAM_VALUE.NBITS_FRAC { PARAM_VALUE.NBITS_FRAC } {
	# Procedure called to update NBITS_FRAC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NBITS_FRAC { PARAM_VALUE.NBITS_FRAC } {
	# Procedure called to validate NBITS_FRAC
	return true
}

proc update_PARAM_VALUE.NBITS_M { PARAM_VALUE.NBITS_M } {
	# Procedure called to update NBITS_M when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NBITS_M { PARAM_VALUE.NBITS_M } {
	# Procedure called to validate NBITS_M
	return true
}

proc update_PARAM_VALUE.NBITS_S { PARAM_VALUE.NBITS_S } {
	# Procedure called to update NBITS_S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NBITS_S { PARAM_VALUE.NBITS_S } {
	# Procedure called to validate NBITS_S
	return true
}


proc update_MODELPARAM_VALUE.NBITS_S { MODELPARAM_VALUE.NBITS_S PARAM_VALUE.NBITS_S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NBITS_S}] ${MODELPARAM_VALUE.NBITS_S}
}

proc update_MODELPARAM_VALUE.NBITS_M { MODELPARAM_VALUE.NBITS_M PARAM_VALUE.NBITS_M } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NBITS_M}] ${MODELPARAM_VALUE.NBITS_M}
}

proc update_MODELPARAM_VALUE.NBITS_FRAC { MODELPARAM_VALUE.NBITS_FRAC PARAM_VALUE.NBITS_FRAC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NBITS_FRAC}] ${MODELPARAM_VALUE.NBITS_FRAC}
}

