--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:02:17 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target BackSubtraction2.bd
--Design      : BackSubtraction2
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BackSubtraction2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_result_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_result_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_r11_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r11_tready : out STD_LOGIC;
    s_axis_r11_tvalid : in STD_LOGIC;
    s_axis_r12_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r12_tready : out STD_LOGIC;
    s_axis_r12_tvalid : in STD_LOGIC;
    s_axis_r22_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r22_tready : out STD_LOGIC;
    s_axis_r22_tvalid : in STD_LOGIC;
    s_axis_y1_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_y1_tready : out STD_LOGIC;
    s_axis_y1_tvalid : in STD_LOGIC;
    s_axis_y2_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_y2_tready : out STD_LOGIC;
    s_axis_y2_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BackSubtraction2 : entity is "BackSubtraction2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BackSubtraction2,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=2,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BackSubtraction2 : entity is "BackSubtraction2.hwdef";
end BackSubtraction2;

architecture STRUCTURE of BackSubtraction2 is
  component BackSubtraction2_ParallelToStream2_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s0_axis_tvalid : in STD_LOGIC;
    s0_axis_tready : out STD_LOGIC;
    s0_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s1_axis_tvalid : in STD_LOGIC;
    s1_axis_tready : out STD_LOGIC;
    s1_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component BackSubtraction2_ParallelToStream2_0_0;
  component BackSubtraction2_DivCell_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_result_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_result_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_to_right_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_to_right_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_to_right_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_to_right_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_dividend_init_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_dividend_init_tready : out STD_LOGIC;
    s_axis_dividend_init_tvalid : in STD_LOGIC;
    s_axis_dividend_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_dividend_tlast : in STD_LOGIC;
    s_axis_dividend_tready : out STD_LOGIC;
    s_axis_dividend_tvalid : in STD_LOGIC;
    s_axis_divisor_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_divisor_tready : out STD_LOGIC;
    s_axis_divisor_tvalid : in STD_LOGIC
  );
  end component BackSubtraction2_DivCell_0_0;
  component BackSubtraction2_MulSubCellTerm_0_0 is
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
  end component BackSubtraction2_MulSubCellTerm_0_0;
  component BackSubtraction2_LimitNumData_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component BackSubtraction2_LimitNumData_0_0;
  signal DivCell_0_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DivCell_0_m_axis_result_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DivCell_0_m_axis_result_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DivCell_0_m_axis_result_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DivCell_0_m_axis_to_right_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DivCell_0_m_axis_to_right_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DivCell_0_m_axis_to_right_TREADY : STD_LOGIC;
  signal DivCell_0_m_axis_to_right_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal LimitNumData_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal LimitNumData_0_m_axis_TREADY : STD_LOGIC;
  signal LimitNumData_0_m_axis_TVALID : STD_LOGIC;
  signal MulSubCellTerm_0_m_axis_to_left_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal MulSubCellTerm_0_m_axis_to_left_TLAST : STD_LOGIC;
  signal MulSubCellTerm_0_m_axis_to_left_TREADY : STD_LOGIC;
  signal MulSubCellTerm_0_m_axis_to_left_TVALID : STD_LOGIC;
  signal ParallelToStream2_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ParallelToStream2_0_m_axis_TREADY : STD_LOGIC;
  signal ParallelToStream2_0_m_axis_TVALID : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal s0_axis_r12_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s0_axis_r12_1_TREADY : STD_LOGIC;
  signal s0_axis_r12_1_TVALID : STD_LOGIC;
  signal s1_axis_r11_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s1_axis_r11_1_TREADY : STD_LOGIC;
  signal s1_axis_r11_1_TVALID : STD_LOGIC;
  signal s_axis_r12_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r12_1_TREADY : STD_LOGIC;
  signal s_axis_r12_1_TVALID : STD_LOGIC;
  signal s_axis_y1_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y1_1_TREADY : STD_LOGIC;
  signal s_axis_y1_1_TVALID : STD_LOGIC;
  signal s_axis_y2_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y2_1_TREADY : STD_LOGIC;
  signal s_axis_y2_1_TVALID : STD_LOGIC;
begin
  DivCell_0_m_axis_result_TREADY(0) <= m_axis_result_tready(0);
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_result_tdata(15 downto 0) <= DivCell_0_m_axis_result_TDATA(15 downto 0);
  m_axis_result_tlast(0) <= DivCell_0_m_axis_result_TLAST(0);
  m_axis_result_tvalid(0) <= DivCell_0_m_axis_result_TVALID(0);
  s0_axis_r12_1_TDATA(15 downto 0) <= s_axis_r22_tdata(15 downto 0);
  s0_axis_r12_1_TVALID <= s_axis_r22_tvalid;
  s1_axis_r11_1_TDATA(15 downto 0) <= s_axis_r11_tdata(15 downto 0);
  s1_axis_r11_1_TVALID <= s_axis_r11_tvalid;
  s_axis_r11_tready <= s1_axis_r11_1_TREADY;
  s_axis_r12_1_TDATA(15 downto 0) <= s_axis_r12_tdata(15 downto 0);
  s_axis_r12_1_TVALID <= s_axis_r12_tvalid;
  s_axis_r12_tready <= s_axis_r12_1_TREADY;
  s_axis_r22_tready <= s0_axis_r12_1_TREADY;
  s_axis_y1_1_TDATA(15 downto 0) <= s_axis_y1_tdata(15 downto 0);
  s_axis_y1_1_TVALID <= s_axis_y1_tvalid;
  s_axis_y1_tready <= s_axis_y1_1_TREADY;
  s_axis_y2_1_TDATA(15 downto 0) <= s_axis_y2_tdata(15 downto 0);
  s_axis_y2_1_TVALID <= s_axis_y2_tvalid;
  s_axis_y2_tready <= s_axis_y2_1_TREADY;
