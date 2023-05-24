library ieee;
use ieee.std_logic_1164.all;

entity DFF is
port(
    D, CLK : in std_logic;
    Q, NOTQ : out std_logic
);

end DFF;

architecture DFF_beh of DFF is

    signal pom : std_logic := '0';
   

begin

    
    process(CLK)
    begin
        if (rising_edge(CLK)) then
             pom <= D;
        end if;
    end process;

Q <= pom;
NOTQ <= not (pom);
end DFF_beh;


    

