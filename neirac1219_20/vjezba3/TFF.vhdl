library ieee;
use ieee.std_logic_1164.all;

entity TFF is
port(
    T, CLK : in std_logic;
    Q, NOTQ : out std_logic
);

end TFF;

architecture TFF_beh of TFF is

    signal pom : std_logic := '0';
     signal stanje : std_logic;

begin

    stanje <= pom;
    process(CLK)
    begin
        if (rising_edge(CLK)) then
            if(T = '1') then
            pom <= not(stanje);
            else
            pom <= stanje;
            end if;
        end if;

    end process;

Q <= pom;
NOTQ <= not (pom);
end TFF_beh;