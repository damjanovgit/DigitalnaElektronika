library ieee;
use ieee.std_logic_1164.all;

entity T_flipflop is
    port(
        T, CP: in std_logic;
        Q, Qnot : out std_logic
    );
end T_flipflop;

architecture arh_T_flipflop of T_flipflop is
    signal pom: std_logic := '1';
    begin
    T_flipflop_proc: process(CP)
    begin
        if falling_edge(CP) then
            if (T = '1') then
                pom <= not(pom);
            elsif (T = '0') then
                pom <= pom;
            end if;
        end if;  
    end process T_flipflop_proc;
Q <= pom;
Qnot <= not(pom);
end arh_T_flipflop;


