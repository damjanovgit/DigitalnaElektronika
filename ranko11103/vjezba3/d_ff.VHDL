library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is port(

    cp : in std_logic;
    d : in std_logic;
    q : out std_logic;
    not_q : out std_logic);

end entity d_flipflop;

architecture d_flipflop_beh of d_flipflop is 
 signal q_temp : std_logic :='0' ;
 begin 
 process(cp)
 begin 
    
  if(rising_edge(cp))then 
    
    q_temp <= d;

  end if;
 end process;
q <= q_temp;
not_q <= not(q_temp);
end d_flipflop_beh; 


 

