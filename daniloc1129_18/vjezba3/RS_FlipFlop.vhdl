library ieee;
use ieee.std_logic_1164.all;

entity RS_FlipFlop is 
port(
    R, S, CLK : in std_logic;
    Q : out std_logic
);
end entity RS_FlipFlop;

architecture RS_FlipFlop_beh of RS_FlipFlop is

    signal tmp : std_logic :='0';
begin
RS_proc: process(CLK) 
    begin
        if(rising_edge(CLK))  then
            if(R = '0' and S = '0')  then tmp <= tmp;   
			elsif (R = '0' and S = '1')  then tmp <= '1';   
            elsif(R = '1' and S = '0')  then tmp <= '0';
            else tmp <= 'X';
            end if;
        end if;
    end process RS_proc;
    Q <= tmp;
end architecture RS_FlipFlop_beh ; 