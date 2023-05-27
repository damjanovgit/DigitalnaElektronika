library ieee;
use ieee.std_logic_1164.all;

entity RSFF is
port(
    R, S, CLK : in std_logic;
    Q : out std_logic
);

end RSFF;

architecture RSFF_beh of RSFF is
   
    signal pom : std_logic := '0';

begin
    
    process (CLK)
    begin
        if(rising_edge(CLK)) then
            if(S = '1' and R = '0') then
                pom <= '1';
            elsif(R = '1' and S = '0') then
                pom <= '0';
            end if;
            
        end if;
    
    end process;
    Q <= pom;
    

end RSFF_beh;
