----------------------------------------------------------------------------------
-- 3x3行列専用。
-- 各列データは逆順に入力される。例えば第1列は a31, a21, a11 の順。
-- それらを並べ直して、第1行、第2行、第3行と順に出力する。
-- 具体的には a11, a12, a13, a21, a22, a23, a31, a32, a33 の順。
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Reorder3 is
  generic (
    NBITS : natural := 16
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;

    -- データ入力
    s_axis_col1_tvalid : in std_logic;
    s_axis_col1_tready : out std_logic;
    s_axis_col1_tlast : in std_logic;
    s_axis_col1_tdata : in std_logic_vector(NBITS-1 downto 0);
    
    s_axis_col2_tvalid : in std_logic;
    s_axis_col2_tready : out std_logic;
    s_axis_col2_tlast : in std_logic;
    s_axis_col2_tdata : in std_logic_vector(NBITS-1 downto 0);
    
    s_axis_col3_tvalid : in std_logic;
    s_axis_col3_tready : out std_logic;
    s_axis_col3_tlast : in std_logic;
    s_axis_col3_tdata : in std_logic_vector(NBITS-1 downto 0);
    
    -- データ出力
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0)
    );
end Reorder3;

architecture Behavioral of Reorder3 is
  -- 定数
  constant DELAY : time := 1 ns; -- シミュレーション時出力に遅延を入れる

  -- データ保存
  -- column 1
  signal el11_tvalid : std_logic := '0';
  signal el11_tdata : std_logic_vector(NBITS-1 downto 0);
  signal el21_tvalid : std_logic := '0';
  signal el21_tdata : std_logic_vector(NBITS-1 downto 0);
  signal el31_tvalid : std_logic := '0';
  signal el31_tdata : std_logic_vector(NBITS-1 downto 0);
  -- column 2
  signal el12_tvalid : std_logic := '0';
  signal el12_tdata : std_logic_vector(NBITS-1 downto 0);
  signal el22_tvalid : std_logic := '0';
  signal el22_tdata : std_logic_vector(NBITS-1 downto 0);
  signal el32_tvalid : std_logic := '0';
  signal el32_tdata : std_logic_vector(NBITS-1 downto 0);
  -- column 3
  signal el13_tvalid : std_logic := '0';
  signal el13_tdata : std_logic_vector(NBITS-1 downto 0);
  signal el23_tvalid : std_logic := '0';
  signal el23_tdata : std_logic_vector(NBITS-1 downto 0);
  signal el33_tvalid : std_logic := '0';
  signal el33_tdata : std_logic_vector(NBITS-1 downto 0);

  -- 信号
  signal one_output_done : std_logic := '0';
  signal all_output_done : std_logic := '0';
  
  -- 出力との接続
  signal i_s_axis_col1_tready : std_logic := '0';
  signal i_s_axis_col2_tready : std_logic := '0';
  signal i_s_axis_col3_tready : std_logic := '0';
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic := '0';
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0) := (others => '0');
begin
  -- col1 データ入力
  process (aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        el11_tvalid <= '0';
        el21_tvalid <= '0';
        el31_tvalid <= '0';
      else
        if (i_s_axis_col1_tready = '1') then
          -- row3 からデータが入ってくる
          if (el31_tvalid = '0') then
            el31_tvalid <= s_axis_col1_tvalid;
            el31_tdata <= s_axis_col1_tdata;
          elsif (el21_tvalid = '0') then
            el21_tvalid <= s_axis_col1_tvalid;
            el21_tdata <= s_axis_col1_tdata;
          else
            el11_tvalid <= s_axis_col1_tvalid;
            el11_tdata <= s_axis_col1_tdata;
          end if;
        else
          if (all_output_done = '1') then
            -- 出力終了
            el11_tvalid <= '0';
            el21_tvalid <= '0';
            el31_tvalid <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;
  i_s_axis_col1_tready <= not (el11_tvalid and el21_tvalid and el31_tvalid);

  -- col2 データ入力
  process (aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        el12_tvalid <= '0';
        el22_tvalid <= '0';
        el32_tvalid <= '0';
      else
        if (i_s_axis_col2_tready = '1') then
          -- row3 からデータが入ってくる
          if (el32_tvalid = '0') then
            el32_tvalid <= s_axis_col2_tvalid;
            el32_tdata <= s_axis_col2_tdata;
          elsif (el22_tvalid = '0') then
            el22_tvalid <= s_axis_col2_tvalid;
            el22_tdata <= s_axis_col2_tdata;
          else
            el12_tvalid <= s_axis_col2_tvalid;
            el12_tdata <= s_axis_col2_tdata;
          end if;
        else
          if (all_output_done = '1') then
            -- 出力終了
            el12_tvalid <= '0';
            el22_tvalid <= '0';
            el32_tvalid <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;
  i_s_axis_col2_tready <= not (el12_tvalid and el22_tvalid and el32_tvalid);

  -- col3 データ入力
  process (aclk)
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        el13_tvalid <= '0';
        el23_tvalid <= '0';
        el33_tvalid <= '0';
      else
        if (i_s_axis_col3_tready = '1') then
          -- row3 からデータが入ってくる
          if (el33_tvalid = '0') then
            el33_tvalid <= s_axis_col3_tvalid;
            el33_tdata <= s_axis_col3_tdata;
          elsif (el23_tvalid = '0') then
            el23_tvalid <= s_axis_col3_tvalid;
            el23_tdata <= s_axis_col3_tdata;
          else
            el13_tvalid <= s_axis_col3_tvalid;
            el13_tdata <= s_axis_col3_tdata;
          end if;
        else
          if (all_output_done = '1') then
            -- 出力終了
            el13_tvalid <= '0';
            el23_tvalid <= '0';
            el33_tvalid <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;
  i_s_axis_col3_tready <= not (el13_tvalid and el23_tvalid and el33_tvalid);


  -- 出力終了
  one_output_done <= i_m_axis_tvalid and m_axis_tready;
  all_output_done <= one_output_done and i_m_axis_tlast;

  -- 出力
  process (aclk)
    variable el_number : natural range 0 to 8 := 0;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_tvalid <= '0';
        i_m_axis_tlast <= '0';
        el_number := 0;
      else
        if (el_number = 0) then
          i_m_axis_tvalid <= el11_tvalid;
          i_m_axis_tdata <= el11_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el12_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el12_tdata;
            el_number := 1;
          end if;
            
        elsif (el_number = 1) then
          i_m_axis_tvalid <= el12_tvalid;
          i_m_axis_tdata <= el12_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el13_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el13_tdata;
            el_number := 2;
          end if;
          
        elsif (el_number = 2) then
          i_m_axis_tvalid <= el13_tvalid;
          i_m_axis_tdata <= el13_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el21_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el21_tdata;
            el_number := 3;
          end if;
          
        elsif (el_number = 3) then
          i_m_axis_tvalid <= el21_tvalid;
          i_m_axis_tdata <= el21_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el22_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el22_tdata;
            el_number := 4;
          end if;

        elsif (el_number = 4) then
          i_m_axis_tvalid <= el22_tvalid;
          i_m_axis_tdata <= el22_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el23_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el23_tdata;
            el_number := 5;
          end if;

        elsif (el_number = 5) then
          i_m_axis_tvalid <= el23_tvalid;
          i_m_axis_tdata <= el23_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el31_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el31_tdata;
            el_number := 6;
          end if;

        elsif (el_number = 6) then
          i_m_axis_tvalid <= el31_tvalid;
          i_m_axis_tdata <= el31_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el32_tvalid;
            i_m_axis_tlast <= '0';
            i_m_axis_tdata <= el32_tdata;
            el_number := 7;
          end if;

        elsif (el_number = 7) then
          i_m_axis_tvalid <= el32_tvalid;
          i_m_axis_tdata <= el32_tdata;
          if (one_output_done = '1') then
            i_m_axis_tvalid <= el33_tvalid;
            i_m_axis_tlast <= '1'; -- 最後のデータはtlastを立てる
            i_m_axis_tdata <= el33_tdata;
            el_number := 8;
          end if;

        elsif (el_number = 8) then
          i_m_axis_tvalid <= el33_tvalid;
          i_m_axis_tdata <= el33_tdata;
          if (one_output_done = '1') then
            -- 最後のデータ出力終了
            i_m_axis_tvalid <= '0';
            i_m_axis_tlast <= '0';
            el_number := 0;
          end if;
        end if;
      end if;
    end if;
  end process;

  -- 出力との接続
  s_axis_col1_tready <= i_s_axis_col1_tready after DELAY;
  s_axis_col2_tready <= i_s_axis_col2_tready after DELAY;
  s_axis_col3_tready <= i_s_axis_col3_tready after DELAY;
  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tlast <= i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end Behavioral;
