library ieee;
use ieee.std_logic_1164.all;

entity tb_MultiplySubtractor is
end tb_MultiplySubtractor;

architecture SIM of tb_MultiplySubtractor is
  constant NBITS : natural := 16;
  constant NBITS_FRACTION : natural := 8;
  
  component MultiplySubtractor
    generic (
      NBITS : natural := 16;
      NBITS_FRACTION : natural := 8
      );
    port (
      aclk : in std_logic;
      aresetn : in std_logic;

      -- データ入力
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tready : out std_logic;
      s_axis_a_tdata : in std_logic_vector(NBITS-1 downto 0);

      s_axis_b_tvalid : in std_logic;
      s_axis_b_tready : out std_logic;
      s_axis_b_tdata : in std_logic_vector(NBITS-1 downto 0);

      s_axis_c_tvalid : in std_logic;
      s_axis_c_tready : out std_logic;
      s_axis_c_tlast : in std_logic;
      s_axis_c_tdata : in std_logic_vector(NBITS-1 downto 0);
      
      -- データ出力
      m_axis_tvalid : out std_logic;
      m_axis_tready : in std_logic;
      m_axis_tlast : out std_logic;
      m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
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

  signal s_axis_a_tvalid : std_logic;
  signal s_axis_a_tready : std_logic;
  signal s_axis_a_tdata : std_logic_vector(NBITS-1 downto 0);

  signal s_axis_b_tvalid : std_logic;
  signal s_axis_b_tready : std_logic;
  signal s_axis_b_tdata : std_logic_vector(NBITS-1 downto 0);

  signal s_axis_c_tvalid : std_logic;
  signal s_axis_c_tready : std_logic;
  signal s_axis_c_tlast : std_logic;
  signal s_axis_c_tdata : std_logic_vector(NBITS-1 downto 0);
  
  signal m_axis_tvalid : std_logic;
  signal m_axis_tready : std_logic;
  signal m_axis_tlast : std_logic;
  signal m_axis_tdata : std_logic_vector(NBITS-1 downto 0);

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
    wait_clock(2); -- divider requires reset at least 2 clock cycles
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

  UMultiplySubtractor : MultiplySubtractor
    generic map (
      NBITS => NBITS,
      NBITS_FRACTION => NBITS_FRACTION
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_a_tvalid => s_axis_a_tvalid,
      s_axis_a_tready => s_axis_a_tready,
      s_axis_a_tdata => s_axis_a_tdata,
      s_axis_b_tvalid => s_axis_b_tvalid,
      s_axis_b_tready => s_axis_b_tready,
      s_axis_b_tdata => s_axis_b_tdata,
      s_axis_c_tvalid => s_axis_c_tvalid,
      s_axis_c_tready => s_axis_c_tready,
      s_axis_c_tlast => s_axis_c_tlast,
      s_axis_c_tdata => s_axis_c_tdata,
      m_axis_tvalid => m_axis_tvalid,
      m_axis_tready => m_axis_tready,
      m_axis_tlast => m_axis_tlast,
      m_axis_tdata => m_axis_tdata);

  UAXISSimMaster0 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "a.txt",
      PATTERN => 'r',
      PERIOD => 3
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_a_tvalid,
      m_axis_tready => s_axis_a_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_a_tdata,
      done => done);

  UAXISSimMaster1 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "b.txt",
      PATTERN => 'r',
      PERIOD => 5,
      INIT_RAND => "1000000"
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_b_tvalid,
      m_axis_tready => s_axis_b_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_b_tdata,
      done => open);

  UAXISSimMaster2 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "c.txt",
      PATTERN => 'r',
      PERIOD => 7,
      INIT_RAND => "0100000"
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_c_tvalid,
      m_axis_tready => s_axis_c_tready,
      m_axis_tlast => s_axis_c_tlast,
      m_axis_tdata => s_axis_c_tdata,
      done => open);

  UAXISSimSlave0 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "result.txt",
      PATTERN => 'r',
      PERIOD => 11)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_tvalid,
      s_axis_tready => m_axis_tready,
      s_axis_tlast => m_axis_tlast,
      s_axis_tdata => m_axis_tdata);
end SIM;
