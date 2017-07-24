----------------------------------------------------------------------------------
-- シミュレーション用モジュール。
-- FNAMEで指定したファイルからデータを読みだし AXI4 Stream に出力する。
-- PATTERN で tvalid の動作を指定する。'p' は周期的、'r' はランダム。
-- PATTERN = 'p' の場合は PERIOD で指定したクロック数に1回 tready をアサートする。
-- tvalid はアサートしたらデータ受け渡しが完了するまではその状態を保持する。
-- データ受け渡しが完了したら PERIOD-1クロックの間 tready はネゲートされる。
-- PATTERN = 'r' の場合はランダムに tready をアサートする。
-- 乱数は7次のM系列符号器で生成する。初期値はINIT_RANDで与えることができる。
----------------------------------------------------------------------------------

library ieee;
library std;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity AXISSimSlave is
  generic (
    NBITS : natural := 16;
    FNAME : string := "output.txt";
    PATTERN : character := 'p';
    PERIOD : positive := 4;
    INIT_RAND : std_logic_vector(7 downto 1) := "0101100";
    DELAY : time := 1ns
    );
  port (
    aclk : in std_logic;
    aresetn : in std_logic;
    s_axis_tvalid : in std_logic;
    s_axis_tready : out std_logic;
    s_axis_tlast : in std_logic;
    s_axis_tdata : in std_logic_vector(NBITS-1 downto 0)
    );
end AXISSimSlave;

architecture SIM of AXISSimSlave is
  signal i_s_axis_tready : std_logic := '0';
begin
  process (aclk)
    variable count : natural := 0;
    file fo : text is out FNAME;
    variable lo : line;

    -- 乱数発生
    variable rand_regs : std_logic_vector(7 downto 1);
    variable next_tready : std_logic;
    
    procedure get_next_tready(
      variable regs : inout std_logic_vector(7 downto 1);
      variable tready : out std_logic) is
      variable temp : std_logic;
    begin
      tready := regs(7);
      temp := regs(7) xor regs(1);
      regs(7 downto 2) := regs(6 downto 1);
      regs(1) := temp;
    end get_next_tready;
  begin
    if (rising_edge(aclk)) then
      if (aresetn = '0') then
        i_s_axis_tready <= '0';
        count := 0;
        rand_regs := INIT_RAND;
      else
        -- tready出力
        if (PATTERN = 'p') then
          if (count = PERIOD-1) then
            count := 0;
            i_s_axis_tready <= '1';
          else
            count := count + 1;
            i_s_axis_tready <= '0';
          end if;
        elsif (PATTERN = 'r') then
          get_next_tready(rand_regs, next_tready);
          i_s_axis_tready <= next_tready;
        else
          assert false
            severity failure;
        end if;

        -- データ出力
        if (s_axis_tvalid = '1' and i_s_axis_tready = '1') then
          hwrite(lo, s_axis_tdata);
          write(lo, ' ');
          write(lo, s_axis_tlast);
          writeline(fo, lo);
        end if;
      end if;
    end if;
  end process;

  s_axis_tready <= i_s_axis_tready after DELAY;
end SIM;
