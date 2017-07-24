library ieee;
use ieee.std_logic_1164.all;

entity tb_StreamToColumns3 is
end tb_StreamToColumns3;

architecture SIM of tb_StreamToColumns3 is
  constant NBITS : natural := 16;
  constant NBITS_FRACTION : natural := 8;
  
  component StreamToColumns3
    generic (
      NBITS : natural := 16;
      NBITS_FRACTION : natural := 8
      );
    port (
      aclk : in std_logic;
      aresetn : in std_logic;

      s_axis_tvalid : in std_logic;
      s_axis_tready : out std_logic;
      s_axis_tdata : in std_logic_vector(NBITS-1 downto 0);

      m_axis_c1_tvalid : out std_logic;
      m_axis_c1_tready : in std_logic;
      m_axis_c1_tlast : out std_logic;
      m_axis_c1_tdata : out std_logic_vector(NBITS-1 downto 0);
      
      m_axis_c2_tvalid : out std_logic;
      m_axis_c2_tready : in std_logic;
      m_axis_c2_tlast : out std_logic;
      m_axis_c2_tdata : out std_logic_vector(NBITS-1 downto 0);
      
      m_axis_c3_tvalid : out std_logic;
      m_axis_c3_tready : in std_logic;
      m_axis_c3_tlast : out std_logic;
      m_axis_c3_tdata : out std_logic_vector(NBITS-1 downto 0);
      
      m_axis_c4_tvalid : out std_logic;
      m_axis_c4_tready : in std_logic;
      m_axis_c4_tlast : out std_logic;
      m_axis_c4_tdata : out std_logic_vector(NBITS-1 downto 0);
      
      m_axis_c5_tvalid : out std_logic;
      m_axis_c5_tready : in std_logic;
      m_axis_c5_tlast : out std_logic;
      m_axis_c5_tdata : out std_logic_vector(NBITS-1 downto 0);
      
      m_axis_c6_tvalid : out std_logic;
      m_axis_c6_tready : in std_logic;
      m_axis_c6_tlast : out std_logic;
      m_axis_c6_tdata : out std_logic_vector(NBITS-1 downto 0)
      );
  end component;

  component AXISSimMaster
    generic (
      NBITS : natural := 16;
      PACKET_LEN : natural := 4;
      FNAME : string := "input.txt";
      PATTERN : character := 'p'; -- 'p':periodic, 'r':random
      PERIOD : positive := 4;
      INIT_RAND : std_logic_vector(7 downto 1) := "1010011";
      DELAY : time := 1 ns
      );
    port (
      aclk : in std_logic;
      aresetn : in std_logic;
      m_axis_tvalid : out std_logic;
      m_axis_tready : in std_logic;
      m_axis_tlast : out std_logic;
      m_axis_tdata : out std_logic_vector(NBITS-1 downto 0);
      done : out boolean := false
      );
  end component;

  component AXISSimSlave
    generic (
      NBITS : natural := 16;
      FNAME : string := "output.txt";
      PATTERN : character := 'p';
      PERIOD : positive := 4;
      INIT_RAND : std_logic_vector(7 downto 1) := "0101100";
      DELAY : time := 1ns
      );
    port (
      aclk : in std_logic;
      aresetn : in std_logic;
      s_axis_tvalid : in std_logic;
      s_axis_tready : out std_logic;
      s_axis_tlast : in std_logic;
      s_axis_tdata : in std_logic_vector(NBITS-1 downto 0)
      );
  end component;


  constant CYCLE : time := 10 ns; -- 100MHz
  constant HALF_CYCLE : time := 5 ns;
  constant DELAY : time := 1ns;

  signal aclk : std_logic;
  signal aresetn : std_logic;

  signal s_axis_tvalid : std_logic;
  signal s_axis_tready : std_logic;
  signal s_axis_tdata : std_logic_vector(NBITS-1 downto 0);

  signal m_axis_c1_tvalid : std_logic;
  signal m_axis_c1_tready : std_logic;
  signal m_axis_c1_tlast : std_logic;
  signal m_axis_c1_tdata : std_logic_vector(NBITS-1 downto 0);

  signal m_axis_c2_tvalid : std_logic;
  signal m_axis_c2_tready : std_logic;
  signal m_axis_c2_tlast : std_logic;
  signal m_axis_c2_tdata : std_logic_vector(NBITS-1 downto 0);

  signal m_axis_c3_tvalid : std_logic;
  signal m_axis_c3_tready : std_logic;
  signal m_axis_c3_tlast : std_logic;
  signal m_axis_c3_tdata : std_logic_vector(NBITS-1 downto 0);

  signal m_axis_c4_tvalid : std_logic;
  signal m_axis_c4_tready : std_logic;
  signal m_axis_c4_tlast : std_logic;
  signal m_axis_c4_tdata : std_logic_vector(NBITS-1 downto 0);

  signal m_axis_c5_tvalid : std_logic;
  signal m_axis_c5_tready : std_logic;
  signal m_axis_c5_tlast : std_logic;
  signal m_axis_c5_tdata : std_logic_vector(NBITS-1 downto 0);

  signal m_axis_c6_tvalid : std_logic;
  signal m_axis_c6_tready : std_logic;
  signal m_axis_c6_tlast : std_logic;
  signal m_axis_c6_tdata : std_logic_vector(NBITS-1 downto 0);

  signal done : boolean;
  
  -- クロックの立ち上がりエッジを待つ
  procedure wait_clock(constant count: in natural:=1) is
  begin
    for i in 1 to count loop
      wait until rising_edge(aclk);
    end loop;
  end procedure;
