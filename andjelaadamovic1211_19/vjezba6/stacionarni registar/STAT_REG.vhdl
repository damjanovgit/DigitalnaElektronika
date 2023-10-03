library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity STAT_REG is port (

    clk, reset, enable : in std_logic;
    input : in std_logic_vector (9 downto 0);
    output: out std_logic_vector (9 downto 0) := (others => '0')
);

end STAT_REG;

architecture STAT_beh of STAT_REG is

begin
process(clk, reset)
begin
if(rising_edge(CLK)) then 
   if (reset = '1') then
    output <= "0000000000";
   elsif ((enable = '1') and  (reset = '0')) then 
    for i in 0 to 9 loop
    output(i) <= input (i);
   end loop;

   end if;
   end if;
end process;
end STAT_beh;
   
