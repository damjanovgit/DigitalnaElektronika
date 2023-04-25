library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
  port (
    D, CP : in std_logic;
    Q, Qn : out std_logic
  ) ;
end D_FF;

architecture behavior of D_FF is
signal tmp : std_logic := '0';
begin
    process(CP)
    begin
        if ( rising_edge(CP)) then
            tmp <= D;
        end if;
    end process;
Q <= tmp;
Qn <= not tmp;
end behavior ;