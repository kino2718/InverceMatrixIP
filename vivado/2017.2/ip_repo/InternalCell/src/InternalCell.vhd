--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Mon Jul 24 12:58:34 2017
--Host        : eggplant running 64-bit Linux Mint 18.2 Sonya
--Command     : generate_target InternalCell.bd
--Design      : InternalCell
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity InternalCell is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of InternalCell : entity is "InternalCell,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=InternalCell,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=6,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of InternalCell : entity is "InternalCell.hwdef";
end InternalCell;

architecture STRUCTURE of InternalCell is
  component InternalCell_Feedback_0_0 is
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
  end component InternalCell_Feedback_0_0;
  component InternalCell_LastCellValue_0_0 is
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
  end component InternalCell_LastCellValue_0_0;
  component InternalCell_axis_broadcaster_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component InternalCell_axis_broadcaster_0_0;
  component InternalCell_axis_combiner_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component InternalCell_axis_combiner_0_0;
  component InternalCell_axis_register_slice_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component InternalCell_axis_register_slice_0_0;
  component InternalCell_cordic_0_0 is
  port (
    aclk : in STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tlast : in STD_LOGIC;
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_cartesian_tvalid : in STD_LOGIC;
    s_axis_cartesian_tready : out STD_LOGIC;
    s_axis_cartesian_tlast : in STD_LOGIC;
    s_axis_cartesian_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tready : in STD_LOGIC;
    m_axis_dout_tlast : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component InternalCell_cordic_0_0;
  signal Feedback_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Feedback_0_m_axis_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Feedback_0_m_axis_TVALID : STD_LOGIC;
  signal LastCellValue_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal LastCellValue_0_m_axis_TREADY : STD_LOGIC;
  signal LastCellValue_0_m_axis_TVALID : STD_LOGIC;
  signal S01_AXIS_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S01_AXIS_1_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXIS_1_TREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal S01_AXIS_1_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal axis_broadcaster_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_0_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M00_AXIS_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_0_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_0_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_0_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_0_M02_AXIS_TDATA : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal axis_broadcaster_0_M02_AXIS_TLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_broadcaster_0_M02_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_0_M02_AXIS_TVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal axis_combiner_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_combiner_0_M_AXIS_TLAST : STD_LOGIC;
  signal axis_combiner_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_combiner_0_M_AXIS_TVALID : STD_LOGIC;
  signal axis_register_slice_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_register_slice_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_register_slice_0_M_AXIS_TVALID : STD_LOGIC;
  signal cordic_0_M_AXIS_DOUT_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cordic_0_M_AXIS_DOUT_TLAST : STD_LOGIC;
  signal cordic_0_M_AXIS_DOUT_TREADY : STD_LOGIC;
  signal cordic_0_M_AXIS_DOUT_TVALID : STD_LOGIC;
  signal s_axis_phase_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_axis_phase_1_TLAST : STD_LOGIC;
  signal s_axis_phase_1_TREADY : STD_LOGIC;
  signal s_axis_phase_1_TVALID : STD_LOGIC;
begin
  S01_AXIS_1_TDATA(15 downto 0) <= s_axis_tdata(15 downto 0);
  S01_AXIS_1_TLAST(0) <= s_axis_tlast(0);
  S01_AXIS_1_TVALID(0) <= s_axis_tvalid(0);
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  axis_broadcaster_0_M00_AXIS_TREADY(0) <= m_axis_tready(0);
  axis_register_slice_0_M_AXIS_TREADY <= m_axis_result_tready;
  m_axis_result_tdata(15 downto 0) <= axis_register_slice_0_M_AXIS_TDATA(15 downto 0);
  m_axis_result_tvalid <= axis_register_slice_0_M_AXIS_TVALID;
  m_axis_tdata(15 downto 0) <= axis_broadcaster_0_M00_AXIS_TDATA(15 downto 0);
  m_axis_tlast(0) <= axis_broadcaster_0_M00_AXIS_TLAST(0);
  m_axis_tvalid(0) <= axis_broadcaster_0_M00_AXIS_TVALID(0);
  s_axis_phase_1_TDATA(15 downto 0) <= s_axis_phase_tdata(15 downto 0);
  s_axis_phase_1_TLAST <= s_axis_phase_tlast;
  s_axis_phase_1_TVALID <= s_axis_phase_tvalid;
  s_axis_phase_tready <= s_axis_phase_1_TREADY;
  s_axis_tready(0) <= S01_AXIS_1_TREADY(1);
Feedback_0: component InternalCell_Feedback_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => Feedback_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => Feedback_0_m_axis_TREADY(0),
      m_axis_tvalid => Feedback_0_m_axis_TVALID,
      s_axis_tdata(15 downto 0) => axis_broadcaster_0_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_0_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_0_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_0_M01_AXIS_TVALID(1)
    );
