----------------------------------------------------------------------------------
-- 割り算器の出力を固定小数点形式に変換する。
-- 割り算器の出力のビット数に合わせてNBITS_Sを設定する。
-- 固定小数点のビット数はNBITS_Mで、小数部のビット数はNBITS_FRACで指定する。
-- デフォルトでは 16bit幅の固定小数点で、小数部は8bit、符号は1bit、整数部は7bit
-- となる。7Q8形式。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider2FixedPoint is
  generic (
    NBITS_S : natural := 32;
    NBITS_M : natural := 16;
    NBITS_FRAC : natural := 8 -- 固定小数点の小数部のビット数。入力はこれに1足したもの
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- データ入力
    s_axis_tvalid : in std_logic;
    s_axis_tready : out std_logic;
    s_axis_tlast : in std_logic;
    s_axis_tdata : in std_logic_vector(NBITS_S-1 downto 0);

    -- データ出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tdata : out std_logic_vector(NBITS_M-1 downto 0)
    );
end Divider2FixedPoint;

architecture Behavioral of Divider2FixedPoint is
  -- 定数
  constant DELAY : time := 1 ns; -- シミュレーション時出力を遅延する
  
  -- 出力との接続
  signal i_s_axis_tready : std_logic := '0';
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS_M-1 downto 0) := (others => '0');

  function convert(din : std_logic_vector(NBITS_S-1 downto 0))
    return std_logic_vector is
    variable quotient : signed(NBITS_M-1 downto 0) := (others => '0');
    variable fractional : signed(NBITS_M-1 downto 0);
    variable fixed_point : signed(NBITS_M-1 downto 0);
    variable sign_bit : std_logic;
  begin
    -- divider出力の商の部分を取り出す
    quotient(NBITS_M-1 downto NBITS_FRAC) := signed(din(NBITS_M downto NBITS_FRAC+1));
    -- divider出力の小数部の部分を取り出す
    fractional(NBITS_FRAC-1 downto 0) := signed(din(NBITS_FRAC-1 downto 0));
    sign_bit := din(NBITS_FRAC);
    -- sign bitを拡張する
    for i in NBITS_M-1 downto NBITS_FRAC loop
      fractional(i) := sign_bit;
    end loop;
    fixed_point := quotient + fractional;
    return std_logic_vector(fixed_point);
  end function;

begin
  i_s_axis_tready <= m_axis_tready;
  i_m_axis_tvalid <= s_axis_tvalid;
  i_m_axis_tdata <= convert(s_axis_tdata);
  i_m_axis_tlast <= s_axis_tlast;

  -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tlast <= i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
