library ieee;
use ieee.std_logic_1164.all;

entity T_FlipFlop is 
port(
    T, CLK : in std_logic;
    Q : out std_logic
);
end entity T_FlipFlop;

architecture T_FlipFlop_beh of T_FlipFlop is

signal temp : std_logic :='0';
begin

T_proc: process(CLK) 
   begin
       if(rising_edge(CLK)) then
           if(T = '0') then temp <= temp;
           elsif(T = '1') then temp <= not(temp);
           end if;
        end if;
end process T_proc;
    Q <= temp;
end architecture T_FlipFlop_beh ; 