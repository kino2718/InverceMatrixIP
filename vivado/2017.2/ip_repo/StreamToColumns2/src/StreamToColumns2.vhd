----------------------------------------------------------------------------------
-- 行列の要素のストリームを各カラムに振り分ける。
-- ストリームは a11, a12, a21, a22 の順に来る。
-- QR分解モジュールに初期値として設定する単位行列は自動的に出力される。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity StreamToColumns2 is
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
    m_axis_c4_tdata : out std_logic_vector(NBITS-1 downto 0)  
    );
end StreamToColumns2;

architecture Behavioral of StreamToColumns2 is
  -- 定数
  constant ZERO : std_logic_vector(NBITS-1 downto 0) := (others => '0');
  constant ONE : std_logic_vector(NBITS-1 downto 0) := (NBITS_FRACTION => '1', others => '0');
  constant DELAY : time := 1 ns; -- シミュレーション時出力を遅らせる。
  constant PACKET_LEN : natural := 2;
  
  -- 状態
  type StatT is ( C1, C2, C3, C4);
  signal stat : StatT := C1;

  -- 信号
  signal i_s_axis_c1_tready : std_logic;
  signal i_s_axis_c2_tready : std_logic;
  signal i_s_axis_c3_tready : std_logic;
  signal i_s_axis_c4_tready : std_logic;

  -- 出力との接続
  signal i_s_axis_tready : std_logic := '0';

  signal i_m_axis_c1_tvalid : std_logic := '0';
  signal i_m_axis_c1_tlast : std_logic;
  signal i_m_axis_c1_tdata : std_logic_vector(NBITS-1 downto 0);

  signal i_m_axis_c2_tvalid : std_logic := '0';
  signal i_m_axis_c2_tlast : std_logic;
  signal i_m_axis_c2_tdata : std_logic_vector(NBITS-1 downto 0);

  signal i_m_axis_c3_tvalid : std_logic := '0';
  signal i_m_axis_c3_tlast : std_logic;
  signal i_m_axis_c3_tdata : std_logic_vector(NBITS-1 downto 0);

  signal i_m_axis_c4_tvalid : std_logic := '0';
  signal i_m_axis_c4_tlast : std_logic;
  signal i_m_axis_c4_tdata : std_logic_vector(NBITS-1 downto 0);

  -- procedure
  procedure set_tlast(
    variable counter : inout natural range 0 to 1;
    signal tlast : out std_logic) is
  begin
    if (counter = PACKET_LEN-1) then
      counter := 0;
      tlast <= '1';
    else
      counter := counter + 1;
      tlast <= '0';
    end if;
  end set_tlast;

