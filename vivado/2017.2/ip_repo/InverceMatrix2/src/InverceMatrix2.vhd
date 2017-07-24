--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 13:02:54 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target InverceMatrix2.bd
--Design      : InverceMatrix2
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity InverceMatrix2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of InverceMatrix2 : entity is "InverceMatrix2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=InverceMatrix2,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=3,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of InverceMatrix2 : entity is "InverceMatrix2.hwdef";
end InverceMatrix2;

architecture STRUCTURE of InverceMatrix2 is
  component InverceMatrix2_BackSubtraction2_col1_0 is
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
  end component InverceMatrix2_BackSubtraction2_col1_0;
  component InverceMatrix2_BackSubtraction2_col2_0 is
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
  end component InverceMatrix2_BackSubtraction2_col2_0;
  component InverceMatrix2_QRDecomp2_0_0 is
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
  end component InverceMatrix2_QRDecomp2_0_0;
  component InverceMatrix2_Reorder2_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_col1_tvalid : in STD_LOGIC;
    s_axis_col1_tready : out STD_LOGIC;
    s_axis_col1_tlast : in STD_LOGIC;
    s_axis_col1_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_col2_tvalid : in STD_LOGIC;
    s_axis_col2_tready : out STD_LOGIC;
    s_axis_col2_tlast : in STD_LOGIC;
    s_axis_col2_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component InverceMatrix2_Reorder2_0_0;
  component InverceMatrix2_axis_broadcaster_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component InverceMatrix2_axis_broadcaster_0_0;
  component InverceMatrix2_axis_broadcaster_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component InverceMatrix2_axis_broadcaster_1_0;
  component InverceMatrix2_axis_broadcaster_2_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component InverceMatrix2_axis_broadcaster_2_0;
  signal BackSubtraction2_col1_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BackSubtraction2_col1_m_axis_result_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal BackSubtraction2_col1_m_axis_result_TREADY : STD_LOGIC;
  signal BackSubtraction2_col1_m_axis_result_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal BackSubtraction2_col2_m_axis_result_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal BackSubtraction2_col2_m_axis_result_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal BackSubtraction2_col2_m_axis_result_TREADY : STD_LOGIC;
  signal BackSubtraction2_col2_m_axis_result_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal QRDecomp2_0_m_axis_qt11_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_qt11_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt11_TVALID : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt12_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_qt12_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt12_TVALID : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt21_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_qt21_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt21_TVALID : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt22_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_qt22_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_qt22_TVALID : STD_LOGIC;
  signal QRDecomp2_0_m_axis_r11_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_r11_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_r11_TVALID : STD_LOGIC;
  signal QRDecomp2_0_m_axis_r12_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_r12_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_r12_TVALID : STD_LOGIC;
  signal QRDecomp2_0_m_axis_r22_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal QRDecomp2_0_m_axis_r22_TREADY : STD_LOGIC;
  signal QRDecomp2_0_m_axis_r22_TVALID : STD_LOGIC;
  signal Reorder2_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Reorder2_0_m_axis_TLAST : STD_LOGIC;
  signal Reorder2_0_m_axis_TREADY : STD_LOGIC;
  signal Reorder2_0_m_axis_TVALID : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal axis_broadcaster_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_0_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_0_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_1_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_2_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_2_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_2_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_2_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_2_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_2_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s_axis_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_1_TREADY : STD_LOGIC;
  signal s_axis_1_TVALID : STD_LOGIC;
begin
  Reorder2_0_m_axis_TREADY <= m_axis_tready;
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  m_axis_tdata(15 downto 0) <= Reorder2_0_m_axis_TDATA(15 downto 0);
  m_axis_tlast <= Reorder2_0_m_axis_TLAST;
  m_axis_tvalid <= Reorder2_0_m_axis_TVALID;
  s_axis_1_TDATA(15 downto 0) <= s_axis_tdata(15 downto 0);
  s_axis_1_TVALID <= s_axis_tvalid;
  s_axis_tready <= s_axis_1_TREADY;
