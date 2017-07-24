library ieee;
use ieee.std_logic_1164.all;

entity tb_QRDecomp2 is
end tb_QRDecomp2;

architecture SIM of tb_QRDecomp2 is
  constant NBITS : natural := 16;
  
  component QRDecomp2_wrapper
    port (
      aclk : in std_logic;
      aresetn : in std_logic;

      s_axis_tvalid : in std_logic;
      s_axis_tready : out std_logic;
      s_axis_tdata : in std_logic_vector(15 downto 0);
      
      m_axis_r11_tvalid : out std_logic;
      m_axis_r11_tready : in std_logic;
      m_axis_r11_tdata : out std_logic_vector(15 downto 0);
      m_axis_r12_tvalid : out std_logic;
      m_axis_r12_tready : in std_logic;
      m_axis_r12_tdata : out std_logic_vector(15 downto 0);
      m_axis_r22_tvalid : out std_logic;
      m_axis_r22_tready : in std_logic;
      m_axis_r22_tdata : out std_logic_vector(15 downto 0);

      m_axis_qt11_tvalid : out std_logic;
      m_axis_qt11_tready : in std_logic;
      m_axis_qt11_tdata : out std_logic_vector(15 downto 0);
      m_axis_qt12_tvalid : out std_logic;
      m_axis_qt12_tready : in std_logic;
      m_axis_qt12_tdata : out std_logic_vector(15 downto 0);
      m_axis_qt21_tvalid : out std_logic;
      m_axis_qt21_tready : in std_logic;
      m_axis_qt21_tdata : out std_logic_vector(15 downto 0);
      m_axis_qt22_tvalid : out std_logic;
      m_axis_qt22_tready : in std_logic;
      m_axis_qt22_tdata : out std_logic_vector(15 downto 0)
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
  signal s_axis_tdata : std_logic_vector(15 downto 0);

  signal m_axis_r11_tdata : std_logic_vector(15 downto 0);
  signal m_axis_r11_tready : std_logic;
  signal m_axis_r11_tvalid : std_logic;
  signal m_axis_r12_tdata : std_logic_vector(15 downto 0);
  signal m_axis_r12_tready : std_logic;
  signal m_axis_r12_tvalid : std_logic;
  signal m_axis_r22_tdata : std_logic_vector(15 downto 0);
  signal m_axis_r22_tready : std_logic;
  signal m_axis_r22_tvalid : std_logic;
  signal m_axis_qt11_tvalid : std_logic;
  signal m_axis_qt11_tready : std_logic;
  signal m_axis_qt11_tdata : std_logic_vector(15 downto 0);
  signal m_axis_qt12_tvalid : std_logic;
  signal m_axis_qt12_tready : std_logic;
  signal m_axis_qt12_tdata : std_logic_vector(15 downto 0);
  signal m_axis_qt21_tvalid : std_logic;
  signal m_axis_qt21_tready : std_logic;
  signal m_axis_qt21_tdata : std_logic_vector(15 downto 0);
  signal m_axis_qt22_tvalid : std_logic;
  signal m_axis_qt22_tready : std_logic;
  signal m_axis_qt22_tdata : std_logic_vector(15 downto 0);
  
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

  UQRDecomp2_wrapper : QRDecomp2_wrapper
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tdata => s_axis_tdata,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid,
      m_axis_r11_tvalid => m_axis_r11_tvalid,
      m_axis_r11_tready => m_axis_r11_tready,
      m_axis_r11_tdata => m_axis_r11_tdata,
      m_axis_r12_tvalid => m_axis_r12_tvalid,
      m_axis_r12_tready => m_axis_r12_tready,
      m_axis_r12_tdata => m_axis_r12_tdata,
      m_axis_r22_tvalid => m_axis_r22_tvalid,
      m_axis_r22_tready => m_axis_r22_tready,
      m_axis_r22_tdata => m_axis_r22_tdata,
      m_axis_qt11_tvalid => m_axis_qt11_tvalid,
      m_axis_qt11_tready => m_axis_qt11_tready,
      m_axis_qt11_tdata => m_axis_qt11_tdata,
      m_axis_qt12_tvalid => m_axis_qt12_tvalid,
      m_axis_qt12_tready => m_axis_qt12_tready,
      m_axis_qt12_tdata => m_axis_qt12_tdata,
      m_axis_qt21_tvalid => m_axis_qt21_tvalid,
      m_axis_qt21_tready => m_axis_qt21_tready,
      m_axis_qt21_tdata => m_axis_qt21_tdata,
      m_axis_qt22_tvalid => m_axis_qt22_tvalid,
      m_axis_qt22_tready => m_axis_qt22_tready,
      m_axis_qt22_tdata => m_axis_qt22_tdata
      );

  UAXISSimMaster : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "input.txt",
      PATTERN => 'p',
      PERIOD => 17
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_tvalid,
      m_axis_tready => s_axis_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_tdata,
      done => done);

  UAXISSimSlave0 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "r11.txt",
      PATTERN => 'p',
      PERIOD => 13)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_r11_tvalid,
      s_axis_tready => m_axis_r11_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_r11_tdata);

  UAXISSimSlave1 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "r12.txt",
      PATTERN => 'p',
      PERIOD => 11)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_r12_tvalid,
      s_axis_tready => m_axis_r12_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_r12_tdata);

  UAXISSimSlave2 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "r22.txt",
      PATTERN => 'p',
      PERIOD => 7)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_r22_tvalid,
      s_axis_tready => m_axis_r22_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_r22_tdata);

  UAXISSimSlave3 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "qt11.txt",
      PATTERN => 'p',
      PERIOD => 5)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_qt11_tvalid,
      s_axis_tready => m_axis_qt11_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_qt11_tdata);

  UAXISSimSlave4 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "qt12.txt",
      PATTERN => 'p',
      PERIOD => 3)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_qt12_tvalid,
      s_axis_tready => m_axis_qt12_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_qt12_tdata);

  UAXISSimSlave5 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "qt21.txt",
      PATTERN => 'p',
      PERIOD => 2)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_qt21_tvalid,
      s_axis_tready => m_axis_qt21_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_qt21_tdata);

  UAXISSimSlave6 : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "qt22.txt",
      PATTERN => 'p',
      PERIOD => 1)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_qt22_tvalid,
      s_axis_tready => m_axis_qt22_tready,
      s_axis_tlast => '0',
      s_axis_tdata => m_axis_qt22_tdata);
end SIM;
