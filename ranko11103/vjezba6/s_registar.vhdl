
library ieee;
use ieee.std_logic_1164.all;

entity s_registar is port
 (
    CLR,CLK,E : in std_logic;
    data_in : in std_logic_vector(9 downto 0);
    data_out : out std_logic_vector(9 downto 0)
 );
end s_registar;

architecture s_registar_beh of s_registar is 
 
  signal pomocni :std_logic_vector(9 downto 0) := "0000000000";
begin 
   process(CLK)
   begin

     if (rising_edge(CLK) and E = '1') then
        if(CLR = '1')then
            pomocni <= "0000000000";

        else 
            pomocni <= data_in;
        end if;
     end if;
   end process;

   data_out <= pomocni;

end s_registar_beh;   