BackSubtraction2_col1: component InverceMatrix2_BackSubtraction2_col1_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => BackSubtraction2_col1_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tlast(0) => BackSubtraction2_col1_m_axis_result_TLAST(0),
      m_axis_result_tready(0) => BackSubtraction2_col1_m_axis_result_TREADY,
      m_axis_result_tvalid(0) => BackSubtraction2_col1_m_axis_result_TVALID(0),
      s_axis_r11_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      s_axis_r11_tready => axis_broadcaster_0_M00_AXIS_TREADY,
      s_axis_r11_tvalid => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_r12_tdata(15 downto 0) => axis_broadcaster_1_M00_AXIS_TDATA(15 downto 0),
      s_axis_r12_tready => axis_broadcaster_1_M00_AXIS_TREADY,
      s_axis_r12_tvalid => axis_broadcaster_1_M00_AXIS_TVALID(0),
      s_axis_r22_tdata(15 downto 0) => axis_broadcaster_2_M00_AXIS_TDATA(15 downto 0),
      s_axis_r22_tready => axis_broadcaster_2_M00_AXIS_TREADY,
      s_axis_r22_tvalid => axis_broadcaster_2_M00_AXIS_TVALID(0),
      s_axis_y1_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt11_TDATA(15 downto 0),
      s_axis_y1_tready => QRDecomp2_0_m_axis_qt11_TREADY,
      s_axis_y1_tvalid => QRDecomp2_0_m_axis_qt11_TVALID,
      s_axis_y2_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt21_TDATA(15 downto 0),
      s_axis_y2_tready => QRDecomp2_0_m_axis_qt21_TREADY,
      s_axis_y2_tvalid => QRDecomp2_0_m_axis_qt21_TVALID
    );
BackSubtraction2_col2: component InverceMatrix2_BackSubtraction2_col2_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_result_tdata(15 downto 0) => BackSubtraction2_col2_m_axis_result_TDATA(15 downto 0),
      m_axis_result_tlast(0) => BackSubtraction2_col2_m_axis_result_TLAST(0),
      m_axis_result_tready(0) => BackSubtraction2_col2_m_axis_result_TREADY,
      m_axis_result_tvalid(0) => BackSubtraction2_col2_m_axis_result_TVALID(0),
      s_axis_r11_tdata(15 downto 0) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      s_axis_r11_tready => axis_broadcaster_0_M01_AXIS_TREADY,
      s_axis_r11_tvalid => axis_broadcaster_0_M01_AXIS_TVALID(1),
      s_axis_r12_tdata(15 downto 0) => axis_broadcaster_1_M01_AXIS_TDATA(31 downto 16),
      s_axis_r12_tready => axis_broadcaster_1_M01_AXIS_TREADY,
      s_axis_r12_tvalid => axis_broadcaster_1_M01_AXIS_TVALID(1),
      s_axis_r22_tdata(15 downto 0) => axis_broadcaster_2_M01_AXIS_TDATA(31 downto 16),
      s_axis_r22_tready => axis_broadcaster_2_M01_AXIS_TREADY,
      s_axis_r22_tvalid => axis_broadcaster_2_M01_AXIS_TVALID(1),
      s_axis_y1_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt12_TDATA(15 downto 0),
      s_axis_y1_tready => QRDecomp2_0_m_axis_qt12_TREADY,
      s_axis_y1_tvalid => QRDecomp2_0_m_axis_qt12_TVALID,
      s_axis_y2_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt22_TDATA(15 downto 0),
      s_axis_y2_tready => QRDecomp2_0_m_axis_qt22_TREADY,
      s_axis_y2_tvalid => QRDecomp2_0_m_axis_qt22_TVALID
    );