begin
  process(aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        stat <= C1;
      else
        case stat is
          when C1 =>
            if (s_axis_tvalid = '1' and i_s_axis_c1_tready = '1') then
              -- データ入力完
              stat <= C2;
            end if;
          when C2 =>
            if (s_axis_tvalid = '1' and i_s_axis_c2_tready = '1') then
              -- データ入力完
              stat <= C3;
            end if;
          when C3 =>
            if (i_s_axis_c3_tready = '1') then
              -- データ入力完。固定データ出力のため入力の状態は関係ない。
              stat <= C4;
            end if;
          when C4 =>
            if (i_s_axis_c4_tready = '1') then
              -- データ入力完。固定データ出力のため入力の状態は関係ない。
              stat <= C1;
            end if;
          when others => null;
        end case;
      end if;
    end if;
  end process;

  -- カラム1の入出力
  process(aclk)
    variable cnt : natural range 0 to 1;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_c1_tvalid <= '0';
      else
        if (stat = C1 and i_s_axis_c1_tready = '1') then
          -- カラム1のデータ入力可能
          i_m_axis_c1_tvalid <= s_axis_tvalid;
          i_m_axis_c1_tdata <= s_axis_tdata;
          if (s_axis_tvalid = '1') then
            set_tlast(cnt, i_m_axis_c1_tlast);
          end if;
        elsif (i_m_axis_c1_tvalid = '1' and m_axis_c1_tready = '1') then
          -- データ受け渡し完
          i_m_axis_c1_tvalid <= '0';
        end if;
      end if;
    end if;
  end process;
  
  -- カラム2の入出力
  process(aclk)
    variable cnt : natural range 0 to 1;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_c2_tvalid <= '0';
      else
        if (stat = C2 and i_s_axis_c2_tready = '1') then
          -- カラム2のデータ入力可能
          i_m_axis_c2_tvalid <= s_axis_tvalid;
          i_m_axis_c2_tdata <= s_axis_tdata;
          if (s_axis_tvalid = '1') then
            set_tlast(cnt, i_m_axis_c2_tlast);
          end if;
        elsif (i_m_axis_c2_tvalid = '1' and m_axis_c2_tready = '1') then
          -- データ受け渡し完
          i_m_axis_c2_tvalid <= '0';
        end if;
      end if;
    end if;
  end process;
  
  -- カラム3の入出力
  process(aclk)
    variable cnt : natural range 0 to 1;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_c3_tvalid <= '0';
      else
        if (stat = C3 and i_s_axis_c3_tready = '1') then
          -- カラム3のデータ入力可能
          i_m_axis_c3_tvalid <= '1';
          if (cnt = 0) then
            i_m_axis_c3_tdata <= ONE;
          else
            i_m_axis_c3_tdata <= ZERO;
          end if;
          set_tlast(cnt, i_m_axis_c3_tlast);
        elsif (i_m_axis_c3_tvalid = '1' and m_axis_c3_tready = '1') then
          -- データ受け渡し完
          i_m_axis_c3_tvalid <= '0';
        end if;
      end if;
    end if;
  end process;
  
  -- カラム4の入出力
  process(aclk)
    variable cnt : natural range 0 to 1;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_c4_tvalid <= '0';
      else
        if (stat = C4 and i_s_axis_c4_tready = '1') then
          -- カラム4のデータ入力可能
          i_m_axis_c4_tvalid <= '1';
          if (cnt = 1) then
            i_m_axis_c4_tdata <= ONE;
          else
            i_m_axis_c4_tdata <= ZERO;
          end if;
          set_tlast(cnt, i_m_axis_c4_tlast);
        elsif (i_m_axis_c4_tvalid = '1' and m_axis_c4_tready = '1') then
          -- データ受け渡し完
          i_m_axis_c4_tvalid <= '0';
        end if;
      end if;
    end if;
  end process;
  
  -- カラム1,2,3,4を処理する状態での入力可能信号
  i_s_axis_c1_tready <= not i_m_axis_c1_tvalid or m_axis_c1_tready;
  i_s_axis_c2_tready <= not i_m_axis_c2_tvalid or m_axis_c2_tready;
  i_s_axis_c3_tready <= not i_m_axis_c3_tvalid or m_axis_c3_tready;
  i_s_axis_c4_tready <= not i_m_axis_c4_tvalid or m_axis_c4_tready;
  
  -- カラム1,2は入力データを受けて出力する
  -- カラム3,4は固定データを出力するため入力データは必要ない
  i_s_axis_tready <= i_s_axis_c1_tready when stat = C1 else
                     i_s_axis_c2_tready when stat = C2 else
                     '0';
  
    -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;

  m_axis_c1_tvalid <= i_m_axis_c1_tvalid after DELAY;
  m_axis_c1_tlast <= i_m_axis_c1_tlast after DELAY;
  m_axis_c1_tdata <= i_m_axis_c1_tdata after DELAY;

  m_axis_c2_tvalid <= i_m_axis_c2_tvalid after DELAY;
  m_axis_c2_tlast <= i_m_axis_c2_tlast after DELAY;
  m_axis_c2_tdata <= i_m_axis_c2_tdata after DELAY;

  m_axis_c3_tvalid <= i_m_axis_c3_tvalid after DELAY;
  m_axis_c3_tlast <= i_m_axis_c3_tlast after DELAY;
  m_axis_c3_tdata <= i_m_axis_c3_tdata after DELAY;

  m_axis_c4_tvalid <= i_m_axis_c4_tvalid after DELAY;
  m_axis_c4_tlast <= i_m_axis_c4_tlast after DELAY;
  m_axis_c4_tdata <= i_m_axis_c4_tdata after DELAY;
end Behavioral;