LastCellValue_0: component InternalCell_LastCellValue_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => LastCellValue_0_m_axis_TDATA(15 downto 0),
      m_axis_tready => LastCellValue_0_m_axis_TREADY,
      m_axis_tvalid => LastCellValue_0_m_axis_TVALID,
      s_axis_tdata(15 downto 0) => axis_broadcaster_0_M02_AXIS_TDATA(47 downto 32),
      s_axis_tlast => axis_broadcaster_0_M02_AXIS_TLAST(2),
      s_axis_tready => axis_broadcaster_0_M02_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_0_M02_AXIS_TVALID(2)
    );
axis_broadcaster_0: component InternalCell_axis_broadcaster_0_0
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
      m_axis_tready(0) => axis_broadcaster_0_M00_AXIS_TREADY(0),
      m_axis_tvalid(2) => axis_broadcaster_0_M02_AXIS_TVALID(2),
      m_axis_tvalid(1) => axis_broadcaster_0_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_0_M00_AXIS_TVALID(0),
      s_axis_tdata(31 downto 0) => cordic_0_M_AXIS_DOUT_TDATA(31 downto 0),
      s_axis_tlast => cordic_0_M_AXIS_DOUT_TLAST,
      s_axis_tready => cordic_0_M_AXIS_DOUT_TREADY,
      s_axis_tvalid => cordic_0_M_AXIS_DOUT_TVALID
    );
axis_combiner_0: component InternalCell_axis_combiner_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(31 downto 0) => axis_combiner_0_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_combiner_0_M_AXIS_TLAST,
      m_axis_tready => axis_combiner_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_combiner_0_M_AXIS_TVALID,
      s_axis_tdata(31 downto 16) => S01_AXIS_1_TDATA(15 downto 0),
      s_axis_tdata(15 downto 0) => Feedback_0_m_axis_TDATA(15 downto 0),
      s_axis_tlast(1) => S01_AXIS_1_TLAST(0),
      s_axis_tlast(0) => '1',
      s_axis_tready(1) => S01_AXIS_1_TREADY(1),
      s_axis_tready(0) => Feedback_0_m_axis_TREADY(0),
      s_axis_tvalid(1) => S01_AXIS_1_TVALID(0),
      s_axis_tvalid(0) => Feedback_0_m_axis_TVALID
    );
axis_register_slice_0: component InternalCell_axis_register_slice_0_0
     port map (
      aclk => aclk_1,
      aresetn => aresetn_1,
      m_axis_tdata(15 downto 0) => axis_register_slice_0_M_AXIS_TDATA(15 downto 0),
      m_axis_tready => axis_register_slice_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_register_slice_0_M_AXIS_TVALID,
      s_axis_tdata(15 downto 0) => LastCellValue_0_m_axis_TDATA(15 downto 0),
      s_axis_tready => LastCellValue_0_m_axis_TREADY,
      s_axis_tvalid => LastCellValue_0_m_axis_TVALID
    );
cordic_0: component InternalCell_cordic_0_0
     port map (
      aclk => aclk_1,
      m_axis_dout_tdata(31 downto 0) => cordic_0_M_AXIS_DOUT_TDATA(31 downto 0),
      m_axis_dout_tlast => cordic_0_M_AXIS_DOUT_TLAST,
      m_axis_dout_tready => cordic_0_M_AXIS_DOUT_TREADY,
      m_axis_dout_tvalid => cordic_0_M_AXIS_DOUT_TVALID,
      s_axis_cartesian_tdata(31 downto 0) => axis_combiner_0_M_AXIS_TDATA(31 downto 0),
      s_axis_cartesian_tlast => axis_combiner_0_M_AXIS_TLAST,
      s_axis_cartesian_tready => axis_combiner_0_M_AXIS_TREADY,
      s_axis_cartesian_tvalid => axis_combiner_0_M_AXIS_TVALID,
      s_axis_phase_tdata(15 downto 0) => s_axis_phase_1_TDATA(15 downto 0),
      s_axis_phase_tlast => s_axis_phase_1_TLAST,
      s_axis_phase_tready => s_axis_phase_1_TREADY,
      s_axis_phase_tvalid => s_axis_phase_1_TVALID
    );
end STRUCTURE;
