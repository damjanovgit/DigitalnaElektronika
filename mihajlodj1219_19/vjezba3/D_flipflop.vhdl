library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop is
    port(
        D, CP : in std_logic;
        Q, Qnot : out std_logic
    );
end D_flipflop;

architecture arh_D_flipflop_edge of D_flipflop is
    signal previous: std_logic := '1';
begin
    D_flipflop_proc: process(CP)
    begin
        if falling_edge(CP) then
            previous <= D;
        end if;
    end process D_flipflop_proc;
Q <= previous;
Qnot <= not previous;
end arh_D_flipflop_edge;




