--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:03:41 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target QRDecomp3.bd
--Design      : QRDecomp3
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity QRDecomp3 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_qt11_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt11_tready : in STD_LOGIC;
    m_axis_qt11_tvalid : out STD_LOGIC;
    m_axis_qt12_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt12_tready : in STD_LOGIC;
    m_axis_qt12_tvalid : out STD_LOGIC;
    m_axis_qt13_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt13_tready : in STD_LOGIC;
    m_axis_qt13_tvalid : out STD_LOGIC;
    m_axis_qt21_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt21_tready : in STD_LOGIC;
    m_axis_qt21_tvalid : out STD_LOGIC;
    m_axis_qt22_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt22_tready : in STD_LOGIC;
    m_axis_qt22_tvalid : out STD_LOGIC;
    m_axis_qt23_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt23_tready : in STD_LOGIC;
    m_axis_qt23_tvalid : out STD_LOGIC;
    m_axis_qt31_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt31_tready : in STD_LOGIC;
    m_axis_qt31_tvalid : out STD_LOGIC;
    m_axis_qt32_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt32_tready : in STD_LOGIC;
    m_axis_qt32_tvalid : out STD_LOGIC;
    m_axis_qt33_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt33_tready : in STD_LOGIC;
    m_axis_qt33_tvalid : out STD_LOGIC;
    m_axis_r11_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r11_tready : in STD_LOGIC;
    m_axis_r11_tvalid : out STD_LOGIC;
    m_axis_r12_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r12_tready : in STD_LOGIC;
    m_axis_r12_tvalid : out STD_LOGIC;
    m_axis_r13_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r13_tready : in STD_LOGIC;
    m_axis_r13_tvalid : out STD_LOGIC;
    m_axis_r22_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r22_tready : in STD_LOGIC;
    m_axis_r22_tvalid : out STD_LOGIC;
    m_axis_r23_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r23_tready : in STD_LOGIC;
    m_axis_r23_tvalid : out STD_LOGIC;
    m_axis_r33_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r33_tready : in STD_LOGIC;
    m_axis_r33_tvalid : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of QRDecomp3 : entity is "QRDecomp3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=QRDecomp3,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=20,numReposBlks=20,numNonXlnxBlks=16,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=15,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of QRDecomp3 : entity is "QRDecomp3.hwdef";
end QRDecomp3;

