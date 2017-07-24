library ieee;
use ieee.std_logic_1164.all;

entity tb_BackSubtraction3 is
end tb_BackSubtraction3;

architecture SIM of tb_BackSubtraction3 is
  component BackSubtraction3_wrapper
    port (
      aclk : in std_logic;
      aresetn : in std_logic;
      
      s_axis_r11_tdata : in std_logic_vector(15 downto 0);
      s_axis_r11_tready : out std_logic;
      s_axis_r11_tvalid : in std_logic;
      s_axis_r12_tdata : in std_logic_vector(15 downto 0);
      s_axis_r12_tready : out std_logic;
      s_axis_r12_tvalid : in std_logic;
      s_axis_r13_tdata : in std_logic_vector(15 downto 0);
      s_axis_r13_tready : out std_logic;
      s_axis_r13_tvalid : in std_logic;
      s_axis_r22_tdata : in std_logic_vector(15 downto 0);
      s_axis_r22_tready : out std_logic;
      s_axis_r22_tvalid : in std_logic;
      s_axis_r23_tdata : in std_logic_vector(15 downto 0);
      s_axis_r23_tready : out std_logic;
      s_axis_r23_tvalid : in std_logic;
      s_axis_r33_tdata : in std_logic_vector(15 downto 0);
      s_axis_r33_tready : out std_logic;
      s_axis_r33_tvalid : in std_logic;

      s_axis_y1_tdata : in std_logic_vector(15 downto 0);
      s_axis_y1_tready : out std_logic;
      s_axis_y1_tvalid : in std_logic;
      s_axis_y2_tdata : in std_logic_vector(15 downto 0);
      s_axis_y2_tready : out std_logic;
      s_axis_y2_tvalid : in std_logic;
      s_axis_y3_tdata : in std_logic_vector(15 downto 0);
      s_axis_y3_tready : out std_logic;
      s_axis_y3_tvalid : in std_logic;

      m_axis_result_tdata : out std_logic_vector(15 downto 0);
      m_axis_result_tlast : out std_logic_vector(0 to 0);
      m_axis_result_tready : in std_logic_vector(0 to 0);
      m_axis_result_tvalid : out std_logic_vector(0 to 0)
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

  signal s_axis_r11_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r11_tready : std_logic;
  signal s_axis_r11_tvalid : std_logic;
  signal s_axis_r12_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r12_tready : std_logic;
  signal s_axis_r12_tvalid : std_logic;
  signal s_axis_r13_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r13_tready : std_logic;
  signal s_axis_r13_tvalid : std_logic;
  signal s_axis_r22_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r22_tready : std_logic;
  signal s_axis_r22_tvalid : std_logic;
  signal s_axis_r23_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r23_tready : std_logic;
  signal s_axis_r23_tvalid : std_logic;
  signal s_axis_r33_tdata : std_logic_vector(15 downto 0);
  signal s_axis_r33_tready : std_logic;
  signal s_axis_r33_tvalid : std_logic;

  signal s_axis_y1_tdata : std_logic_vector(15 downto 0);
  signal s_axis_y1_tready : std_logic;
  signal s_axis_y1_tvalid : std_logic;
  signal s_axis_y2_tdata : std_logic_vector(15 downto 0);
  signal s_axis_y2_tready : std_logic;
  signal s_axis_y2_tvalid : std_logic;
  signal s_axis_y3_tdata : std_logic_vector(15 downto 0);
  signal s_axis_y3_tready : std_logic;
  signal s_axis_y3_tvalid : std_logic;

  signal m_axis_result_tdata : std_logic_vector(15 downto 0);
  signal m_axis_result_tlast : std_logic;
  signal m_axis_result_tready : std_logic;
  signal m_axis_result_tvalid : std_logic;

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

  UBackSubtraction3_wrapper : BackSubtraction3_wrapper
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_r11_tdata => s_axis_r11_tdata,
      s_axis_r11_tready => s_axis_r11_tready,
      s_axis_r11_tvalid => s_axis_r11_tvalid,
      s_axis_r12_tdata => s_axis_r12_tdata,
      s_axis_r12_tready => s_axis_r12_tready,
      s_axis_r12_tvalid => s_axis_r12_tvalid,
      s_axis_r13_tdata => s_axis_r13_tdata,
      s_axis_r13_tready => s_axis_r13_tready,
      s_axis_r13_tvalid => s_axis_r13_tvalid,
      s_axis_r22_tdata => s_axis_r22_tdata,
      s_axis_r22_tready => s_axis_r22_tready,
      s_axis_r22_tvalid => s_axis_r22_tvalid,
      s_axis_r23_tdata => s_axis_r23_tdata,
      s_axis_r23_tready => s_axis_r23_tready,
      s_axis_r23_tvalid => s_axis_r23_tvalid,
      s_axis_r33_tdata => s_axis_r33_tdata,
      s_axis_r33_tready => s_axis_r33_tready,
      s_axis_r33_tvalid => s_axis_r33_tvalid,
      s_axis_y1_tdata => s_axis_y1_tdata,
      s_axis_y1_tready => s_axis_y1_tready,
      s_axis_y1_tvalid => s_axis_y1_tvalid,
      s_axis_y2_tdata => s_axis_y2_tdata,
      s_axis_y2_tready => s_axis_y2_tready,
      s_axis_y2_tvalid => s_axis_y2_tvalid,
      s_axis_y3_tdata => s_axis_y3_tdata,
      s_axis_y3_tready => s_axis_y3_tready,
      s_axis_y3_tvalid => s_axis_y3_tvalid,
      m_axis_result_tdata => m_axis_result_tdata,
      m_axis_result_tlast(0) => m_axis_result_tlast,
      m_axis_result_tready(0) => m_axis_result_tready,
      m_axis_result_tvalid(0) => m_axis_result_tvalid
      );

  UAXISSimMaster0 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r11.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r11_tvalid,
      m_axis_tready => s_axis_r11_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r11_tdata,
      done => done);

  UAXISSimMaster1 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r12.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r12_tvalid,
      m_axis_tready => s_axis_r12_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r12_tdata,
      done => open);

  UAXISSimMaster2 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r13.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r13_tvalid,
      m_axis_tready => s_axis_r13_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r13_tdata,
      done => open);

  UAXISSimMaster3 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r22.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r22_tvalid,
      m_axis_tready => s_axis_r22_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r22_tdata,
      done => open);

  UAXISSimMaster4 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r23.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r23_tvalid,
      m_axis_tready => s_axis_r23_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r23_tdata,
      done => open);

  UAXISSimMaster5 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "r33.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_r33_tvalid,
      m_axis_tready => s_axis_r33_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_r33_tdata,
      done => open);

  UAXISSimMaster6 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "y1.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_y1_tvalid,
      m_axis_tready => s_axis_y1_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_y1_tdata,
      done => open);

  UAXISSimMaster7 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "y2.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_y2_tvalid,
      m_axis_tready => s_axis_y2_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_y2_tdata,
      done => open);

  UAXISSimMaster8 : AXISSimMaster
    generic map (
      NBITS => 16,
      PACKET_LEN => 4,
      FNAME => "y3.txt",
      PATTERN => 'r',
      PERIOD => 1
      )
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tvalid => s_axis_y3_tvalid,
      m_axis_tready => s_axis_y3_tready,
      m_axis_tlast => open,
      m_axis_tdata => s_axis_y3_tdata,
      done => open);

  UAXISSimSlave : AXISSimSlave
    generic map (
      NBITS => 16,
      FNAME => "result.txt",
      PATTERN => 'r',
      PERIOD => 1)
    port map (
      aclk => aclk,
      aresetn => aresetn,
      s_axis_tvalid => m_axis_result_tvalid,
      s_axis_tready => m_axis_result_tready,
      s_axis_tlast => m_axis_result_tlast,
      s_axis_tdata => m_axis_result_tdata);
end SIM;