DivCell_0: component BackSubtraction2_DivCell_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => DivCell_0_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tlast(0) => DivCell_0_m_axis_result_TLAST(0),
      m_axis_result_tready(0) => DivCell_0_m_axis_result_TREADY(0),
      m_axis_result_tvalid(0) => DivCell_0_m_axis_result_TVALID(0),
      m_axis_to_right_tdata(15 downto 0) => DivCell_0_m_axis_to_right_TDATA(15 downto 0),
      m_axis_to_right_tlast(0) => DivCell_0_m_axis_to_right_TLAST(0),
      m_axis_to_right_tready(0) => DivCell_0_m_axis_to_right_TREADY,
      m_axis_to_right_tvalid(0) => DivCell_0_m_axis_to_right_TVALID(0),
      s_axis_dividend_init_tdata(15 downto 0) => s_axis_y2_1_TDATA(15 downto 0),
      s_axis_dividend_init_tready => s_axis_y2_1_TREADY,
      s_axis_dividend_init_tvalid => s_axis_y2_1_TVALID,
      s_axis_dividend_tdata(15 downto 0) => MulSubCellTerm_0_m_axis_to_left_TDATA(15 downto 0),
      s_axis_dividend_tlast => MulSubCellTerm_0_m_axis_to_left_TLAST,
      s_axis_dividend_tready => MulSubCellTerm_0_m_axis_to_left_TREADY,
      s_axis_dividend_tvalid => MulSubCellTerm_0_m_axis_to_left_TVALID,
      s_axis_divisor_tdata(15 downto 0) => ParallelToStream2_0_m_axis_TDATA(15 downto 0),
      s_axis_divisor_tready => ParallelToStream2_0_m_axis_TREADY,
      s_axis_divisor_tvalid => ParallelToStream2_0_m_axis_TVALID
    );
LimitNumData_0: component BackSubtraction2_LimitNumData_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => LimitNumData_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => LimitNumData_0_m_axis_TREADY,
      m_axis_tvalid => LimitNumData_0_m_axis_TVALID,
      s_axis_tdata(15 downto 0) => DivCell_0_m_axis_to_right_TDATA(15 downto 0),
      s_axis_tlast => DivCell_0_m_axis_to_right_TLAST(0),
      s_axis_tready => DivCell_0_m_axis_to_right_TREADY,
      s_axis_tvalid => DivCell_0_m_axis_to_right_TVALID(0)
    );
MulSubCellTerm_0: component BackSubtraction2_MulSubCellTerm_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_to_left_tdata(15 downto 0) => MulSubCellTerm_0_m_axis_to_left_TDATA(15 downto 0),
      m_axis_to_left_tlast => MulSubCellTerm_0_m_axis_to_left_TLAST,
      m_axis_to_left_tready => MulSubCellTerm_0_m_axis_to_left_TREADY,
      m_axis_to_left_tvalid => MulSubCellTerm_0_m_axis_to_left_TVALID,
      s_axis_r_tdata(15 downto 0) => s_axis_r12_1_TDATA(15 downto 0),
      s_axis_r_tready => s_axis_r12_1_TREADY,
      s_axis_r_tvalid => s_axis_r12_1_TVALID,
      s_axis_x_tdata(15 downto 0) => LimitNumData_0_m_axis_TDATA(15 downto 0),
      s_axis_x_tready => LimitNumData_0_m_axis_TREADY,
      s_axis_x_tvalid => LimitNumData_0_m_axis_TVALID,
      s_axis_y_tdata(15 downto 0) => s_axis_y1_1_TDATA(15 downto 0),
      s_axis_y_tready => s_axis_y1_1_TREADY,
      s_axis_y_tvalid => s_axis_y1_1_TVALID
    );
ParallelToStream2_0: component BackSubtraction2_ParallelToStream2_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => ParallelToStream2_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => ParallelToStream2_0_m_axis_TREADY,
      m_axis_tvalid => ParallelToStream2_0_m_axis_TVALID,
      s0_axis_tdata(15 downto 0) => s0_axis_r12_1_TDATA(15 downto 0),
      s0_axis_tready => s0_axis_r12_1_TREADY,
      s0_axis_tvalid => s0_axis_r12_1_TVALID,
      s1_axis_tdata(15 downto 0) => s1_axis_r11_1_TDATA(15 downto 0),
      s1_axis_tready => s1_axis_r11_1_TREADY,
      s1_axis_tvalid => s1_axis_r11_1_TVALID
    );
end STRUCTURE;