architecture STRUCTURE of QRDecomp3 is
  component QRDecomp3_BoundaryCell_r11_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_phase_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_phase_tlast : out STD_LOGIC;
    m_axis_phase_tready : in STD_LOGIC;
    m_axis_phase_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_BoundaryCell_r11_0;
  component QRDecomp3_BoundaryCell_r22_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_phase_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_phase_tlast : out STD_LOGIC;
    m_axis_phase_tready : in STD_LOGIC;
    m_axis_phase_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_BoundaryCell_r22_0;
  component QRDecomp3_BoundaryCell_r33_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_phase_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_phase_tlast : out STD_LOGIC;
    m_axis_phase_tready : in STD_LOGIC;
    m_axis_phase_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_BoundaryCell_r33_0;
  component QRDecomp3_InternalCell_qt11_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt11_0;
  component QRDecomp3_InternalCell_qt12_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt12_0;
  component QRDecomp3_InternalCell_qt13_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt13_0;
  component QRDecomp3_InternalCell_qt21_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt21_0;
  component QRDecomp3_InternalCell_qt22_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt22_0;
  component QRDecomp3_InternalCell_qt23_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt23_0;
  component QRDecomp3_InternalCell_qt31_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt31_0;
  component QRDecomp3_InternalCell_qt32_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt32_0;
  component QRDecomp3_InternalCell_qt33_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_qt33_0;
  component QRDecomp3_InternalCell_r12_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_r12_0;
  component QRDecomp3_InternalCell_r13_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_r13_0;
  component QRDecomp3_InternalCell_r23_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tready : in STD_LOGIC;
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_InternalCell_r23_0;
  component QRDecomp3_StreamToColumns3_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_c1_tvalid : out STD_LOGIC;
    m_axis_c1_tready : in STD_LOGIC;
    m_axis_c1_tlast : out STD_LOGIC;
    m_axis_c1_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_c2_tvalid : out STD_LOGIC;
    m_axis_c2_tready : in STD_LOGIC;
    m_axis_c2_tlast : out STD_LOGIC;
    m_axis_c2_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_c3_tvalid : out STD_LOGIC;
    m_axis_c3_tready : in STD_LOGIC;
    m_axis_c3_tlast : out STD_LOGIC;
    m_axis_c3_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_c4_tvalid : out STD_LOGIC;
    m_axis_c4_tready : in STD_LOGIC;
    m_axis_c4_tlast : out STD_LOGIC;
    m_axis_c4_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_c5_tvalid : out STD_LOGIC;
    m_axis_c5_tready : in STD_LOGIC;
    m_axis_c5_tlast : out STD_LOGIC;
    m_axis_c5_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_c6_tvalid : out STD_LOGIC;
    m_axis_c6_tready : in STD_LOGIC;
    m_axis_c6_tlast : out STD_LOGIC;
    m_axis_c6_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component QRDecomp3_StreamToColumns3_0_0;
  component QRDecomp3_axis_broadcaster_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 79 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component QRDecomp3_axis_broadcaster_0_0;
  component QRDecomp3_axis_broadcaster_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component QRDecomp3_axis_broadcaster_1_0;
  component QRDecomp3_axis_broadcaster_2_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component QRDecomp3_axis_broadcaster_2_0;
  component QRDecomp3_xlconstant_val1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp3_xlconstant_val1_0;
  signal BoundaryCell_r11_m_axis_phase_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r11_m_axis_phase_TLAST : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_phase_TREADY : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_phase_TVALID : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r11_m_axis_result_TREADY : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_result_TVALID : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_phase_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r22_m_axis_phase_TLAST : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_phase_TREADY : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_phase_TVALID : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r22_m_axis_result_TREADY : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_result_TVALID : STD_LOGIC;
  signal BoundaryCell_r33_m_axis_phase_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r33_m_axis_phase_TLAST : STD_LOGIC;
  signal BoundaryCell_r33_m_axis_phase_TREADY : STD_LOGIC;
  signal BoundaryCell_r33_m_axis_phase_TVALID : STD_LOGIC;
  signal BoundaryCell_r33_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r33_m_axis_result_TREADY : STD_LOGIC;
  signal BoundaryCell_r33_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt11_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt11_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt11_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt11_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt11_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt11_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt11_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt12_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt12_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt12_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt12_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt12_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt12_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt12_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt13_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt13_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt13_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt13_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt13_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt13_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt13_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt21_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt21_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt21_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt21_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt21_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt21_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt21_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt22_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt22_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt22_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt22_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt22_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt22_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt22_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt23_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt23_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt23_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt23_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_qt23_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt23_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt23_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt31_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt31_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt31_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt32_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt32_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt32_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt33_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt33_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt33_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_r12_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r12_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r12_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r12_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r12_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r12_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_r12_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_r13_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r13_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r13_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r13_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r13_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r13_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_r13_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_r23_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r23_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r23_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r23_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r23_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r23_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_r23_m_axis_result_TVALID : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns3_0_m_axis_c1_TLAST : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c1_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns3_0_m_axis_c1_TVALID : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c2_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns3_0_m_axis_c2_TLAST : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c2_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns3_0_m_axis_c2_TVALID : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c3_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns3_0_m_axis_c3_TLAST : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c3_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns3_0_m_axis_c3_TVALID : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c4_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns3_0_m_axis_c4_TLAST : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c4_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns3_0_m_axis_c4_TVALID : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c5_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns3_0_m_axis_c5_TLAST : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c5_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns3_0_m_axis_c5_TVALID : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c6_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns3_0_m_axis_c6_TLAST : STD_LOGIC;
  signal StreamToColumns3_0_m_axis_c6_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns3_0_m_axis_c6_TVALID : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal axis_broadcaster_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_0_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_0_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_0_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_0_M02_AXIS_TDATA : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal axis_broadcaster_0_M02_AXIS_TLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_broadcaster_0_M02_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M02_AXIS_TVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_broadcaster_0_M03_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 48 );
  signal axis_broadcaster_0_M03_AXIS_TLAST : STD_LOGIC_VECTOR ( 3 to 3 );
  signal axis_broadcaster_0_M03_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M03_AXIS_TVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal axis_broadcaster_0_M04_AXIS_TDATA : STD_LOGIC_VECTOR ( 79 downto 64 );
  signal axis_broadcaster_0_M04_AXIS_TLAST : STD_LOGIC_VECTOR ( 4 to 4 );
  signal axis_broadcaster_0_M04_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M04_AXIS_TVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal axis_broadcaster_1_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_1_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1_M02_AXIS_TDATA : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal axis_broadcaster_1_M02_AXIS_TLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_broadcaster_1_M02_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M02_AXIS_TVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_broadcaster_1_M03_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 48 );
  signal axis_broadcaster_1_M03_AXIS_TLAST : STD_LOGIC_VECTOR ( 3 to 3 );
  signal axis_broadcaster_1_M03_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M03_AXIS_TVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal axis_broadcaster_2_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_2_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_2_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_2_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_2_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_2_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_2_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_2_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_2_M02_AXIS_TDATA : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal axis_broadcaster_2_M02_AXIS_TLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_broadcaster_2_M02_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_2_M02_AXIS_TVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s_axis_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_1_TREADY : STD_LOGIC;
  signal s_axis_1_TVALID : STD_LOGIC;
  signal xlconstant_val1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt31_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InternalCell_qt31_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt31_m_axis_tvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt32_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InternalCell_qt32_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt32_m_axis_tvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt33_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InternalCell_qt33_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt33_m_axis_tvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  BoundaryCell_r11_m_axis_result_TREADY <= m_axis_r11_tready;
  BoundaryCell_r22_m_axis_result_TREADY <= m_axis_r22_tready;
  BoundaryCell_r33_m_axis_result_TREADY <= m_axis_r33_tready;
  InternalCell_qt11_m_axis_result_TREADY <= m_axis_qt11_tready;
  InternalCell_qt12_m_axis_result_TREADY <= m_axis_qt12_tready;
  InternalCell_qt13_m_axis_result_TREADY <= m_axis_qt13_tready;
  InternalCell_qt21_m_axis_result_TREADY <= m_axis_qt21_tready;
  InternalCell_qt22_m_axis_result_TREADY <= m_axis_qt22_tready;
  InternalCell_qt23_m_axis_result_TREADY <= m_axis_qt23_tready;
  InternalCell_qt31_m_axis_result_TREADY <= m_axis_qt31_tready;
  InternalCell_qt32_m_axis_result_TREADY <= m_axis_qt32_tready;
  InternalCell_qt33_m_axis_result_TREADY <= m_axis_qt33_tready;
  InternalCell_r12_m_axis_result_TREADY <= m_axis_r12_tready;
  InternalCell_r13_m_axis_result_TREADY <= m_axis_r13_tready;
  InternalCell_r23_m_axis_result_TREADY <= m_axis_r23_tready;
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_qt11_tdata(15 downto 0) <= InternalCell_qt11_m_axis_result_TDATA(15 downto 0);
  m_axis_qt11_tvalid <= InternalCell_qt11_m_axis_result_TVALID;
  m_axis_qt12_tdata(15 downto 0) <= InternalCell_qt12_m_axis_result_TDATA(15 downto 0);
  m_axis_qt12_tvalid <= InternalCell_qt12_m_axis_result_TVALID;
  m_axis_qt13_tdata(15 downto 0) <= InternalCell_qt13_m_axis_result_TDATA(15 downto 0);
  m_axis_qt13_tvalid <= InternalCell_qt13_m_axis_result_TVALID;
  m_axis_qt21_tdata(15 downto 0) <= InternalCell_qt21_m_axis_result_TDATA(15 downto 0);
  m_axis_qt21_tvalid <= InternalCell_qt21_m_axis_result_TVALID;
  m_axis_qt22_tdata(15 downto 0) <= InternalCell_qt22_m_axis_result_TDATA(15 downto 0);
  m_axis_qt22_tvalid <= InternalCell_qt22_m_axis_result_TVALID;
  m_axis_qt23_tdata(15 downto 0) <= InternalCell_qt23_m_axis_result_TDATA(15 downto 0);
  m_axis_qt23_tvalid <= InternalCell_qt23_m_axis_result_TVALID;
  m_axis_qt31_tdata(15 downto 0) <= InternalCell_qt31_m_axis_result_TDATA(15 downto 0);
  m_axis_qt31_tvalid <= InternalCell_qt31_m_axis_result_TVALID;
  m_axis_qt32_tdata(15 downto 0) <= InternalCell_qt32_m_axis_result_TDATA(15 downto 0);
  m_axis_qt32_tvalid <= InternalCell_qt32_m_axis_result_TVALID;
  m_axis_qt33_tdata(15 downto 0) <= InternalCell_qt33_m_axis_result_TDATA(15 downto 0);
  m_axis_qt33_tvalid <= InternalCell_qt33_m_axis_result_TVALID;
  m_axis_r11_tdata(15 downto 0) <= BoundaryCell_r11_m_axis_result_TDATA(15 downto 0);
  m_axis_r11_tvalid <= BoundaryCell_r11_m_axis_result_TVALID;
  m_axis_r12_tdata(15 downto 0) <= InternalCell_r12_m_axis_result_TDATA(15 downto 0);
  m_axis_r12_tvalid <= InternalCell_r12_m_axis_result_TVALID;
  m_axis_r13_tdata(15 downto 0) <= InternalCell_r13_m_axis_result_TDATA(15 downto 0);
  m_axis_r13_tvalid <= InternalCell_r13_m_axis_result_TVALID;
  m_axis_r22_tdata(15 downto 0) <= BoundaryCell_r22_m_axis_result_TDATA(15 downto 0);
  m_axis_r22_tvalid <= BoundaryCell_r22_m_axis_result_TVALID;
  m_axis_r23_tdata(15 downto 0) <= InternalCell_r23_m_axis_result_TDATA(15 downto 0);
  m_axis_r23_tvalid <= InternalCell_r23_m_axis_result_TVALID;
  m_axis_r33_tdata(15 downto 0) <= BoundaryCell_r33_m_axis_result_TDATA(15 downto 0);
  m_axis_r33_tvalid <= BoundaryCell_r33_m_axis_result_TVALID;
  s_axis_1_TDATA(15 downto 0) <= s_axis_tdata(15 downto 0);
  s_axis_1_TVALID <= s_axis_tvalid;
  s_axis_tready <= s_axis_1_TREADY;
