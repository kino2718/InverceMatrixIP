--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:04:29 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target BackSubtraction3.bd
--Design      : BackSubtraction3
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BackSubtraction3 is
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
    s_axis_r13_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r13_tready : out STD_LOGIC;
    s_axis_r13_tvalid : in STD_LOGIC;
    s_axis_r22_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r22_tready : out STD_LOGIC;
    s_axis_r22_tvalid : in STD_LOGIC;
    s_axis_r23_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r23_tready : out STD_LOGIC;
    s_axis_r23_tvalid : in STD_LOGIC;
    s_axis_r33_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_r33_tready : out STD_LOGIC;
    s_axis_r33_tvalid : in STD_LOGIC;
    s_axis_y1_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_y1_tready : out STD_LOGIC;
    s_axis_y1_tvalid : in STD_LOGIC;
    s_axis_y2_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_y2_tready : out STD_LOGIC;
    s_axis_y2_tvalid : in STD_LOGIC;
    s_axis_y3_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_y3_tready : out STD_LOGIC;
    s_axis_y3_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BackSubtraction3 : entity is "BackSubtraction3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BackSubtraction3,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=8,numReposBlks=8,numNonXlnxBlks=7,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=3,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BackSubtraction3 : entity is "BackSubtraction3.hwdef";
end BackSubtraction3;

architecture STRUCTURE of BackSubtraction3 is
  component BackSubtraction3_ParallelToStream2_0_0 is
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
  end component BackSubtraction3_ParallelToStream2_0_0;
  component BackSubtraction3_ParallelToStream3_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s0_axis_tvalid : in STD_LOGIC;
    s0_axis_tready : out STD_LOGIC;
    s0_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s1_axis_tvalid : in STD_LOGIC;
    s1_axis_tready : out STD_LOGIC;
    s1_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s2_axis_tvalid : in STD_LOGIC;
    s2_axis_tready : out STD_LOGIC;
    s2_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component BackSubtraction3_ParallelToStream3_0_0;
  component BackSubtraction3_DivCell_0_0 is
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
  end component BackSubtraction3_DivCell_0_0;
  component BackSubtraction3_MulSubCellTerm_0_0 is
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
  end component BackSubtraction3_MulSubCellTerm_0_0;
  component BackSubtraction3_MulSubCell_0_0 is
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
  end component BackSubtraction3_MulSubCell_0_0;
  component BackSubtraction3_LimitNumData_0_0 is
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
  end component BackSubtraction3_LimitNumData_0_0;
  component BackSubtraction3_LimitNumData_1_0 is
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
  end component BackSubtraction3_LimitNumData_1_0;
  component BackSubtraction3_axis_broadcaster_0_0 is
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
  end component BackSubtraction3_axis_broadcaster_0_0;
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
  signal LimitNumData_1_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal LimitNumData_1_m_axis_TREADY : STD_LOGIC;
  signal LimitNumData_1_m_axis_TVALID : STD_LOGIC;
  signal MulSubCellTerm_0_m_axis_to_left_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal MulSubCellTerm_0_m_axis_to_left_TLAST : STD_LOGIC;
  signal MulSubCellTerm_0_m_axis_to_left_TREADY : STD_LOGIC;
  signal MulSubCellTerm_0_m_axis_to_left_TVALID : STD_LOGIC;
  signal MulSubCell_0_m_axis_to_left_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal MulSubCell_0_m_axis_to_left_TLAST : STD_LOGIC;
  signal MulSubCell_0_m_axis_to_left_TREADY : STD_LOGIC;
  signal MulSubCell_0_m_axis_to_left_TVALID : STD_LOGIC;
  signal ParallelToStream2_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ParallelToStream2_0_m_axis_TREADY : STD_LOGIC;
  signal ParallelToStream2_0_m_axis_TVALID : STD_LOGIC;
  signal ParallelToStream3_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ParallelToStream3_0_m_axis_TREADY : STD_LOGIC;
  signal ParallelToStream3_0_m_axis_TVALID : STD_LOGIC;
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
  signal s_axis_r11_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r11_1_TREADY : STD_LOGIC;
  signal s_axis_r11_1_TVALID : STD_LOGIC;
  signal s_axis_r12_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r12_1_TREADY : STD_LOGIC;
  signal s_axis_r12_1_TVALID : STD_LOGIC;
  signal s_axis_r13_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r13_1_TREADY : STD_LOGIC;
  signal s_axis_r13_1_TVALID : STD_LOGIC;
  signal s_axis_r22_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r22_1_TREADY : STD_LOGIC;
  signal s_axis_r22_1_TVALID : STD_LOGIC;
  signal s_axis_r23_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r23_1_TREADY : STD_LOGIC;
  signal s_axis_r23_1_TVALID : STD_LOGIC;
  signal s_axis_r33_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_r33_1_TREADY : STD_LOGIC;
  signal s_axis_r33_1_TVALID : STD_LOGIC;
  signal s_axis_y1_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y1_1_TREADY : STD_LOGIC;
  signal s_axis_y1_1_TVALID : STD_LOGIC;
  signal s_axis_y2_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y2_1_TREADY : STD_LOGIC;
  signal s_axis_y2_1_TVALID : STD_LOGIC;
  signal s_axis_y3_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_y3_1_TREADY : STD_LOGIC;
  signal s_axis_y3_1_TVALID : STD_LOGIC;
