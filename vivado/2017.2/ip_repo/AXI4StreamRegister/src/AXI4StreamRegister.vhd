----------------------------------------------------------------------------------
-- tvalid, tlast, tdataに1段レジスタを挿入する。treadyには入れない。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity AXI4StreamRegister is
  generic (
    NBITS : natural := 16
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- データ入力
    s_axis_tvalid : in std_logic;
    s_axis_tready : out std_logic;
    s_axis_tlast : in std_logic := '0';
    s_axis_tdata : in std_logic_vector(NBITS-1 downto 0);
    
    -- データ出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end AXI4StreamRegister;

architecture Behavioral of AXI4StreamRegister is
  -- 定数
  constant DELAY : time := 1 ns; -- シミュレーション時出力を遅延させる

  -- 読み込み可能
  signal readable : std_logic;
  
  -- 出力との接続
  signal i_s_axis_tready : std_logic;
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic;
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);

begin
  -- レジスタデータが無効か、出力先がreadyの場合はデータをレジスタに読み込める。
  readable <= (not i_m_axis_tvalid) or m_axis_tready;
  
  process (aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_tvalid <= '0';
      else
        if (readable = '1') then
          i_m_axis_tvalid <= s_axis_tvalid;
          i_m_axis_tdata <= s_axis_tdata;
          i_m_axis_tlast <= s_axis_tlast;
        end if;
      end if;
    end if;
  end process;
  
  i_s_axis_tready <= readable;

  -- 出力との接続
  s_axis_tready <= i_s_axis_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tlast <= i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