BoundaryCell_r11: component QRDecomp3_BoundaryCell_r11_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_phase_tdata(15 downto 0) => BoundaryCell_r11_m_axis_phase_TDATA(15 downto 0),
      m_axis_phase_tlast => BoundaryCell_r11_m_axis_phase_TLAST,
      m_axis_phase_tready => BoundaryCell_r11_m_axis_phase_TREADY,
      m_axis_phase_tvalid => BoundaryCell_r11_m_axis_phase_TVALID,
      m_axis_result_tdata(15 downto 0) => BoundaryCell_r11_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => BoundaryCell_r11_m_axis_result_TREADY,
      m_axis_result_tvalid => BoundaryCell_r11_m_axis_result_TVALID,
      s_axis_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c1_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns3_0_m_axis_c1_TLAST,
      s_axis_tready(0) => StreamToColumns3_0_m_axis_c1_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns3_0_m_axis_c1_TVALID
    );
BoundaryCell_r22: component QRDecomp3_BoundaryCell_r22_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_phase_tdata(15 downto 0) => BoundaryCell_r22_m_axis_phase_TDATA(15 downto 0),
      m_axis_phase_tlast => BoundaryCell_r22_m_axis_phase_TLAST,
      m_axis_phase_tready => BoundaryCell_r22_m_axis_phase_TREADY,
      m_axis_phase_tvalid => BoundaryCell_r22_m_axis_phase_TVALID,
      m_axis_result_tdata(15 downto 0) => BoundaryCell_r22_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => BoundaryCell_r22_m_axis_result_TREADY,
      m_axis_result_tvalid => BoundaryCell_r22_m_axis_result_TVALID,
      s_axis_tdata(15 downto 0) => InternalCell_r12_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_r12_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_r12_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_r12_m_axis_TVALID(0)
    );
