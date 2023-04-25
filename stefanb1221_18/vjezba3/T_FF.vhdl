library ieee;
use ieee.std_logic_1164.all;

entity T_FF is
    port(
        T, CP : in std_logic;
        Q, Qn : out std_logic
    );
end T_FF;

architecture behavior of T_FF is
    signal tmp : std_logic;
begin
    process(CP)
    begin
        if(rising_edge(CP)) then
            tmp <= T;
        end if;
    end process;
Q <= tmp;
Qn <= not tmp;
end behavior;