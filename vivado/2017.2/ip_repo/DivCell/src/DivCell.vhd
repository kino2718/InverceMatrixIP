--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:00:27 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target DivCell.bd
--Design      : DivCell
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DivCell is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of DivCell : entity is "DivCell,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=DivCell,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of DivCell : entity is "DivCell.hwdef";
end DivCell;

architecture STRUCTURE of DivCell is
  component DivCell_AXI4StreamRegister_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component DivCell_AXI4StreamRegister_0_0;
  component DivCell_PrependInit_0_0 is
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
  end component DivCell_PrependInit_0_0;
  component DivCell_Divider2FixedPoint_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component DivCell_Divider2FixedPoint_0_0;
  component DivCell_axis_broadcaster_0_0 is
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
  end component DivCell_axis_broadcaster_0_0;
  component DivCell_div_gen_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_divisor_tvalid : in STD_LOGIC;
    s_axis_divisor_tready : out STD_LOGIC;
    s_axis_divisor_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_dividend_tvalid : in STD_LOGIC;
    s_axis_dividend_tready : out STD_LOGIC;
    s_axis_dividend_tlast : in STD_LOGIC;
    s_axis_dividend_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tready : in STD_LOGIC;
    m_axis_dout_tlast : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component DivCell_div_gen_0_0;
  signal AXI4StreamRegister_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AXI4StreamRegister_0_m_axis_TLAST : STD_LOGIC;
  signal AXI4StreamRegister_0_m_axis_TREADY : STD_LOGIC;
  signal AXI4StreamRegister_0_m_axis_TVALID : STD_LOGIC;
  signal Divider2FixedPoint_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Divider2FixedPoint_0_m_axis_TLAST : STD_LOGIC;
  signal Divider2FixedPoint_0_m_axis_TREADY : STD_LOGIC;
  signal Divider2FixedPoint_0_m_axis_TVALID : STD_LOGIC;
  signal PrependInit_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal PrependInit_0_m_axis_TLAST : STD_LOGIC;
  signal PrependInit_0_m_axis_TREADY : STD_LOGIC;
  signal PrependInit_0_m_axis_TVALID : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal axis_broadcaster_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_0_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M00_AXIS_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_0_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_0_M01_AXIS_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal div_gen_0_M_AXIS_DOUT_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal div_gen_0_M_AXIS_DOUT_TLAST : STD_LOGIC;
  signal div_gen_0_M_AXIS_DOUT_TREADY : STD_LOGIC;
  signal div_gen_0_M_AXIS_DOUT_TVALID : STD_LOGIC;
  signal s_axis_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_1_TLAST : STD_LOGIC;
  signal s_axis_1_TREADY : STD_LOGIC;
  signal s_axis_1_TVALID : STD_LOGIC;
  signal s_axis_divisor_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_divisor_1_TREADY : STD_LOGIC;
  signal s_axis_divisor_1_TVALID : STD_LOGIC;
  signal s_axis_init_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_init_1_TREADY : STD_LOGIC;
  signal s_axis_init_1_TVALID : STD_LOGIC;
begin
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  axis_broadcaster_0_M00_AXIS_TREADY(0) <= m_axis_result_tready(0);
  axis_broadcaster_0_M01_AXIS_TREADY(0) <= m_axis_to_right_tready(0);
  m_axis_result_tdata(15 downto 0) <= axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0);
  m_axis_result_tlast(0) <= axis_broadcaster_0_M00_AXIS_TLAST(0);
  m_axis_result_tvalid(0) <= axis_broadcaster_0_M00_AXIS_TVALID(0);
  m_axis_to_right_tdata(15 downto 0) <= axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16);
  m_axis_to_right_tlast(0) <= axis_broadcaster_0_M01_AXIS_TLAST(1);
  m_axis_to_right_tvalid(0) <= axis_broadcaster_0_M01_AXIS_TVALID(1);
  s_axis_1_TDATA(15 downto 0) <= s_axis_dividend_tdata(15 downto 0);
  s_axis_1_TLAST <= s_axis_dividend_tlast;
  s_axis_1_TVALID <= s_axis_dividend_tvalid;
  s_axis_dividend_init_tready <= s_axis_init_1_TREADY;
  s_axis_dividend_tready <= s_axis_1_TREADY;
  s_axis_divisor_1_TDATA(15 downto 0) <= s_axis_divisor_tdata(15 downto 0);
  s_axis_divisor_1_TVALID <= s_axis_divisor_tvalid;
  s_axis_divisor_tready <= s_axis_divisor_1_TREADY;
  s_axis_init_1_TDATA(15 downto 0) <= s_axis_dividend_init_tdata(15 downto 0);
  s_axis_init_1_TVALID <= s_axis_dividend_init_tvalid;