BoundaryCell_r33: component QRDecomp3_BoundaryCell_r33_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_phase_tdata(15 downto 0) => BoundaryCell_r33_m_axis_phase_TDATA(15 downto 0),
      m_axis_phase_tlast => BoundaryCell_r33_m_axis_phase_TLAST,
      m_axis_phase_tready => BoundaryCell_r33_m_axis_phase_TREADY,
      m_axis_phase_tvalid => BoundaryCell_r33_m_axis_phase_TVALID,
      m_axis_result_tdata(15 downto 0) => BoundaryCell_r33_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => BoundaryCell_r33_m_axis_result_TREADY,
      m_axis_result_tvalid => BoundaryCell_r33_m_axis_result_TVALID,
      s_axis_tdata(15 downto 0) => InternalCell_r23_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_r23_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_r23_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_r23_m_axis_TVALID(0)
    );
InternalCell_qt11: component QRDecomp3_InternalCell_qt11_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt11_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt11_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt11_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_qt11_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_qt11_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_qt11_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_qt11_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M02_AXIS_TDATA(47 downto 32),
      s_axis_phase_tlast => axis_broadcaster_0_M02_AXIS_TLAST(2),
      s_axis_phase_tready => axis_broadcaster_0_M02_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M02_AXIS_TVALID(2),
      s_axis_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c4_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns3_0_m_axis_c4_TLAST,
      s_axis_tready(0) => StreamToColumns3_0_m_axis_c4_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns3_0_m_axis_c4_TVALID
    );