begin
  DivCell_0_m_axis_result_TREADY(0) <= m_axis_result_tready(0);
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_result_tdata(15 downto 0) <= DivCell_0_m_axis_result_TDATA(15 downto 0);
  m_axis_result_tlast(0) <= DivCell_0_m_axis_result_TLAST(0);
  m_axis_result_tvalid(0) <= DivCell_0_m_axis_result_TVALID(0);
  s_axis_r11_1_TDATA(15 downto 0) <= s_axis_r11_tdata(15 downto 0);
  s_axis_r11_1_TVALID <= s_axis_r11_tvalid;
  s_axis_r11_tready <= s_axis_r11_1_TREADY;
  s_axis_r12_1_TDATA(15 downto 0) <= s_axis_r12_tdata(15 downto 0);
  s_axis_r12_1_TVALID <= s_axis_r12_tvalid;
  s_axis_r12_tready <= s_axis_r12_1_TREADY;
  s_axis_r13_1_TDATA(15 downto 0) <= s_axis_r13_tdata(15 downto 0);
  s_axis_r13_1_TVALID <= s_axis_r13_tvalid;
  s_axis_r13_tready <= s_axis_r13_1_TREADY;
  s_axis_r22_1_TDATA(15 downto 0) <= s_axis_r22_tdata(15 downto 0);
  s_axis_r22_1_TVALID <= s_axis_r22_tvalid;
  s_axis_r22_tready <= s_axis_r22_1_TREADY;
  s_axis_r23_1_TDATA(15 downto 0) <= s_axis_r23_tdata(15 downto 0);
  s_axis_r23_1_TVALID <= s_axis_r23_tvalid;
  s_axis_r23_tready <= s_axis_r23_1_TREADY;
  s_axis_r33_1_TDATA(15 downto 0) <= s_axis_r33_tdata(15 downto 0);
  s_axis_r33_1_TVALID <= s_axis_r33_tvalid;
  s_axis_r33_tready <= s_axis_r33_1_TREADY;
  s_axis_y1_1_TDATA(15 downto 0) <= s_axis_y1_tdata(15 downto 0);
  s_axis_y1_1_TVALID <= s_axis_y1_tvalid;
  s_axis_y1_tready <= s_axis_y1_1_TREADY;
  s_axis_y2_1_TDATA(15 downto 0) <= s_axis_y2_tdata(15 downto 0);
  s_axis_y2_1_TVALID <= s_axis_y2_tvalid;
  s_axis_y2_tready <= s_axis_y2_1_TREADY;
  s_axis_y3_1_TDATA(15 downto 0) <= s_axis_y3_tdata(15 downto 0);
  s_axis_y3_1_TVALID <= s_axis_y3_tvalid;
  s_axis_y3_tready <= s_axis_y3_1_TREADY;
DivCell_0: component BackSubtraction3_DivCell_0_0
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
      s_axis_dividend_init_tdata(15 downto 0) => s_axis_y3_1_TDATA(15 downto 0),
      s_axis_dividend_init_tready => s_axis_y3_1_TREADY,
      s_axis_dividend_init_tvalid => s_axis_y3_1_TVALID,
      s_axis_dividend_tdata(15 downto 0) => MulSubCell_0_m_axis_to_left_TDATA(15 downto 0),
      s_axis_dividend_tlast => MulSubCell_0_m_axis_to_left_TLAST,
      s_axis_dividend_tready => MulSubCell_0_m_axis_to_left_TREADY,
      s_axis_dividend_tvalid => MulSubCell_0_m_axis_to_left_TVALID,
      s_axis_divisor_tdata(15 downto 0) => ParallelToStream3_0_m_axis_TDATA(15 downto 0),
      s_axis_divisor_tready => ParallelToStream3_0_m_axis_TREADY,
      s_axis_divisor_tvalid => ParallelToStream3_0_m_axis_TVALID
    );
LimitNumData_0: component BackSubtraction3_LimitNumData_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => LimitNumData_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => LimitNumData_0_m_axis_TREADY,
      m_axis_tvalid => LimitNumData_0_m_axis_TVALID,
      s_axis_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_0_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_0_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_0_M00_AXIS_TVALID(0)
    );
LimitNumData_1: component BackSubtraction3_LimitNumData_1_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => LimitNumData_1_m_axis_TDATA(15 downto 0),
      m_axis_tready => LimitNumData_1_m_axis_TREADY,
      m_axis_tvalid => LimitNumData_1_m_axis_TVALID,
      s_axis_tdata(15 downto 0) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_0_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_0_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_0_M01_AXIS_TVALID(1)
    );
