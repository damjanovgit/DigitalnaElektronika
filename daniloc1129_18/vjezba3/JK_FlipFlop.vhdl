library ieee;
use ieee.std_logic_1164.all;

entity JK_FlipFlop is 
port(
    J, K, CLK : in std_logic;
    Q : out std_logic
	);
end entity JK_FlipFlop;

architecture JK_FlipFlop_beh of JK_FlipFlop is
   
signal temp : std_logic :='0';
begin
JK_proc: process(CLK)
  begin
      if(rising_edge(CLK))  then
          if(J = '0' and K = '0')  then temp <= temp; 
		  elsif(J = '0' and  K = '1')  then  temp <= '0';
          elsif(J = '1' and K = '0')  then  temp <= '1';
          else temp <= not(temp);
          end if;
       end if;
end process JK_proc;
  Q <= temp;
end architecture JK_FlipFlop_beh ; 