InternalCell_qt12: component QRDecomp3_InternalCell_qt12_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt12_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt12_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt12_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_qt12_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_qt12_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_qt12_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_qt12_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M03_AXIS_TDATA(63 downto 48),
      s_axis_phase_tlast => axis_broadcaster_0_M03_AXIS_TLAST(3),
      s_axis_phase_tready => axis_broadcaster_0_M03_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M03_AXIS_TVALID(3),
      s_axis_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c5_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns3_0_m_axis_c5_TLAST,
      s_axis_tready(0) => StreamToColumns3_0_m_axis_c5_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns3_0_m_axis_c5_TVALID
    );
InternalCell_qt13: component QRDecomp3_InternalCell_qt13_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt13_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt13_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt13_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_qt13_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_qt13_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_qt13_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_qt13_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M04_AXIS_TDATA(79 downto 64),
      s_axis_phase_tlast => axis_broadcaster_0_M04_AXIS_TLAST(4),
      s_axis_phase_tready => axis_broadcaster_0_M04_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M04_AXIS_TVALID(4),
      s_axis_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c6_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns3_0_m_axis_c6_TLAST,
      s_axis_tready(0) => StreamToColumns3_0_m_axis_c6_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns3_0_m_axis_c6_TVALID
    );
InternalCell_qt21: component QRDecomp3_InternalCell_qt21_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt21_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt21_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt21_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_qt21_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_qt21_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_qt21_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_qt21_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_1_M01_AXIS_TDATA(31 downto 16),
      s_axis_phase_tlast => axis_broadcaster_1_M01_AXIS_TLAST(1),
      s_axis_phase_tready => axis_broadcaster_1_M01_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_1_M01_AXIS_TVALID(1),
      s_axis_tdata(15 downto 0) => InternalCell_qt11_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt11_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt11_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt11_m_axis_TVALID(0)
    );
InternalCell_qt22: component QRDecomp3_InternalCell_qt22_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt22_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt22_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt22_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_qt22_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_qt22_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_qt22_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_qt22_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_1_M02_AXIS_TDATA(47 downto 32),
      s_axis_phase_tlast => axis_broadcaster_1_M02_AXIS_TLAST(2),
      s_axis_phase_tready => axis_broadcaster_1_M02_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_1_M02_AXIS_TVALID(2),
      s_axis_tdata(15 downto 0) => InternalCell_qt12_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt12_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt12_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt12_m_axis_TVALID(0)
    );
