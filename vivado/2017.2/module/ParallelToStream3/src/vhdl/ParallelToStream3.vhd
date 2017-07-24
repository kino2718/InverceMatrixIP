----------------------------------------------------------------------------------
-- s0, s1, s2の入力を順に読んで s0, s1, s2, s0, s1, s2, …
-- とストリームにして出力する。
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity ParallelToStream3 is
  generic (
    NBITS : natural := 16
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- 入力0
    s0_axis_tvalid : in std_logic;
    s0_axis_tready : out std_logic;
    s0_axis_tdata : in std_logic_vector(NBITS-1 downto 0);

    -- 入力1
    s1_axis_tvalid : in std_logic;
    s1_axis_tready : out std_logic;
    s1_axis_tdata : in std_logic_vector(NBITS-1 downto 0);

    -- 入力2
    s2_axis_tvalid : in std_logic;
    s2_axis_tready : out std_logic;
    s2_axis_tdata : in std_logic_vector(NBITS-1 downto 0);

    -- 出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end ParallelToStream3;

architecture Behavioral of ParallelToStream3 is
  -- 定数
  constant NINPUTS : natural := 3; -- 入力のポート数
  constant DELAY : time := 1 ns; -- シミュレーション時出力を遅延させる

  -- アクティブな入力ポート番号
  signal input_no : natural range 0 to NINPUTS-1 := 0;

  -- 出力との接続
  signal i_s0_axis_tready : std_logic := '0';
  signal i_s1_axis_tready : std_logic := '0';
  signal i_s2_axis_tready : std_logic := '0';
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);
begin
  -- 入力のtreadyを作成
  i_s0_axis_tready <= m_axis_tready when input_no = 0 else '0';
  i_s1_axis_tready <= m_axis_tready when input_no = 1 else '0';
  i_s2_axis_tready <= m_axis_tready when input_no = 2 else '0';

  i_m_axis_tvalid <= s0_axis_tvalid when input_no = 0 else
                     s1_axis_tvalid when input_no = 1 else
                     s2_axis_tvalid;
  i_m_axis_tdata <= s0_axis_tdata when input_no = 0 else
                    s1_axis_tdata when input_no = 1 else
                    s2_axis_tdata;

  process(aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        input_no <= 0;
      else
        if (i_m_axis_tvalid = '1' and m_axis_tready = '1') then
          if (input_no = NINPUTS-1) then
            input_no <= 0;
          else
            input_no <= input_no + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  -- 出力との接続
  s0_axis_tready <= i_s0_axis_tready after DELAY;
  s1_axis_tready <= i_s1_axis_tready after DELAY;
  s2_axis_tready <= i_s2_axis_tready after DELAY;
  m_axis_tvalid <=  i_m_axis_tvalid after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
