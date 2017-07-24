--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 12:59:10 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target QRDecomp2.bd
--Design      : QRDecomp2
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity QRDecomp2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_qt11_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt11_tready : in STD_LOGIC;
    m_axis_qt11_tvalid : out STD_LOGIC;
    m_axis_qt12_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt12_tready : in STD_LOGIC;
    m_axis_qt12_tvalid : out STD_LOGIC;
    m_axis_qt21_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt21_tready : in STD_LOGIC;
    m_axis_qt21_tvalid : out STD_LOGIC;
    m_axis_qt22_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_qt22_tready : in STD_LOGIC;
    m_axis_qt22_tvalid : out STD_LOGIC;
    m_axis_r11_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r11_tready : in STD_LOGIC;
    m_axis_r11_tvalid : out STD_LOGIC;
    m_axis_r12_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r12_tready : in STD_LOGIC;
    m_axis_r12_tvalid : out STD_LOGIC;
    m_axis_r22_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_r22_tready : in STD_LOGIC;
    m_axis_r22_tvalid : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of QRDecomp2 : entity is "QRDecomp2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=QRDecomp2,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=11,numReposBlks=11,numNonXlnxBlks=8,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=7,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of QRDecomp2 : entity is "QRDecomp2.hwdef";
end QRDecomp2;