InternalCell_qt23: component QRDecomp3_InternalCell_qt23_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt23_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt23_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt23_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_qt23_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_qt23_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_qt23_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_qt23_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_1_M03_AXIS_TDATA(63 downto 48),
      s_axis_phase_tlast => axis_broadcaster_1_M03_AXIS_TLAST(3),
      s_axis_phase_tready => axis_broadcaster_1_M03_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_1_M03_AXIS_TVALID(3),
      s_axis_tdata(15 downto 0) => InternalCell_qt13_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt13_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt13_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt13_m_axis_TVALID(0)
    );
InternalCell_qt31: component QRDecomp3_InternalCell_qt31_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt31_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt31_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt31_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => NLW_InternalCell_qt31_m_axis_tdata_UNCONNECTED(15 downto 0),
      m_axis_tlast(0) => NLW_InternalCell_qt31_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(0) => xlconstant_val1_dout(0),
      m_axis_tvalid(0) => NLW_InternalCell_qt31_m_axis_tvalid_UNCONNECTED(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_2_M00_AXIS_TDATA(15 downto 0),
      s_axis_phase_tlast => axis_broadcaster_2_M00_AXIS_TLAST(0),
      s_axis_phase_tready => axis_broadcaster_2_M00_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_2_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => InternalCell_qt21_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt21_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt21_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt21_m_axis_TVALID(0)
    );
InternalCell_qt32: component QRDecomp3_InternalCell_qt32_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt32_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt32_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt32_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => NLW_InternalCell_qt32_m_axis_tdata_UNCONNECTED(15 downto 0),
      m_axis_tlast(0) => NLW_InternalCell_qt32_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(0) => xlconstant_val1_dout(0),
      m_axis_tvalid(0) => NLW_InternalCell_qt32_m_axis_tvalid_UNCONNECTED(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_2_M01_AXIS_TDATA(31 downto 16),
      s_axis_phase_tlast => axis_broadcaster_2_M01_AXIS_TLAST(1),
      s_axis_phase_tready => axis_broadcaster_2_M01_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_2_M01_AXIS_TVALID(1),
      s_axis_tdata(15 downto 0) => InternalCell_qt22_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt22_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt22_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt22_m_axis_TVALID(0)
    );
InternalCell_qt33: component QRDecomp3_InternalCell_qt33_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt33_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt33_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt33_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => NLW_InternalCell_qt33_m_axis_tdata_UNCONNECTED(15 downto 0),
      m_axis_tlast(0) => NLW_InternalCell_qt33_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(0) => xlconstant_val1_dout(0),
      m_axis_tvalid(0) => NLW_InternalCell_qt33_m_axis_tvalid_UNCONNECTED(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_2_M02_AXIS_TDATA(47 downto 32),
      s_axis_phase_tlast => axis_broadcaster_2_M02_AXIS_TLAST(2),
      s_axis_phase_tready => axis_broadcaster_2_M02_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_2_M02_AXIS_TVALID(2),
      s_axis_tdata(15 downto 0) => InternalCell_qt23_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt23_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt23_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt23_m_axis_TVALID(0)
    );
InternalCell_r12: component QRDecomp3_InternalCell_r12_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_r12_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_r12_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_r12_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_r12_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_r12_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_r12_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_r12_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      s_axis_phase_tlast => axis_broadcaster_0_M00_AXIS_TLAST(0),
      s_axis_phase_tready => axis_broadcaster_0_M00_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c2_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns3_0_m_axis_c2_TLAST,
      s_axis_tready(0) => StreamToColumns3_0_m_axis_c2_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns3_0_m_axis_c2_TVALID
    );
InternalCell_r13: component QRDecomp3_InternalCell_r13_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_r13_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_r13_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_r13_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_r13_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_r13_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_r13_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_r13_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      s_axis_phase_tlast => axis_broadcaster_0_M01_AXIS_TLAST(1),
      s_axis_phase_tready => axis_broadcaster_0_M01_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M01_AXIS_TVALID(1),
      s_axis_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c3_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns3_0_m_axis_c3_TLAST,
      s_axis_tready(0) => StreamToColumns3_0_m_axis_c3_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns3_0_m_axis_c3_TVALID
    );
