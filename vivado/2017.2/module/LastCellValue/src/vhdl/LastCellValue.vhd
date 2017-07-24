----------------------------------------------------------------------------------
-- QR分解の Boundary Cell, Internal Cell で使われている Cordic IP の出力から
-- 最終的な計算結果を取得するモジュール。
-- 最終的な計算結果かどうかを判断するのは tlast がアサートされているかどうかで
-- 判断する。
-- つまり tlast がアサートされているデータのみを通すフィルターである。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity LastCellValue is
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
end LastCellValue;

architecture RTL of LastCellValue is
  -- 定数
  constant DELAY : time := 1 ns; -- シミュレーション時出力を僅かに遅らせる。

  -- 出力との接続
  signal i_s_axis_tready : std_logic;
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);

begin
  -- tlast = '1' の信号のみ出力する。 '0'のものは捨てる。
  i_s_axis_tready <= m_axis_tready or (not s_axis_tlast);
  i_m_axis_tvalid <= s_axis_tvalid and s_axis_tlast;
  i_m_axis_tdata <= s_axis_tdata;
  
  -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end RTL;
