library ieee;
use ieee.std_logic_1164.all;

entity JKFF is
port(
    J, K, CLK : in std_logic;
    Q, NOTQ : out std_logic
);

end JKFF;

architecture JKFF_beh of JKFF is
    signal state : std_logic;
    signal pom : std_logic := '0';

begin
    state <= pom;
    process (CLK)
    begin
        if(rising_edge(CLK)) then
            if(J = '0' and K = '0') then 
                pom <= state;
            elsif (J = '0' and K = '1') then 
                pom <= '0';
            elsif (J = '1' and K = '0') then 
                pom <= '1';
            else 
                pom <= not(state);
            end if;
        end if;
    
    end process;
    Q <= pom;
    NOTQ <= not(pom);

end JKFF_beh;