InternalCell_r23: component QRDecomp3_InternalCell_r23_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_r23_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_r23_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_r23_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => InternalCell_r23_m_axis_TDATA(15 downto 0),
      m_axis_tlast(0) => InternalCell_r23_m_axis_TLAST(0),
      m_axis_tready(0) => InternalCell_r23_m_axis_TREADY(0),
      m_axis_tvalid(0) => InternalCell_r23_m_axis_TVALID(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_1_M00_AXIS_TDATA(15 downto 0),
      s_axis_phase_tlast => axis_broadcaster_1_M00_AXIS_TLAST(0),
      s_axis_phase_tready => axis_broadcaster_1_M00_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_1_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => InternalCell_r13_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_r13_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_r13_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_r13_m_axis_TVALID(0)
    );
StreamToColumns3_0: component QRDecomp3_StreamToColumns3_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_c1_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c1_TDATA(15 downto 0),
      m_axis_c1_tlast => StreamToColumns3_0_m_axis_c1_TLAST,
      m_axis_c1_tready => StreamToColumns3_0_m_axis_c1_TREADY(0),
      m_axis_c1_tvalid => StreamToColumns3_0_m_axis_c1_TVALID,
      m_axis_c2_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c2_TDATA(15 downto 0),
      m_axis_c2_tlast => StreamToColumns3_0_m_axis_c2_TLAST,
      m_axis_c2_tready => StreamToColumns3_0_m_axis_c2_TREADY(0),
      m_axis_c2_tvalid => StreamToColumns3_0_m_axis_c2_TVALID,
      m_axis_c3_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c3_TDATA(15 downto 0),
      m_axis_c3_tlast => StreamToColumns3_0_m_axis_c3_TLAST,
      m_axis_c3_tready => StreamToColumns3_0_m_axis_c3_TREADY(0),
      m_axis_c3_tvalid => StreamToColumns3_0_m_axis_c3_TVALID,
      m_axis_c4_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c4_TDATA(15 downto 0),
      m_axis_c4_tlast => StreamToColumns3_0_m_axis_c4_TLAST,
      m_axis_c4_tready => StreamToColumns3_0_m_axis_c4_TREADY(0),
      m_axis_c4_tvalid => StreamToColumns3_0_m_axis_c4_TVALID,
      m_axis_c5_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c5_TDATA(15 downto 0),
      m_axis_c5_tlast => StreamToColumns3_0_m_axis_c5_TLAST,
      m_axis_c5_tready => StreamToColumns3_0_m_axis_c5_TREADY(0),
      m_axis_c5_tvalid => StreamToColumns3_0_m_axis_c5_TVALID,
      m_axis_c6_tdata(15 downto 0) => StreamToColumns3_0_m_axis_c6_TDATA(15 downto 0),
      m_axis_c6_tlast => StreamToColumns3_0_m_axis_c6_TLAST,
      m_axis_c6_tready => StreamToColumns3_0_m_axis_c6_TREADY(0),
      m_axis_c6_tvalid => StreamToColumns3_0_m_axis_c6_TVALID,
      s_axis_tdata(15 downto 0) => s_axis_1_TDATA(15 downto 0),
      s_axis_tready => s_axis_1_TREADY,
      s_axis_tvalid => s_axis_1_TVALID
    );
