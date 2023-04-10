library ieee;
use ieee.std_logic_1164.all;

entity rs is port(

    s: in std_logic;
    r: in std_logic;
    q: out std_logic;
    not_q: out std_logic);

end entity rs;

architecture rs_beh of rs is 

 begin 
  process(s,r)
   begin
    q <= '0';
    not_q <= '0';

    if( s='0' and r='1' )then
      q <= '0';
      not_q <='1';

    elsif(s='1' and r='0')then 
      q <= '1';
      not_q <= '0';  
    end if;
   end process;
end rs_beh;      