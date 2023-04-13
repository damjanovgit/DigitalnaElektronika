library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is port(

    j : in std_logic;
    k : in std_logic;
    clk : in std_logic;
    q : out std_logic;
    not_q : out std_logic);

end entity jk_flipflop;    

architecture jk_flipflop_beh of jk_flipflop is 
 signal temp : std_logic :='0';
 begin

 process(clk)
 begin

 if(clk='1' and clk'EVENT)then
  
  if (j='0' and k='0')then 
   temp <= temp;
  
  elsif(j='1' and k='1')then 
   temp <= not(temp);

  elsif(j='0' and k='1')then 
   temp <= '0';

  else
   temp <= '1';  
  end if;
 end if;

 q <= temp;   
 not_q <= not(temp);
 end process;
end jk_flipflop_beh; 
