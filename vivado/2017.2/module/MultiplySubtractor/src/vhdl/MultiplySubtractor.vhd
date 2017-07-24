----------------------------------------------------------------------------------
-- 'c - a*b' を計算する。
-- tlast は cポートに入ってきたものを出力する。
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- c - a*b
entity MultiplySubtractor is
  generic (
    NBITS : natural := 16;
    NBITS_FRACTION : natural := 8
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- データ入力
    s_axis_a_tvalid : in std_logic;
    s_axis_a_tready : out std_logic;
    s_axis_a_tdata : in std_logic_vector(NBITS-1 downto 0);

    s_axis_b_tvalid : in std_logic;
    s_axis_b_tready : out std_logic;
    s_axis_b_tdata : in std_logic_vector(NBITS-1 downto 0);

    s_axis_c_tvalid : in std_logic;
    s_axis_c_tready : out std_logic;
    s_axis_c_tlast : in std_logic;
    s_axis_c_tdata : in std_logic_vector(NBITS-1 downto 0);
    
    -- データ出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end MultiplySubtractor;

architecture Behavioral of MultiplySubtractor is
  -- 定数
  constant DELAY : time := 1 ns; -- シミュレーション時出力を遅延させる

  -- 信号
  signal i_s_all_tvalid : std_logic;
  signal i_ce : std_logic; -- レジスタのクロックイネーブル
  
  -- 出力との接続
  signal i_s_axis_a_tready : std_logic := '0';
  signal i_s_axis_b_tready : std_logic := '0';
  signal i_s_axis_c_tready : std_logic := '0';
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic;
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);
  
  function mult_sub(a : std_logic_vector(NBITS-1 downto 0);
                    b : std_logic_vector(NBITS-1 downto 0);
                    c : std_logic_vector(NBITS-1 downto 0)
                    )
    return std_logic_vector is
    variable sa : signed(NBITS-1 downto 0);
    variable sb : signed(NBITS-1 downto 0);
    variable sc : signed(NBITS-1 downto 0);
    variable mul1 : signed(NBITS*2-1 downto 0);
    variable mul2 : signed(NBITS-1 downto 0);
    variable res : signed(NBITS-1 downto 0);
  begin
    sa := signed(a);
    sb := signed(b);
    sc := signed(c);
    mul1 := sa * sb;
    mul2 := mul1(NBITS+NBITS_FRACTION-1 downto NBITS_FRACTION);
    res := sc - mul2;
    return std_logic_vector(res);
  end function;
begin
  -- 全ての入力を待ち合わせる
  -- 全ての s_axis_*_tvalid の and をとる
  i_s_all_tvalid <= s_axis_a_tvalid and s_axis_b_tvalid and s_axis_c_tvalid;

  -- ffのクロックイネーブル
  i_ce <= (not i_m_axis_tvalid) or m_axis_tready;
  
  -- a,b,c入力ポートに入力可能
  i_s_axis_a_tready <= i_ce and s_axis_b_tvalid and s_axis_c_tvalid;
  i_s_axis_b_tready <= i_ce and s_axis_c_tvalid and s_axis_a_tvalid;
  i_s_axis_c_tready <= i_ce and s_axis_a_tvalid and s_axis_b_tvalid;

  -- s_tdata及びs_tvalidをレジスタに保持する
  process(aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_tvalid <= '0';
        --temp_tvalid := '0';
      else
        if (i_ce = '1') then
          i_m_axis_tvalid <= i_s_all_tvalid;
          i_m_axis_tlast <= s_axis_c_tlast; -- tlastはcポートのものを使う
          i_m_axis_tdata <= mult_sub(s_axis_a_tdata, s_axis_b_tdata, s_axis_c_tdata);
        end if;
      end if;
    end if;
  end process;

  -- 出力との接続
  s_axis_a_tready <= i_s_axis_a_tready after DELAY;
  s_axis_b_tready <= i_s_axis_b_tready after DELAY;
  s_axis_c_tready <= i_s_axis_c_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tlast <= i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