QRDecomp2_0: component InverceMatrix2_QRDecomp2_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_qt11_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt11_TDATA(15 downto 0),
      m_axis_qt11_tready => QRDecomp2_0_m_axis_qt11_TREADY,
      m_axis_qt11_tvalid => QRDecomp2_0_m_axis_qt11_TVALID,
      m_axis_qt12_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt12_TDATA(15 downto 0),
      m_axis_qt12_tready => QRDecomp2_0_m_axis_qt12_TREADY,
      m_axis_qt12_tvalid => QRDecomp2_0_m_axis_qt12_TVALID,
      m_axis_qt21_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt21_TDATA(15 downto 0),
      m_axis_qt21_tready => QRDecomp2_0_m_axis_qt21_TREADY,
      m_axis_qt21_tvalid => QRDecomp2_0_m_axis_qt21_TVALID,
      m_axis_qt22_tdata(15 downto 0) => QRDecomp2_0_m_axis_qt22_TDATA(15 downto 0),
      m_axis_qt22_tready => QRDecomp2_0_m_axis_qt22_TREADY,
      m_axis_qt22_tvalid => QRDecomp2_0_m_axis_qt22_TVALID,
      m_axis_r11_tdata(15 downto 0) => QRDecomp2_0_m_axis_r11_TDATA(15 downto 0),
      m_axis_r11_tready => QRDecomp2_0_m_axis_r11_TREADY,
      m_axis_r11_tvalid => QRDecomp2_0_m_axis_r11_TVALID,
      m_axis_r12_tdata(15 downto 0) => QRDecomp2_0_m_axis_r12_TDATA(15 downto 0),
      m_axis_r12_tready => QRDecomp2_0_m_axis_r12_TREADY,
      m_axis_r12_tvalid => QRDecomp2_0_m_axis_r12_TVALID,
      m_axis_r22_tdata(15 downto 0) => QRDecomp2_0_m_axis_r22_TDATA(15 downto 0),
      m_axis_r22_tready => QRDecomp2_0_m_axis_r22_TREADY,
      m_axis_r22_tvalid => QRDecomp2_0_m_axis_r22_TVALID,
      s_axis_tdata(15 downto 0) => s_axis_1_TDATA(15 downto 0),
      s_axis_tready => s_axis_1_TREADY,
      s_axis_tvalid => s_axis_1_TVALID
    );
Reorder2_0: component InverceMatrix2_Reorder2_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => Reorder2_0_m_axis_TDATA(15 downto 0),
      m_axis_tlast => Reorder2_0_m_axis_TLAST,
      m_axis_tready => Reorder2_0_m_axis_TREADY,
      m_axis_tvalid => Reorder2_0_m_axis_TVALID,
      s_axis_col1_tdata(15 downto 0) => BackSubtraction2_col1_m_axis_result_TDATA(15 downto 0),
      s_axis_col1_tlast => BackSubtraction2_col1_m_axis_result_TLAST(0),
      s_axis_col1_tready => BackSubtraction2_col1_m_axis_result_TREADY,
      s_axis_col1_tvalid => BackSubtraction2_col1_m_axis_result_TVALID(0),
      s_axis_col2_tdata(15 downto 0) => BackSubtraction2_col2_m_axis_result_TDATA(15 downto 0),
      s_axis_col2_tlast => BackSubtraction2_col2_m_axis_result_TLAST(0),
      s_axis_col2_tready => BackSubtraction2_col2_m_axis_result_TREADY,
      s_axis_col2_tvalid => BackSubtraction2_col2_m_axis_result_TVALID(0)
    );
axis_broadcaster_0: component InverceMatrix2_axis_broadcaster_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 16) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0),
      m_axis_tready(1) => axis_broadcaster_0_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_0_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_0_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => QRDecomp2_0_m_axis_r11_TDATA(15 downto 0),
      s_axis_tready => QRDecomp2_0_m_axis_r11_TREADY,
      s_axis_tvalid => QRDecomp2_0_m_axis_r11_TVALID
    );
axis_broadcaster_1: component InverceMatrix2_axis_broadcaster_1_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 16) => axis_broadcaster_1_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1_M00_AXIS_TDATA(15 downto 0),
      m_axis_tready(1) => axis_broadcaster_1_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => QRDecomp2_0_m_axis_r12_TDATA(15 downto 0),
      s_axis_tready => QRDecomp2_0_m_axis_r12_TREADY,
      s_axis_tvalid => QRDecomp2_0_m_axis_r12_TVALID
    );
axis_broadcaster_2: component InverceMatrix2_axis_broadcaster_2_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 16) => axis_broadcaster_2_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_2_M00_AXIS_TDATA(15 downto 0),
      m_axis_tready(1) => axis_broadcaster_2_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_2_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_2_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_2_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => QRDecomp2_0_m_axis_r22_TDATA(15 downto 0),
      s_axis_tready => QRDecomp2_0_m_axis_r22_TREADY,
      s_axis_tvalid => QRDecomp2_0_m_axis_r22_TVALID
    );
end STRUCTURE;
