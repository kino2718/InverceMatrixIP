--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:01:25 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target MulSubCellTerm.bd
--Design      : MulSubCellTerm
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MulSubCellTerm is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_to_left_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_to_left_tlast : out STD_LOGIC;
    m_axis_to_left_tready : in STD_LOGIC;
    m_axis_to_left_tvalid : out STD_LOGIC;
    s_axis_r_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r_tready : out STD_LOGIC;
    s_axis_r_tvalid : in STD_LOGIC;
    s_axis_x_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_x_tready : out STD_LOGIC;
    s_axis_x_tvalid : in STD_LOGIC;
    s_axis_y_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_y_tready : out STD_LOGIC;
    s_axis_y_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of MulSubCellTerm : entity is "MulSubCellTerm,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=MulSubCellTerm,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of MulSubCellTerm : entity is "MulSubCellTerm.hwdef";
end MulSubCellTerm;

architecture STRUCTURE of MulSubCellTerm is
  component MulSubCellTerm_MultiplySubtractor_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tready : out STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tready : out STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_c_tvalid : in STD_LOGIC;
    s_axis_c_tready : out STD_LOGIC;
    s_axis_c_tlast : in STD_LOGIC;
    s_axis_c_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component MulSubCellTerm_MultiplySubtractor_0_0;
  component MulSubCellTerm_xlconstant_val1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MulSubCellTerm_xlconstant_val1_0;
  signal MultiplySubtractor_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal MultiplySubtractor_0_m_axis_TLAST : STD_LOGIC;
  signal MultiplySubtractor_0_m_axis_TREADY : STD_LOGIC;
  signal MultiplySubtractor_0_m_axis_TVALID : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal s_axis_r_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r_1_TREADY : STD_LOGIC;
  signal s_axis_r_1_TVALID : STD_LOGIC;
  signal s_axis_x_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_x_1_TREADY : STD_LOGIC;
  signal s_axis_x_1_TVALID : STD_LOGIC;
  signal s_axis_y_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y_1_TREADY : STD_LOGIC;
  signal s_axis_y_1_TVALID : STD_LOGIC;
  signal xlconstant_val1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  MultiplySubtractor_0_m_axis_TREADY <= m_axis_to_left_tready;
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_to_left_tdata(15 downto 0) <= MultiplySubtractor_0_m_axis_TDATA(15 downto 0);
  m_axis_to_left_tlast <= MultiplySubtractor_0_m_axis_TLAST;
  m_axis_to_left_tvalid <= MultiplySubtractor_0_m_axis_TVALID;
  s_axis_r_1_TDATA(15 downto 0) <= s_axis_r_tdata(15 downto 0);
  s_axis_r_1_TVALID <= s_axis_r_tvalid;
  s_axis_r_tready <= s_axis_r_1_TREADY;
  s_axis_x_1_TDATA(15 downto 0) <= s_axis_x_tdata(15 downto 0);
  s_axis_x_1_TVALID <= s_axis_x_tvalid;
  s_axis_x_tready <= s_axis_x_1_TREADY;
  s_axis_y_1_TDATA(15 downto 0) <= s_axis_y_tdata(15 downto 0);
  s_axis_y_1_TVALID <= s_axis_y_tvalid;
  s_axis_y_tready <= s_axis_y_1_TREADY;
MultiplySubtractor_0: component MulSubCellTerm_MultiplySubtractor_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => MultiplySubtractor_0_m_axis_TDATA(15 downto 0),
      m_axis_tlast => MultiplySubtractor_0_m_axis_TLAST,
      m_axis_tready => MultiplySubtractor_0_m_axis_TREADY,
      m_axis_tvalid => MultiplySubtractor_0_m_axis_TVALID,
      s_axis_a_tdata(15 downto 0) => s_axis_x_1_TDATA(15 downto 0),
      s_axis_a_tready => s_axis_x_1_TREADY,
      s_axis_a_tvalid => s_axis_x_1_TVALID,
      s_axis_b_tdata(15 downto 0) => s_axis_r_1_TDATA(15 downto 0),
      s_axis_b_tready => s_axis_r_1_TREADY,
      s_axis_b_tvalid => s_axis_r_1_TVALID,
      s_axis_c_tdata(15 downto 0) => s_axis_y_1_TDATA(15 downto 0),
      s_axis_c_tlast => xlconstant_val1_dout(0),
      s_axis_c_tready => s_axis_y_1_TREADY,
      s_axis_c_tvalid => s_axis_y_1_TVALID
    );
xlconstant_val1: component MulSubCellTerm_xlconstant_val1_0
     port map (
      dout(0) => xlconstant_val1_dout(0)
    );
end STRUCTURE;
