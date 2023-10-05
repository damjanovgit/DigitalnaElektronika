library ieee;
use ieee.std_logic_1164.all;

entity RS_flipflop is
    port(
        S, R, CP : in std_logic;
        Q, Qnot : out std_logic
    );
end RS_flipflop;

architecture RS_flipflop_beh of RS_flipflop is
    signal pom : std_logic := '1';
begin
    RS_flipflop_proc: process(CP)
    begin
        if falling_edge(CP) then
        if(S = '1' and R = '0') then
            pom <= '1';
        elsif (S = '0' and R = '1') then
            pom <= '0';
        elsif (S = '1' and R = '1') then
                pom <= 'X';
        end if;
        end if;
    end process RS_flipflop_proc;
Q <= pom;
Qnot <= not pom;
end RS_flipflop_beh;