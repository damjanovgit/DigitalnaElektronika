library ieee;

use ieee.std_logic_1164.all;

entity Pomjeracki_Registar is
    port(
        CLK, RST, L_ulaz, R_ulaz: in std_logic;
        ulaz : in std_logic_vector(5 downto 0);
        mode : in std_logic_vector(1 downto 0);
        izlaz : out std_logic_vector(5 downto 0)
    );
end Pomjeracki_Registar;

architecture Pomjeracki_Registar_beh of Pomjeracki_Registar is
    
    signal pom : std_logic_vector(5 downto 0) := "000000";

begin
    izlaz <= pom;
    process(CLK, RST) 
    begin
        if(RST = '0') then
            pom <= "000000";
        elsif(rising_edge(CLK)) then
            case mode is
                when "00" =>
                -- pomjeranje udesno
                    for i in 0 to 4 loop
                        pom(i) <= pom(i+1);
                    end loop;
                    pom(5) <= R_ulaz;
                when "01" =>
                -- pomjeranje ulijevo
                    for i in 5 downto 1 loop
                        pom(i) <= pom(i-1);
                    end loop;
                    pom(0) <= L_ulaz;
                when "10" =>
                -- zadrzavanje stanja
                    pom <= pom;
                when others =>
                    -- paralelni upis
                    pom <= ulaz;
            end case;
        end if;
    end process;
end Pomjeracki_Registar_beh;