axis_broadcaster_0: component QRDecomp3_axis_broadcaster_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(79 downto 64) => axis_broadcaster_0_M04_AXIS_TDATA(79 downto 64),
      m_axis_tdata(63 downto 48) => axis_broadcaster_0_M03_AXIS_TDATA(63 downto 48),
      m_axis_tdata(47 downto 32) => axis_broadcaster_0_M02_AXIS_TDATA(47 downto 32),
      m_axis_tdata(31 downto 16) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(4) => axis_broadcaster_0_M04_AXIS_TLAST(4),
      m_axis_tlast(3) => axis_broadcaster_0_M03_AXIS_TLAST(3),
      m_axis_tlast(2) => axis_broadcaster_0_M02_AXIS_TLAST(2),
      m_axis_tlast(1) => axis_broadcaster_0_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_0_M00_AXIS_TLAST(0),
      m_axis_tready(4) => axis_broadcaster_0_M04_AXIS_TREADY,
      m_axis_tready(3) => axis_broadcaster_0_M03_AXIS_TREADY,
      m_axis_tready(2) => axis_broadcaster_0_M02_AXIS_TREADY,
      m_axis_tready(1) => axis_broadcaster_0_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_0_M00_AXIS_TREADY,
      m_axis_tvalid(4) => axis_broadcaster_0_M04_AXIS_TVALID(4),
      m_axis_tvalid(3) => axis_broadcaster_0_M03_AXIS_TVALID(3),
      m_axis_tvalid(2) => axis_broadcaster_0_M02_AXIS_TVALID(2),
      m_axis_tvalid(1) => axis_broadcaster_0_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => BoundaryCell_r11_m_axis_phase_TDATA(15 downto 0),
      s_axis_tlast => BoundaryCell_r11_m_axis_phase_TLAST,
      s_axis_tready => BoundaryCell_r11_m_axis_phase_TREADY,
      s_axis_tvalid => BoundaryCell_r11_m_axis_phase_TVALID
    );
axis_broadcaster_1: component QRDecomp3_axis_broadcaster_1_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(63 downto 48) => axis_broadcaster_1_M03_AXIS_TDATA(63 downto 48),
      m_axis_tdata(47 downto 32) => axis_broadcaster_1_M02_AXIS_TDATA(47 downto 32),
      m_axis_tdata(31 downto 16) => axis_broadcaster_1_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(3) => axis_broadcaster_1_M03_AXIS_TLAST(3),
      m_axis_tlast(2) => axis_broadcaster_1_M02_AXIS_TLAST(2),
      m_axis_tlast(1) => axis_broadcaster_1_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1_M00_AXIS_TLAST(0),
      m_axis_tready(3) => axis_broadcaster_1_M03_AXIS_TREADY,
      m_axis_tready(2) => axis_broadcaster_1_M02_AXIS_TREADY,
      m_axis_tready(1) => axis_broadcaster_1_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1_M00_AXIS_TREADY,
      m_axis_tvalid(3) => axis_broadcaster_1_M03_AXIS_TVALID(3),
      m_axis_tvalid(2) => axis_broadcaster_1_M02_AXIS_TVALID(2),
      m_axis_tvalid(1) => axis_broadcaster_1_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => BoundaryCell_r22_m_axis_phase_TDATA(15 downto 0),
      s_axis_tlast => BoundaryCell_r22_m_axis_phase_TLAST,
      s_axis_tready => BoundaryCell_r22_m_axis_phase_TREADY,
      s_axis_tvalid => BoundaryCell_r22_m_axis_phase_TVALID
    );
axis_broadcaster_2: component QRDecomp3_axis_broadcaster_2_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(47 downto 32) => axis_broadcaster_2_M02_AXIS_TDATA(47 downto 32),
      m_axis_tdata(31 downto 16) => axis_broadcaster_2_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_2_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(2) => axis_broadcaster_2_M02_AXIS_TLAST(2),
      m_axis_tlast(1) => axis_broadcaster_2_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_2_M00_AXIS_TLAST(0),
      m_axis_tready(2) => axis_broadcaster_2_M02_AXIS_TREADY,
      m_axis_tready(1) => axis_broadcaster_2_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_2_M00_AXIS_TREADY,
      m_axis_tvalid(2) => axis_broadcaster_2_M02_AXIS_TVALID(2),
      m_axis_tvalid(1) => axis_broadcaster_2_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_2_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => BoundaryCell_r33_m_axis_phase_TDATA(15 downto 0),
      s_axis_tlast => BoundaryCell_r33_m_axis_phase_TLAST,
      s_axis_tready => BoundaryCell_r33_m_axis_phase_TREADY,
      s_axis_tvalid => BoundaryCell_r33_m_axis_phase_TVALID
    );
xlconstant_val1: component QRDecomp3_xlconstant_val1_0
     port map (
      dout(0) => xlconstant_val1_dout(0)
    );
end STRUCTURE;
