----------------------------------------------------------------------------------
-- シミュレーション用モジュール。
-- AXI4 Stream の信号を受け、FNAMEで指定したファイルに落とす。
-- PATTERN で tready の動作を指定する。'p' は周期的、'r' はランダム。
-- PATTERN = 'p' の場合は PERIOD で指定したクロック数に1回 tready をアサートする。
-- PATTERN = 'r' の場合はランダムに tready をアサートする。
-- 乱数は7次のM系列符号器で生成する。初期値はINIT_RANDで与えることができる。
----------------------------------------------------------------------------------

library ieee;
library std;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity AXISSimMaster is
  generic (
    NBITS : natural := 16;
    PACKET_LEN : natural := 4;
    FNAME : string := "input.txt";
    PATTERN : character := 'p'; -- 'p':periodic, 'r':random
    PERIOD : positive := 4;
    INIT_RAND : std_logic_vector(7 downto 1) := "1010011";
    DELAY : time := 1 ns
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tdata : out std_logic_vector(NBITS-1 downto 0);
    done : out boolean := false
    );
end AXISSimMaster;

architecture SIM of AXISSimMaster is
  signal i_m_axis_tvalid : std_logic := '0';
  signal i_m_axis_tlast : std_logic;
  signal i_m_axis_tdata : std_logic_vector(NBITS-1 downto 0);
begin
  process(aclk)
    file fi : text is in FNAME;
    variable li : line;
    variable data : std_logic_vector(NBITS-1 downto 0) := (others => 'U');
    variable tlast_val : std_logic;
    variable init : boolean := true;
    variable count_tlast : natural := 0;
    variable count_period : natural := 0;
    variable res_read : boolean;
    variable i_done : boolean := false;

    -- 乱数発生
    variable rand_regs : std_logic_vector(7 downto 1);
    -- 乱数使用時の次のtvalidの値
    variable next_tvalid : std_logic;
    
    procedure check_tlast(
      constant PLEN : in positive;
      variable counter : inout natural;
      variable tlast : out std_logic) is
    begin
      if (PLEN-1 <= counter) then
        counter := 0;
        tlast := '1';
      else
        counter := counter + 1;
        tlast := '0';
      end if;
    end check_tlast;

    procedure get_next_tvalid(
      variable regs : inout std_logic_vector(7 downto 1);
      variable tvalid : out std_logic) is
      variable temp : std_logic;
    begin
      tvalid := regs(7);
      temp := regs(7) xor regs(1);
      regs(7 downto 2) := regs(6 downto 1);
      regs(1) := temp;
    end get_next_tvalid;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_m_axis_tvalid <= '0';
        i_m_axis_tlast <= 'X';
        i_m_axis_tdata <= (others => 'X');
        i_done := false;
        init := true;
        count_tlast := 0;
        count_period := 0;
        rand_regs := INIT_RAND;
      else
        -- 最初に出力データを予め読んでおく。
        if (init) then
          readline(fi, li);
          hread(li, data);
          check_tlast(PACKET_LEN, count_tlast, tlast_val);
          init := false;
        end if;

        -- 出力完。ファイルから次のデータを読み込む。
        if (i_m_axis_tvalid = '1' and m_axis_tready = '1') then
          -- データ読み込み。ファイルの終わりまで来たら done 出力を出す。
          readline(fi, li);
          hread(li, data, res_read);
          if (not res_read) then
            i_done := true;
          end if;

          -- tlastの値を取得。
          check_tlast(PACKET_LEN, count_tlast, tlast_val);
        end if;

        -- データを出力する。
        if (not i_done) then
          if (PATTERN = 'p') then
            -- データを周期的に出力する。
            if (count_period = PERIOD-1) then
              -- 読み込んでおいたデータを出力する
              count_period := 0;

              i_m_axis_tvalid <= '1';
              i_m_axis_tdata <= data;
              i_m_axis_tlast <= tlast_val;
            else
              if (i_m_axis_tvalid = '0') then
                count_period := count_period + 1;
              else
                if (m_axis_tready = '1') then
                  -- 出力したら tvalid を落とす。但し周期が2以上の場合
                  i_m_axis_tvalid <= '0';
                  i_m_axis_tlast <= '0';
                  i_m_axis_tdata <= (others => 'X');
                  count_period := count_period + 1;
                end if;
              end if;
            end if;
          elsif (PATTERN = 'r') then
            if (i_m_axis_tvalid = '0' or m_axis_tready = '1') then
              get_next_tvalid(rand_regs, next_tvalid);
              if (next_tvalid = '1') then
                i_m_axis_tvalid <= '1';
                i_m_axis_tlast <= tlast_val;
                i_m_axis_tdata <= data;
              else
                i_m_axis_tvalid <= '0';
                i_m_axis_tlast <= tlast_val;
                i_m_axis_tdata <= (others => 'X');
              end if;
            end if;
          else -- PATTERN の指定が間違っている。
            assert false
              severity failure;
          end if;
        else -- i_done
          i_m_axis_tvalid <= '0';
          i_m_axis_tlast <= '0';
          i_m_axis_tdata <= (others => 'X');
        end if;
        
      end if;
    end if;

    done <= i_done;
  end process;

  m_axis_tvalid <= i_m_axis_tvalid after DELAY;
  m_axis_tlast <= i_m_axis_tlast after DELAY;
  m_axis_tdata <= i_m_axis_tdata after DELAY;
end SIM;
