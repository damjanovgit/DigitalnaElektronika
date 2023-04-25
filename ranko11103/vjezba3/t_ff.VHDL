library ieee;
use ieee.std_logic_1164.all;

-- u pitanju je sihroni t flip flop 

entity t_flipflop is port(

    clk : in std_logic;
    t : in std_logic;
    q : out std_logic;
    not_q : out std_logic);

end entity t_flipflop;

architecture t_flipflop_beh of t_flipflop is 
  signal temp : std_logic :='0';
 begin

 process(clk)
 begin 

  if(falling_edge(clk))then
    
    if( t='0')then
      temp <= temp; 
    
    elsif(t='1')then
        temp <= not(temp);
    end if;
  end if;
 end process;
  q <= temp;
  not_q <= not(temp);
 
end t_flipflop_beh; 



    


