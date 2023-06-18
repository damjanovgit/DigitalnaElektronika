library ieee;
use ieee.std_logic_1164.all;

entity Stacionarni_Registar is
    port(
        RST, EN, CLK : in std_logic;
        ulaz : in std_logic_vector (9 downto 0);
        izlaz : out std_logic_vector (9 downto 0)

    );
end Stacionarni_Registar;

architecture Stacionarni_Registar_beh of Stacionarni_Registar is
    signal pom : std_logic_vector (9 downto 0) := "0000000000";

begin
    izlaz <= pom;
    process (CLK)
    
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                pom <= "0000000000"; 
            elsif (EN = '1') then
                pom <= ulaz;
            end if;
        end if;
    end process;

    
end Stacionarni_Registar_beh;