AXI4StreamRegister_0: component DivCell_AXI4StreamRegister_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => AXI4StreamRegister_0_m_axis_TDATA(15 downto 0),
      m_axis_tlast => AXI4StreamRegister_0_m_axis_TLAST,
      m_axis_tready => AXI4StreamRegister_0_m_axis_TREADY,
      m_axis_tvalid => AXI4StreamRegister_0_m_axis_TVALID,
      s_axis_tdata(15 downto 0) => Divider2FixedPoint_0_m_axis_TDATA(15 downto 0),
      s_axis_tlast => Divider2FixedPoint_0_m_axis_TLAST,
      s_axis_tready => Divider2FixedPoint_0_m_axis_TREADY,
      s_axis_tvalid => Divider2FixedPoint_0_m_axis_TVALID
    );
Divider2FixedPoint_0: component DivCell_Divider2FixedPoint_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => Divider2FixedPoint_0_m_axis_TDATA(15 downto 0),
      m_axis_tlast => Divider2FixedPoint_0_m_axis_TLAST,
      m_axis_tready => Divider2FixedPoint_0_m_axis_TREADY,
      m_axis_tvalid => Divider2FixedPoint_0_m_axis_TVALID,
      s_axis_tdata(31 downto 0) => div_gen_0_M_AXIS_DOUT_TDATA(31 downto 0),
      s_axis_tlast => div_gen_0_M_AXIS_DOUT_TLAST,
      s_axis_tready => div_gen_0_M_AXIS_DOUT_TREADY,
      s_axis_tvalid => div_gen_0_M_AXIS_DOUT_TVALID
    );
PrependInit_0: component DivCell_PrependInit_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => PrependInit_0_m_axis_TDATA(15 downto 0),
      m_axis_tlast => PrependInit_0_m_axis_TLAST,
      m_axis_tready => PrependInit_0_m_axis_TREADY,
      m_axis_tvalid => PrependInit_0_m_axis_TVALID,
      s_axis_init_tdata(15 downto 0) => s_axis_init_1_TDATA(15 downto 0),
      s_axis_init_tready => s_axis_init_1_TREADY,
      s_axis_init_tvalid => s_axis_init_1_TVALID,
      s_axis_tdata(15 downto 0) => s_axis_1_TDATA(15 downto 0),
      s_axis_tlast => s_axis_1_TLAST,
      s_axis_tready => s_axis_1_TREADY,
      s_axis_tvalid => s_axis_1_TVALID
    );
axis_broadcaster_0: component DivCell_axis_broadcaster_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 16) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_0_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_0_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_0_M01_AXIS_TREADY(0),
      m_axis_tready(0) => axis_broadcaster_0_M00_AXIS_TREADY(0),
      m_axis_tvalid(1) => axis_broadcaster_0_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => AXI4StreamRegister_0_m_axis_TDATA(15 downto 0),
      s_axis_tlast => AXI4StreamRegister_0_m_axis_TLAST,
      s_axis_tready => AXI4StreamRegister_0_m_axis_TREADY,
      s_axis_tvalid => AXI4StreamRegister_0_m_axis_TVALID
    );
div_gen_0: component DivCell_div_gen_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_dout_tdata(31 downto 0) => div_gen_0_M_AXIS_DOUT_TDATA(31 downto 0),
      m_axis_dout_tlast => div_gen_0_M_AXIS_DOUT_TLAST,
      m_axis_dout_tready => div_gen_0_M_AXIS_DOUT_TREADY,
      m_axis_dout_tvalid => div_gen_0_M_AXIS_DOUT_TVALID,
      s_axis_dividend_tdata(15 downto 0) => PrependInit_0_m_axis_TDATA(15 downto 0),
      s_axis_dividend_tlast => PrependInit_0_m_axis_TLAST,
      s_axis_dividend_tready => PrependInit_0_m_axis_TREADY,
      s_axis_dividend_tvalid => PrependInit_0_m_axis_TVALID,
      s_axis_divisor_tdata(15 downto 0) => s_axis_divisor_1_TDATA(15 downto 0),
      s_axis_divisor_tready => s_axis_divisor_1_TREADY,
      s_axis_divisor_tvalid => s_axis_divisor_1_TVALID
    );
end STRUCTURE;
