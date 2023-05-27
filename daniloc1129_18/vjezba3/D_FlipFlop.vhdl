library ieee;
use ieee.std_logic_1164.all;

entity D_FlipFlop is 
port(
    D, CLK : in std_logic;
    Q : out std_logic
);
end entity D_FlipFlop;

architecture D_FlipFlop_beh of D_FlipFlop is

signal temp : std_logic :='0';

begin
D_proc: process(CLK)
    begin
        if(rising_edge(CLK)) then temp <= D;
        end if;
end process D_proc;

  Q <= temp;
end architecture D_FlipFlop_beh ; 