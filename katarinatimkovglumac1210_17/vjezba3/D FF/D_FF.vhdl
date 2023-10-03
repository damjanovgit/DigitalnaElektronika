library IEEE;
use IEEE.std_logic_1164.all;

entity DFlipFlop is port(
    D, clk, rst : IN std_logic;
    Q : OUT std_logic
);
end DFlipFlop;

architecture DFlipFlopbehaviour  of DFlipFlop is
begin
process(clk, rst)
begin

if (rst='1') then
    Q<='0';
elsif(clk'event and clk='1') then
    Q <= D;
end if;

end process;
end DFlipFlopbehaviour;