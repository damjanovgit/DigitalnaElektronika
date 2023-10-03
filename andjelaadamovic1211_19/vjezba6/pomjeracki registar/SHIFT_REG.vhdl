library IEEE;
use IEEE.std_logic_1164.all;

entity SHIFT_REG is port (
    
    CLK, RST: in std_logic;
    SEL : in std_logic_vector(1 downto 0) ;
    DATA_IN : in std_logic_vector(5 downto 0);
    DATA_OUT : out std_logic_vector(5 downto 0) 

);
end entity SHIFT_REG;

architecture  SHIFT_REG_beh of SHIFT_REG is
signal stanje: std_logic_vector(5 downto 0);

begin
process(CLK, RST)
  begin
  
  if (RST = '0') then
    stanje <= "000000";
  elsif (clk'event and clk='1') then
 -- nepromijenjeno stanje
       if(SEL="00") then
       stanje <= stanje; 
 -- pomjeraj ulijevo
       elsif(SEL="01") then
       stanje(0) <= DATA_IN(5) ;
       for i in 1 to 5 loop
       stanje(i) <= stanje(i-1);
       end loop;
--pomjeraj udesno
       elsif(SEL="10") then
       for i in 0 to 4 loop
       stanje(i) <= stanje(i+1);
       stanje(5) <= DATA_IN(0);
       end loop;
       elsif(SEL="11") then 
       stanje <= DATA_IN;
       end if;
end if;
end process;
DATA_OUT <= stanje;

end SHIFT_REG_beh;
     
