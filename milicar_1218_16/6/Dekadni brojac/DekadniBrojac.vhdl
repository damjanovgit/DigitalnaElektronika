library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DekadniBrojac is
    port (
        ulaz, takt, reset : in std_logic;
        izlaz : out std_logic_vector(3 downto 0)
    );
end DekadniBrojac;

architecture Behavioral of DekadniBrojac is
    signal stanje : unsigned(3 downto 0);
begin
    process(takt, reset)
    begin
        if reset = '1' then
            stanje <= "0000";
        elsif rising_edge(takt) then
            if ulaz = '0' then
                if stanje = "1001" then
                    stanje <= "0000";
                else
                    stanje <= stanje + 1;
                end if;
            else
                if stanje = "0000" then
                    stanje <= "1001";
                else
                    stanje <= stanje - 1;
                end if;
            end if;
        end if;
    end process;
    
    izlaz <= std_logic_vector(stanje);
end Behavioral;
