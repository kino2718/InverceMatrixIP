--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:01:05 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target MulSubCell.bd
--Design      : MulSubCell
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MulSubCell is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_to_left_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_to_left_tlast : out STD_LOGIC;
    m_axis_to_left_tready : in STD_LOGIC;
    m_axis_to_left_tvalid : out STD_LOGIC;
    s_axis_from_right_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_from_right_tlast : in STD_LOGIC;
    s_axis_from_right_tready : out STD_LOGIC;
    s_axis_from_right_tvalid : in STD_LOGIC;
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
  attribute CORE_GENERATION_INFO of MulSubCell : entity is "MulSubCell,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=MulSubCell,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of MulSubCell : entity is "MulSubCell.hwdef";
end MulSubCell;

architecture STRUCTURE of MulSubCell is
  component MulSubCell_PrependInit_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_init_tvalid : in STD_LOGIC;
    s_axis_init_tready : out STD_LOGIC;
    s_axis_init_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component MulSubCell_PrependInit_0_0;
  component MulSubCell_MultiplySubtractor_0_0 is
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
  end component MulSubCell_MultiplySubtractor_0_0;
  signal MultiplySubtractor_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal MultiplySubtractor_0_m_axis_TLAST : STD_LOGIC;
  signal MultiplySubtractor_0_m_axis_TREADY : STD_LOGIC;
  signal MultiplySubtractor_0_m_axis_TVALID : STD_LOGIC;
  signal PrependInit_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal PrependInit_0_m_axis_TLAST : STD_LOGIC;
  signal PrependInit_0_m_axis_TREADY : STD_LOGIC;
  signal PrependInit_0_m_axis_TVALID : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal s_axis_from_right_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_from_right_1_TLAST : STD_LOGIC;
  signal s_axis_from_right_1_TREADY : STD_LOGIC;
  signal s_axis_from_right_1_TVALID : STD_LOGIC;
  signal s_axis_r_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r_1_TREADY : STD_LOGIC;
  signal s_axis_r_1_TVALID : STD_LOGIC;
  signal s_axis_x_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_x_1_TREADY : STD_LOGIC;
  signal s_axis_x_1_TVALID : STD_LOGIC;
  signal s_axis_y_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y_1_TREADY : STD_LOGIC;
  signal s_axis_y_1_TVALID : STD_LOGIC;
begin
  MultiplySubtractor_0_m_axis_TREADY <= m_axis_to_left_tready;
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_to_left_tdata(15 downto 0) <= MultiplySubtractor_0_m_axis_TDATA(15 downto 0);
  m_axis_to_left_tlast <= MultiplySubtractor_0_m_axis_TLAST;
  m_axis_to_left_tvalid <= MultiplySubtractor_0_m_axis_TVALID;
  s_axis_from_right_1_TDATA(15 downto 0) <= s_axis_from_right_tdata(15 downto 0);
  s_axis_from_right_1_TLAST <= s_axis_from_right_tlast;
  s_axis_from_right_1_TVALID <= s_axis_from_right_tvalid;
  s_axis_from_right_tready <= s_axis_from_right_1_TREADY;
  s_axis_r_1_TDATA(15 downto 0) <= s_axis_r_tdata(15 downto 0);
  s_axis_r_1_TVALID <= s_axis_r_tvalid;
  s_axis_r_tready <= s_axis_r_1_TREADY;
  s_axis_x_1_TDATA(15 downto 0) <= s_axis_x_tdata(15 downto 0);
  s_axis_x_1_TVALID <= s_axis_x_tvalid;
  s_axis_x_tready <= s_axis_x_1_TREADY;
  s_axis_y_1_TDATA(15 downto 0) <= s_axis_y_tdata(15 downto 0);
  s_axis_y_1_TVALID <= s_axis_y_tvalid;
  s_axis_y_tready <= s_axis_y_1_TREADY;
MultiplySubtractor_0: component MulSubCell_MultiplySubtractor_0_0
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
      s_axis_c_tdata(15 downto 0) => PrependInit_0_m_axis_TDATA(15 downto 0),
      s_axis_c_tlast => PrependInit_0_m_axis_TLAST,
      s_axis_c_tready => PrependInit_0_m_axis_TREADY,
      s_axis_c_tvalid => PrependInit_0_m_axis_TVALID
    );
PrependInit_0: component MulSubCell_PrependInit_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => PrependInit_0_m_axis_TDATA(15 downto 0),
      m_axis_tlast => PrependInit_0_m_axis_TLAST,
      m_axis_tready => PrependInit_0_m_axis_TREADY,
      m_axis_tvalid => PrependInit_0_m_axis_TVALID,
      s_axis_init_tdata(15 downto 0) => s_axis_y_1_TDATA(15 downto 0),
      s_axis_init_tready => s_axis_y_1_TREADY,
      s_axis_init_tvalid => s_axis_y_1_TVALID,
      s_axis_tdata(15 downto 0) => s_axis_from_right_1_TDATA(15 downto 0),
      s_axis_tlast => s_axis_from_right_1_TLAST,
      s_axis_tready => s_axis_from_right_1_TREADY,
      s_axis_tvalid => s_axis_from_right_1_TVALID
    );
end STRUCTURE;
