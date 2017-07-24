----------------------------------------------------------------------------------
-- 通すデータ数をNDATA個に制限する。
-- それ以降はデータは入力されるが出力はされない。
-- tlastがアサートされたデータが入力されると初期状態にリセットされ、再度
-- 次のデータからNDATA個のデータを通す。
--
-- NMAXには最初のデータからtlastがアサートされたデータまでの最大個数を
-- 指定する。この値は内部のカウンタのビット数を決めるためで、大きすぎても
-- 使用リソース数が多くなる以外は問題ない。
-- 逆に少なすぎるとカウンタがオーバーフローし、正常に動作しない。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity LimitNumData is
  generic (
    NBITS : natural := 16;
    NDATA : natural := 1;
    NMAX : natural := 2
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- データ入力
    s_axis_tvalid : in std_logic;
    s_axis_tready : out std_logic;
    s_axis_tlast : in std_logic;
    s_axis_tdata : in std_logic_vector(NBITS-1 downto 0);

    -- データ出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end LimitNumData;

architecture Behavioral of LimitNumData is
  -- 定数
  constant DELAY : time := 1ns; -- シミュレーション時出力を遅延させる
  
  -- カウンタ
  signal count : natural range 0 to NMAX-1 := 0;
  signal out_en : std_logic;

  -- 出力との接続
  signal i_s_axis_tready : std_logic;
  signal i_m_axis_tvalid : std_logic;
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);
begin
  process (aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        count <= 0;
      else
        if (s_axis_tvalid = '1' and i_s_axis_tready = '1') then
          if (s_axis_tlast = '0') then
            count <= count + 1;
          else
            -- tlast でリセットする
            count <= 0;
          end if;
        end if;
      end if;
    end if;
  end process;

  out_en <= '1' when count < NDATA else '0';

  i_m_axis_tvalid <= s_axis_tvalid and out_en;
  i_m_axis_tdata <= s_axis_tdata;
  i_s_axis_tready <= m_axis_tready or (not out_en);

  -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
