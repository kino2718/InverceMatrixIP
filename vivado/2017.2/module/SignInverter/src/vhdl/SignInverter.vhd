----------------------------------------------------------------------------------
-- 入力データの値の符号を反転して出力する。
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SignInverter is
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

    -- データ出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end SignInverter;

architecture Behavioral of SignInverter is
  -- 出力のディレイ。シミュレーション用
  constant DELAY : time := 1 ns;
  
  -- データ保存
  signal saved_data : std_logic_vector(NBITS-1 downto 0) := (others => '0');
  signal saved_last : std_logic := '0';
  signal has_saved_data : std_logic := '0';

  -- 出力との接続
  signal i_s_axis_tready : std_logic := '0';
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0) := (others => '0');

  function invert_sign(din : std_logic_vector(NBITS-1 downto 0))
    return std_logic_vector is
    variable d : signed(NBITS-1 downto 0);
  begin
    -- signed に型を変換する    
    d := signed(din);
    -- 符号を反転する
    d := -d;
    return std_logic_vector(d);
  end function;
begin
  i_s_axis_tready <= m_axis_tready;
  i_m_axis_tvalid <= s_axis_tvalid and aresetn;
  i_m_axis_tlast <= s_axis_tlast;
  i_m_axis_tdata <= invert_sign(s_axis_tdata);
  
  -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tlast <= i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