architecture STRUCTURE of QRDecomp2 is
  component QRDecomp2_BoundaryCell_r22_0 is
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
  end component QRDecomp2_BoundaryCell_r22_0;
  component QRDecomp2_BoundaryCell_r11_0 is
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
  end component QRDecomp2_BoundaryCell_r11_0;
  component QRDecomp2_InternalCell_qt11_0 is
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
  end component QRDecomp2_InternalCell_qt11_0;
  component QRDecomp2_InternalCell_qt12_0 is
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
  end component QRDecomp2_InternalCell_qt12_0;
  component QRDecomp2_InternalCell_qt21_0 is
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
  end component QRDecomp2_InternalCell_qt21_0;
  component QRDecomp2_InternalCell_qt22_0 is
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
  end component QRDecomp2_InternalCell_qt22_0;
  component QRDecomp2_InternalCell_r12_0 is
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
  end component QRDecomp2_InternalCell_r12_0;
  component QRDecomp2_StreamToColumns2_0_0 is
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
    m_axis_c4_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component QRDecomp2_StreamToColumns2_0_0;
  component QRDecomp2_axis_broadcaster_0_0 is
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
  end component QRDecomp2_axis_broadcaster_0_0;
  component QRDecomp2_axis_broadcaster_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component QRDecomp2_axis_broadcaster_1_0;
  component QRDecomp2_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component QRDecomp2_xlconstant_0_0;
  signal BoundaryCell_0_m_axis_phase_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_0_m_axis_phase_TLAST : STD_LOGIC;
  signal BoundaryCell_0_m_axis_phase_TREADY : STD_LOGIC;
  signal BoundaryCell_0_m_axis_phase_TVALID : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_phase_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r11_m_axis_phase_TLAST : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_phase_TREADY : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_phase_TVALID : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r11_m_axis_result_TREADY : STD_LOGIC;
  signal BoundaryCell_r11_m_axis_result_TVALID : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BoundaryCell_r22_m_axis_result_TREADY : STD_LOGIC;
  signal BoundaryCell_r22_m_axis_result_TVALID : STD_LOGIC;
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
  signal InternalCell_qt21_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt21_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt21_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_qt22_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_qt22_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_qt22_m_axis_result_TVALID : STD_LOGIC;
  signal InternalCell_r12_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r12_m_axis_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r12_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r12_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal InternalCell_r12_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InternalCell_r12_m_axis_result_TREADY : STD_LOGIC;
  signal InternalCell_r12_m_axis_result_TVALID : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns2_0_m_axis_c1_TLAST : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c1_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns2_0_m_axis_c1_TVALID : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c2_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns2_0_m_axis_c2_TLAST : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c2_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns2_0_m_axis_c2_TVALID : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c3_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns2_0_m_axis_c3_TLAST : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c3_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns2_0_m_axis_c3_TVALID : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c4_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StreamToColumns2_0_m_axis_c4_TLAST : STD_LOGIC;
  signal StreamToColumns2_0_m_axis_c4_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal StreamToColumns2_0_m_axis_c4_TVALID : STD_LOGIC;
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
  signal axis_broadcaster_1_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_1_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s_axis_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_1_TREADY : STD_LOGIC;
  signal s_axis_1_TVALID : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt21_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InternalCell_qt21_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt21_m_axis_tvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt22_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InternalCell_qt22_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_InternalCell_qt22_m_axis_tvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  BoundaryCell_r11_m_axis_result_TREADY <= m_axis_r11_tready;
  BoundaryCell_r22_m_axis_result_TREADY <= m_axis_r22_tready;
  InternalCell_qt11_m_axis_result_TREADY <= m_axis_qt11_tready;
  InternalCell_qt12_m_axis_result_TREADY <= m_axis_qt12_tready;
  InternalCell_qt21_m_axis_result_TREADY <= m_axis_qt21_tready;
  InternalCell_qt22_m_axis_result_TREADY <= m_axis_qt22_tready;
  InternalCell_r12_m_axis_result_TREADY <= m_axis_r12_tready;
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_qt11_tdata(15 downto 0) <= InternalCell_qt11_m_axis_result_TDATA(15 downto 0);
  m_axis_qt11_tvalid <= InternalCell_qt11_m_axis_result_TVALID;
  m_axis_qt12_tdata(15 downto 0) <= InternalCell_qt12_m_axis_result_TDATA(15 downto 0);
  m_axis_qt12_tvalid <= InternalCell_qt12_m_axis_result_TVALID;
  m_axis_qt21_tdata(15 downto 0) <= InternalCell_qt21_m_axis_result_TDATA(15 downto 0);
  m_axis_qt21_tvalid <= InternalCell_qt21_m_axis_result_TVALID;
  m_axis_qt22_tdata(15 downto 0) <= InternalCell_qt22_m_axis_result_TDATA(15 downto 0);
  m_axis_qt22_tvalid <= InternalCell_qt22_m_axis_result_TVALID;
  m_axis_r11_tdata(15 downto 0) <= BoundaryCell_r11_m_axis_result_TDATA(15 downto 0);
  m_axis_r11_tvalid <= BoundaryCell_r11_m_axis_result_TVALID;
  m_axis_r12_tdata(15 downto 0) <= InternalCell_r12_m_axis_result_TDATA(15 downto 0);
  m_axis_r12_tvalid <= InternalCell_r12_m_axis_result_TVALID;
  m_axis_r22_tdata(15 downto 0) <= BoundaryCell_r22_m_axis_result_TDATA(15 downto 0);
  m_axis_r22_tvalid <= BoundaryCell_r22_m_axis_result_TVALID;
  s_axis_1_TDATA(15 downto 0) <= s_axis_tdata(15 downto 0);
  s_axis_1_TVALID <= s_axis_tvalid;
  s_axis_tready <= s_axis_1_TREADY;
BoundaryCell_r11: component QRDecomp2_BoundaryCell_r11_0
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
      s_axis_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c1_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns2_0_m_axis_c1_TLAST,
      s_axis_tready(0) => StreamToColumns2_0_m_axis_c1_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns2_0_m_axis_c1_TVALID
    );