begin
  -- クロック作成
  process
  begin
    aclk <= '1'; wait for HALF_CYCLE;
    aclk <= '0'; wait for HALF_CYCLE;
  end process;

  -- リセット作成
  process
  begin
    aresetn <= '0';
    wait for DELAY;
    wait_clock(1);
    wait for DELAY;
    aresetn <= '1';
    wait;
  end process;

  -- シミュレーション停止用
  process
  begin
    wait until done;
    wait for CYCLE * 30;
    -- 終了
    assert false
      severity failure;
  end process;

  UStreamToColumns3 : StreamToColumns3
    generic map (
      NBITS => NBITS,
      NBITS_FRACTION => NBITS_FRACTION
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => s_axis_tvalid,
      s_axis_tready => s_axis_tready,
      s_axis_tdata => s_axis_tdata,
      m_axis_c1_tvalid => m_axis_c1_tvalid,
      m_axis_c1_tready => m_axis_c1_tready,
      m_axis_c1_tlast => m_axis_c1_tlast,
      m_axis_c1_tdata => m_axis_c1_tdata,
      m_axis_c2_tvalid => m_axis_c2_tvalid,
      m_axis_c2_tready => m_axis_c2_tready,
      m_axis_c2_tlast => m_axis_c2_tlast,
      m_axis_c2_tdata => m_axis_c2_tdata,
      m_axis_c3_tvalid => m_axis_c3_tvalid,
      m_axis_c3_tready => m_axis_c3_tready,
      m_axis_c3_tlast => m_axis_c3_tlast,
      m_axis_c3_tdata => m_axis_c3_tdata,
      m_axis_c4_tvalid => m_axis_c4_tvalid,
      m_axis_c4_tready => m_axis_c4_tready,
      m_axis_c4_tlast => m_axis_c4_tlast,
      m_axis_c4_tdata => m_axis_c4_tdata,
      m_axis_c5_tvalid => m_axis_c5_tvalid,
      m_axis_c5_tready => m_axis_c5_tready,
      m_axis_c5_tlast => m_axis_c5_tlast,
      m_axis_c5_tdata => m_axis_c5_tdata,
      m_axis_c6_tvalid => m_axis_c6_tvalid,
      m_axis_c6_tready => m_axis_c6_tready,
      m_axis_c6_tlast => m_axis_c6_tlast,
      m_axis_c6_tdata => m_axis_c6_tdata
      );

  UAXISSimMaster : AXISSimMaster
    generic map (
      NBITS => NBITS,
      PACKET_LEN => 9,
      FNAME => "input.txt",
      PATTERN => 'r',
      PERIOD => 17)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_tvalid,
      m_axis_tready => s_axis_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_tdata,
      done => done);

  UAXISSimSlave1 : AXISSimSlave
    generic map (
      NBITS => NBITS,
      FNAME => "c1.txt",
      PATTERN => 'r',
      PERIOD => 13)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_c1_tvalid,
      s_axis_tready => m_axis_c1_tready,
      s_axis_tlast => m_axis_c1_tlast,
      s_axis_tdata => m_axis_c1_tdata);
  
  UAXISSimSlave2 : AXISSimSlave
    generic map (
      NBITS => NBITS,
      FNAME => "c2.txt",
      PATTERN => 'r',
      PERIOD => 11,
      INIT_RAND => "1000000")
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_c2_tvalid,
      s_axis_tready => m_axis_c2_tready,
      s_axis_tlast => m_axis_c2_tlast,
      s_axis_tdata => m_axis_c2_tdata);

  UAXISSimSlave3 : AXISSimSlave
    generic map (
      NBITS => NBITS,
      FNAME => "c3.txt",
      PATTERN => 'r',
      PERIOD => 7,
      INIT_RAND => "0100000")
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_c3_tvalid,
      s_axis_tready => m_axis_c3_tready,
      s_axis_tlast => m_axis_c3_tlast,
      s_axis_tdata => m_axis_c3_tdata);
  
  UAXISSimSlave4 : AXISSimSlave
    generic map (
      NBITS => NBITS,
      FNAME => "c4.txt",
      PATTERN => 'r',
      PERIOD => 5,
      INIT_RAND => "0010000")
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_c4_tvalid,
      s_axis_tready => m_axis_c4_tready,
      s_axis_tlast => m_axis_c4_tlast,
      s_axis_tdata => m_axis_c4_tdata);
  
  UAXISSimSlave5 : AXISSimSlave
    generic map (
      NBITS => NBITS,
      FNAME => "c5.txt",
      PATTERN => 'r',
      PERIOD => 3,
      INIT_RAND => "0001000")
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_c5_tvalid,
      s_axis_tready => m_axis_c5_tready,
      s_axis_tlast => m_axis_c5_tlast,
      s_axis_tdata => m_axis_c5_tdata);
  
  UAXISSimSlave6 : AXISSimSlave
    generic map (
      NBITS => NBITS,
      FNAME => "c6.txt",
      PATTERN => 'r',
      PERIOD => 2,
      INIT_RAND => "0000100")
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_c6_tvalid,
      s_axis_tready => m_axis_c6_tready,
      s_axis_tlast => m_axis_c6_tlast,
      s_axis_tdata => m_axis_c6_tdata);
end SIM;
