library ieee;
use ieee.std_logic_1164.all;

entity tb_MulSubCell is
end tb_MulSubCell;

architecture SIM of tb_MulSubCell is
  component MulSubCell_wrapper
    port (
      aclk : in std_logic;
      aresetn : in std_logic;

      s_axis_x_tdata : in std_logic_vector(15 downto 0);
      s_axis_x_tready : out std_logic;
      s_axis_x_tvalid : in std_logic;

      s_axis_r_tdata : in std_logic_vector(15 downto 0);
      s_axis_r_tready : out std_logic;
      s_axis_r_tvalid : in std_logic;

      s_axis_y_tdata : in std_logic_vector(15 downto 0);
      s_axis_y_tready : out std_logic;
      s_axis_y_tvalid : in std_logic;

      s_axis_from_right_tdata : in std_logic_vector(15 downto 0);
      s_axis_from_right_tlast : in std_logic;
      s_axis_from_right_tready : out std_logic;
      s_axis_from_right_tvalid : in std_logic;

      m_axis_to_left_tdata : out std_logic_vector(15 downto 0);
      m_axis_to_left_tlast : out std_logic;
      m_axis_to_left_tready : in std_logic;
      m_axis_to_left_tvalid : out std_logic
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

  signal s_axis_x_tdata : std_logic_vector(15 downto 0);
  signal s_axis_x_tready : std_logic;
  signal s_axis_x_tvalid : std_logic;

  signal s_axis_r_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r_tready : std_logic;
  signal s_axis_r_tvalid : std_logic;

  signal s_axis_y_tdata : std_logic_vector(15 downto 0);
  signal s_axis_y_tready : std_logic;
  signal s_axis_y_tvalid : std_logic;

  signal s_axis_from_right_tdata : std_logic_vector(15 downto 0);
  signal s_axis_from_right_tlast : std_logic;
  signal s_axis_from_right_tready : std_logic;
  signal s_axis_from_right_tvalid : std_logic;

  signal m_axis_to_left_tdata : std_logic_vector(15 downto 0);
  signal m_axis_to_left_tlast : std_logic;
  signal m_axis_to_left_tready : std_logic;
  signal m_axis_to_left_tvalid : std_logic;

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
    wait for CYCLE * 60;
    -- 終了
    assert false
      severity failure;
  end process;

  UDivCell_wrapper : MulSubCell_wrapper
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_x_tdata => s_axis_x_tdata,
      s_axis_x_tready => s_axis_x_tready,
      s_axis_x_tvalid => s_axis_x_tvalid,
      s_axis_r_tdata => s_axis_r_tdata,
      s_axis_r_tready => s_axis_r_tready,
      s_axis_r_tvalid => s_axis_r_tvalid,
      s_axis_y_tdata => s_axis_y_tdata,
      s_axis_y_tready => s_axis_y_tready,
      s_axis_y_tvalid => s_axis_y_tvalid,
      s_axis_from_right_tdata => s_axis_from_right_tdata,
      s_axis_from_right_tlast => s_axis_from_right_tlast,
      s_axis_from_right_tready => s_axis_from_right_tready,
      s_axis_from_right_tvalid => s_axis_from_right_tvalid,
      m_axis_to_left_tdata => m_axis_to_left_tdata,
      m_axis_to_left_tlast => m_axis_to_left_tlast,
      m_axis_to_left_tready => m_axis_to_left_tready,
      m_axis_to_left_tvalid => m_axis_to_left_tvalid);

  UAXISSimMaster0 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "x.txt",
      PATTERN => 'r',
      PERIOD => 11)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_x_tvalid,
      m_axis_tready => s_axis_x_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_x_tdata,
      done => done);

  UAXISSimMaster1 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r.txt",
      PATTERN => 'r',
      INIT_RAND => "1000000",
      PERIOD => 7)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r_tvalid,
      m_axis_tready => s_axis_r_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r_tdata,
      done => open);

  UAXISSimMaster2 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "y.txt",
      PATTERN => 'r',
      INIT_RAND => "0100000",
      PERIOD => 5)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_y_tvalid,
      m_axis_tready => s_axis_y_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_y_tdata,
      done => open);

  UAXISSimMaster3 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 3,
      FNAME => "from_right.txt",
      PATTERN => 'r',
      INIT_RAND => "0010000",
      PERIOD => 3)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_from_right_tvalid,
      m_axis_tready => s_axis_from_right_tready,
      m_axis_tlast => s_axis_from_right_tlast,
      m_axis_tdata => s_axis_from_right_tdata,
      done => open);

  UAXISSimSlave : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "to_left.txt",
      PATTERN => 'r',
      PERIOD => 2)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_to_left_tvalid,
      s_axis_tready => m_axis_to_left_tready,
      s_axis_tlast => m_axis_to_left_tlast,
      s_axis_tdata => m_axis_to_left_tdata);
end SIM;