MulSubCellTerm_0: component BackSubtraction3_MulSubCellTerm_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_to_left_tdata(15 downto 0) => MulSubCellTerm_0_m_axis_to_left_TDATA(15 downto 0),
      m_axis_to_left_tlast => MulSubCellTerm_0_m_axis_to_left_TLAST,
      m_axis_to_left_tready => MulSubCellTerm_0_m_axis_to_left_TREADY,
      m_axis_to_left_tvalid => MulSubCellTerm_0_m_axis_to_left_TVALID,
      s_axis_r_tdata(15 downto 0) => s_axis_r13_1_TDATA(15 downto 0),
      s_axis_r_tready => s_axis_r13_1_TREADY,
      s_axis_r_tvalid => s_axis_r13_1_TVALID,
      s_axis_x_tdata(15 downto 0) => LimitNumData_1_m_axis_TDATA(15 downto 0),
      s_axis_x_tready => LimitNumData_1_m_axis_TREADY,
      s_axis_x_tvalid => LimitNumData_1_m_axis_TVALID,
      s_axis_y_tdata(15 downto 0) => s_axis_y1_1_TDATA(15 downto 0),
      s_axis_y_tready => s_axis_y1_1_TREADY,
      s_axis_y_tvalid => s_axis_y1_1_TVALID
    );
MulSubCell_0: component BackSubtraction3_MulSubCell_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_to_left_tdata(15 downto 0) => MulSubCell_0_m_axis_to_left_TDATA(15 downto 0),
      m_axis_to_left_tlast => MulSubCell_0_m_axis_to_left_TLAST,
      m_axis_to_left_tready => MulSubCell_0_m_axis_to_left_TREADY,
      m_axis_to_left_tvalid => MulSubCell_0_m_axis_to_left_TVALID,
      s_axis_from_right_tdata(15 downto 0) => MulSubCellTerm_0_m_axis_to_left_TDATA(15 downto 0),
      s_axis_from_right_tlast => MulSubCellTerm_0_m_axis_to_left_TLAST,
      s_axis_from_right_tready => MulSubCellTerm_0_m_axis_to_left_TREADY,
      s_axis_from_right_tvalid => MulSubCellTerm_0_m_axis_to_left_TVALID,
      s_axis_r_tdata(15 downto 0) => ParallelToStream2_0_m_axis_TDATA(15 downto 0),
      s_axis_r_tready => ParallelToStream2_0_m_axis_TREADY,
      s_axis_r_tvalid => ParallelToStream2_0_m_axis_TVALID,
      s_axis_x_tdata(15 downto 0) => LimitNumData_0_m_axis_TDATA(15 downto 0),
      s_axis_x_tready => LimitNumData_0_m_axis_TREADY,
      s_axis_x_tvalid => LimitNumData_0_m_axis_TVALID,
      s_axis_y_tdata(15 downto 0) => s_axis_y2_1_TDATA(15 downto 0),
      s_axis_y_tready => s_axis_y2_1_TREADY,
      s_axis_y_tvalid => s_axis_y2_1_TVALID
    );
ParallelToStream2_0: component BackSubtraction3_ParallelToStream2_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => ParallelToStream2_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => ParallelToStream2_0_m_axis_TREADY,
      m_axis_tvalid => ParallelToStream2_0_m_axis_TVALID,
      s0_axis_tdata(15 downto 0) => s_axis_r23_1_TDATA(15 downto 0),
      s0_axis_tready => s_axis_r23_1_TREADY,
      s0_axis_tvalid => s_axis_r23_1_TVALID,
      s1_axis_tdata(15 downto 0) => s_axis_r12_1_TDATA(15 downto 0),
      s1_axis_tready => s_axis_r12_1_TREADY,
      s1_axis_tvalid => s_axis_r12_1_TVALID
    );
ParallelToStream3_0: component BackSubtraction3_ParallelToStream3_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => ParallelToStream3_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => ParallelToStream3_0_m_axis_TREADY,
      m_axis_tvalid => ParallelToStream3_0_m_axis_TVALID,
      s0_axis_tdata(15 downto 0) => s_axis_r33_1_TDATA(15 downto 0),
      s0_axis_tready => s_axis_r33_1_TREADY,
      s0_axis_tvalid => s_axis_r33_1_TVALID,
      s1_axis_tdata(15 downto 0) => s_axis_r22_1_TDATA(15 downto 0),
      s1_axis_tready => s_axis_r22_1_TREADY,
      s1_axis_tvalid => s_axis_r22_1_TVALID,
      s2_axis_tdata(15 downto 0) => s_axis_r11_1_TDATA(15 downto 0),
      s2_axis_tready => s_axis_r11_1_TREADY,
      s2_axis_tvalid => s_axis_r11_1_TVALID
    );
axis_broadcaster_0: component BackSubtraction3_axis_broadcaster_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 16) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_0_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_0_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_0_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_0_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_0_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => DivCell_0_m_axis_to_right_TDATA(15 downto 0),
      s_axis_tlast => DivCell_0_m_axis_to_right_TLAST(0),
      s_axis_tready => DivCell_0_m_axis_to_right_TREADY,
      s_axis_tvalid => DivCell_0_m_axis_to_right_TVALID(0)
    );
end STRUCTURE;