BoundaryCell_r22: component QRDecomp2_BoundaryCell_r22_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_phase_tdata(15 downto 0) => BoundaryCell_0_m_axis_phase_TDATA(15 downto 0),
      m_axis_phase_tlast => BoundaryCell_0_m_axis_phase_TLAST,
      m_axis_phase_tready => BoundaryCell_0_m_axis_phase_TREADY,
      m_axis_phase_tvalid => BoundaryCell_0_m_axis_phase_TVALID,
      m_axis_result_tdata(15 downto 0) => BoundaryCell_r22_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => BoundaryCell_r22_m_axis_result_TREADY,
      m_axis_result_tvalid => BoundaryCell_r22_m_axis_result_TVALID,
      s_axis_tdata(15 downto 0) => InternalCell_r12_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_r12_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_r12_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_r12_m_axis_TVALID(0)
    );
InternalCell_qt11: component QRDecomp2_InternalCell_qt11_0
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
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      s_axis_phase_tlast => axis_broadcaster_0_M01_AXIS_TLAST(1),
      s_axis_phase_tready => axis_broadcaster_0_M01_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M01_AXIS_TVALID(1),
      s_axis_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c3_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns2_0_m_axis_c3_TLAST,
      s_axis_tready(0) => StreamToColumns2_0_m_axis_c3_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns2_0_m_axis_c3_TVALID
    );
InternalCell_qt12: component QRDecomp2_InternalCell_qt12_0
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
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_0_M02_AXIS_TDATA(47 downto 32),
      s_axis_phase_tlast => axis_broadcaster_0_M02_AXIS_TLAST(2),
      s_axis_phase_tready => axis_broadcaster_0_M02_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_0_M02_AXIS_TVALID(2),
      s_axis_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c4_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns2_0_m_axis_c4_TLAST,
      s_axis_tready(0) => StreamToColumns2_0_m_axis_c4_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns2_0_m_axis_c4_TVALID
    );
InternalCell_qt21: component QRDecomp2_InternalCell_qt21_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt21_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt21_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt21_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => NLW_InternalCell_qt21_m_axis_tdata_UNCONNECTED(15 downto 0),
      m_axis_tlast(0) => NLW_InternalCell_qt21_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(0) => xlconstant_0_dout(0),
      m_axis_tvalid(0) => NLW_InternalCell_qt21_m_axis_tvalid_UNCONNECTED(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_1_M00_AXIS_TDATA(15 downto 0),
      s_axis_phase_tlast => axis_broadcaster_1_M00_AXIS_TLAST(0),
      s_axis_phase_tready => axis_broadcaster_1_M00_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_1_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => InternalCell_qt11_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt11_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt11_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt11_m_axis_TVALID(0)
    );
InternalCell_qt22: component QRDecomp2_InternalCell_qt22_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => InternalCell_qt22_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tready => InternalCell_qt22_m_axis_result_TREADY,
      m_axis_result_tvalid => InternalCell_qt22_m_axis_result_TVALID,
      m_axis_tdata(15 downto 0) => NLW_InternalCell_qt22_m_axis_tdata_UNCONNECTED(15 downto 0),
      m_axis_tlast(0) => NLW_InternalCell_qt22_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(0) => xlconstant_0_dout(0),
      m_axis_tvalid(0) => NLW_InternalCell_qt22_m_axis_tvalid_UNCONNECTED(0),
      s_axis_phase_tdata(15 downto 0) => axis_broadcaster_1_M01_AXIS_TDATA(31 downto 16),
      s_axis_phase_tlast => axis_broadcaster_1_M01_AXIS_TLAST(1),
      s_axis_phase_tready => axis_broadcaster_1_M01_AXIS_TREADY,
      s_axis_phase_tvalid => axis_broadcaster_1_M01_AXIS_TVALID(1),
      s_axis_tdata(15 downto 0) => InternalCell_qt12_m_axis_TDATA(15 downto 0),
      s_axis_tlast(0) => InternalCell_qt12_m_axis_TLAST(0),
      s_axis_tready(0) => InternalCell_qt12_m_axis_TREADY(0),
      s_axis_tvalid(0) => InternalCell_qt12_m_axis_TVALID(0)
    );
