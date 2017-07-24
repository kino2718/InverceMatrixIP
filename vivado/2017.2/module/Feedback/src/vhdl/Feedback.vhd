----------------------------------------------------------------------------------
-- QR分解の Boundary Cell, Internal Cell で使われている Cordic IP の出力を入力に
-- フィードバックするモジュール。
-- 最初のデータはまだ Cordic 出力が出ていないので予め用意する必要がある。
-- 初期値は INIT_VAL で指定する。
-- tlast がアサートされたデータが入力されると、1回の計算が終わったと判断し
-- そのデータは出力せず代わりに INIT_VAL 値を出力する。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Feedback is
  generic (
    NBITS : natural := 16
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- データ入力
    s_axis_tvalid : in std_logic;
    s_axis_tready : out std_logic;
    s_axis_tlast : in std_logic;
    s_axis_tdata : in std_logic_vector(NBITS-1 downto 0);

    -- フィードバック出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end Feedback;

architecture RTL of Feedback is
  -- 定数
  constant INIT_VAL : std_logic_vector(NBITS-1 downto 0) := (others => '0');
  constant DELAY : time := 1 ns; -- シミュレーション時出力を僅かに遅らせる。
  
  -- feedback出力の最初の初期値を出力したかを示す
  signal init_done : std_logic := '0';

  -- 出力との接続
  signal i_s_axis_tready : std_logic;
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);

begin
  process(aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        init_done <= '0';
      else
        if (init_done = '0') then
          if (m_axis_tready = '1') then
            -- 初期値を出力した
            init_done <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

  i_m_axis_tvalid <= (s_axis_tvalid or (not init_done)) and aresetn;
  i_m_axis_tdata <= s_axis_tdata when (init_done = '1' and s_axis_tlast = '0') else
                       INIT_VAL;
  i_s_axis_tready <= m_axis_tready and init_done;
  
  -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end RTL;
