library ieee;
use ieee.std_logic_1164.all;

entity JK_flipflop is
    port(
        J, K, CP : in std_logic;
        Q, Qnot : out std_logic
    );
end JK_flipflop;

architecture arh_JK_flipflop of JK_flipflop is
    signal pom: std_logic := '1';
begin
    JK_flipflop_proc: process(CP)
    begin
        if falling_edge(CP) then
            if( J = '0' and K = '1') then
                pom <= '0';
            elsif( J = '1' and K = '0') then
                pom <= '1';
            elsif( J = '1' and K = '1') then
                pom <= not pom;
            end if;
        end if;  
end process JK_flipflop_proc;
Q <= pom;
Qnot <= not pom;
end arh_JK_flipflop;