InternalCell_r12: component QRDecomp2_InternalCell_r12_0
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
      s_axis_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c2_TDATA(15 downto 0),
      s_axis_tlast(0) => StreamToColumns2_0_m_axis_c2_TLAST,
      s_axis_tready(0) => StreamToColumns2_0_m_axis_c2_TREADY(0),
      s_axis_tvalid(0) => StreamToColumns2_0_m_axis_c2_TVALID
    );
StreamToColumns2_0: component QRDecomp2_StreamToColumns2_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_c1_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c1_TDATA(15 downto 0),
      m_axis_c1_tlast => StreamToColumns2_0_m_axis_c1_TLAST,
      m_axis_c1_tready => StreamToColumns2_0_m_axis_c1_TREADY(0),
      m_axis_c1_tvalid => StreamToColumns2_0_m_axis_c1_TVALID,
      m_axis_c2_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c2_TDATA(15 downto 0),
      m_axis_c2_tlast => StreamToColumns2_0_m_axis_c2_TLAST,
      m_axis_c2_tready => StreamToColumns2_0_m_axis_c2_TREADY(0),
      m_axis_c2_tvalid => StreamToColumns2_0_m_axis_c2_TVALID,
      m_axis_c3_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c3_TDATA(15 downto 0),
      m_axis_c3_tlast => StreamToColumns2_0_m_axis_c3_TLAST,
      m_axis_c3_tready => StreamToColumns2_0_m_axis_c3_TREADY(0),
      m_axis_c3_tvalid => StreamToColumns2_0_m_axis_c3_TVALID,
      m_axis_c4_tdata(15 downto 0) => StreamToColumns2_0_m_axis_c4_TDATA(15 downto 0),
      m_axis_c4_tlast => StreamToColumns2_0_m_axis_c4_TLAST,
      m_axis_c4_tready => StreamToColumns2_0_m_axis_c4_TREADY(0),
      m_axis_c4_tvalid => StreamToColumns2_0_m_axis_c4_TVALID,
      s_axis_tdata(15 downto 0) => s_axis_1_TDATA(15 downto 0),
      s_axis_tready => s_axis_1_TREADY,
      s_axis_tvalid => s_axis_1_TVALID
    );
axis_broadcaster_0: component QRDecomp2_axis_broadcaster_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(47 downto 32) => axis_broadcaster_0_M02_AXIS_TDATA(47 downto 32),
      m_axis_tdata(31 downto 16) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(2) => axis_broadcaster_0_M02_AXIS_TLAST(2),
      m_axis_tlast(1) => axis_broadcaster_0_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_0_M00_AXIS_TLAST(0),
      m_axis_tready(2) => axis_broadcaster_0_M02_AXIS_TREADY,
      m_axis_tready(1) => axis_broadcaster_0_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_0_M00_AXIS_TREADY,
      m_axis_tvalid(2) => axis_broadcaster_0_M02_AXIS_TVALID(2),
      m_axis_tvalid(1) => axis_broadcaster_0_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => BoundaryCell_r11_m_axis_phase_TDATA(15 downto 0),
      s_axis_tlast => BoundaryCell_r11_m_axis_phase_TLAST,
      s_axis_tready => BoundaryCell_r11_m_axis_phase_TREADY,
      s_axis_tvalid => BoundaryCell_r11_m_axis_phase_TVALID
    );
axis_broadcaster_1: component QRDecomp2_axis_broadcaster_1_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 16) => axis_broadcaster_1_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_1_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => BoundaryCell_0_m_axis_phase_TDATA(15 downto 0),
      s_axis_tlast => BoundaryCell_0_m_axis_phase_TLAST,
      s_axis_tready => BoundaryCell_0_m_axis_phase_TREADY,
      s_axis_tvalid => BoundaryCell_0_m_axis_phase_TVALID
    );
xlconstant_0: component QRDecomp2_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
