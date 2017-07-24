----------------------------------------------------------------------------------
-- 入力の先頭に初期値を1つ追加する。
-- 後は通常入力から読み続ける。
-- tlast がアサートされたデータが入力されると、次は再度初期を1つ読み込み、
-- 同じ動作を繰り返す。
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PrependInit is
  generic (
    NBITS : natural := 16
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- 初期値入力
    s_axis_init_tvalid : in std_logic;
    s_axis_init_tready : out std_logic;
    s_axis_init_tdata : in std_logic_vector(NBITS-1 downto 0);
    
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
end PrependInit;

architecture Behavioral of PrependInit is
  -- 定数
  constant DELAY : time := 1 ns; -- シミュレーション時出力を遅延する

  -- 状態
  signal init : boolean := true;

  -- 出力との接続
  signal i_s_axis_init_tready : std_logic := '0';
  signal i_s_axis_tready : std_logic := '0';
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);
begin
  i_s_axis_init_tready <= m_axis_tready when init else '0';
  i_s_axis_tready <= m_axis_tready when not init else '0';

  i_m_axis_tvalid <= s_axis_init_tvalid when init else s_axis_tvalid;
  i_m_axis_tdata <= s_axis_init_tdata when init else s_axis_tdata;
  i_m_axis_tlast <= '0' when init else s_axis_tlast;

  process(aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        init <= true;
      else
        if (i_m_axis_tvalid = '1' and m_axis_tready = '1') then
          if (i_m_axis_tlast = '0') then
            init <= false;
          else
            init <= true;
          end if;
        end if;
      end if;
    end if;
  end process;
  
  -- 出力との接続
  s_axis_init_tready <= i_s_axis_init_tready after DELAY;
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <=  i_m_axis_tvalid after DELAY;
  m_axis_tlast <=  i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
