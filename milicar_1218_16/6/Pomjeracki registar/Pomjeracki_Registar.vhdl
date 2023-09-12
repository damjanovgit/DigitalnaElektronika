library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Pomjeracki_Registar is
    port (
        clk, rst, rin, lin : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        data_in : in std_logic_vector(5 downto 0);
        data_out : out std_logic_vector(5 downto 0)
    );
end entity Pomjeracki_Registar;

architecture p_reg_arch of Pomjeracki_Registar is
    signal trenutno_stanje, prethodno_stanje : std_logic_vector(5 downto 0);
begin
    process(clk, rst)
    begin
        prethodno_stanje <= trenutno_stanje;
        if rst = '0' then
            trenutno_stanje <= "000000";
        elsif rising_edge(clk) then
            case mode is
                when "00" =>
                    trenutno_stanje <= trenutno_stanje; -- Nema promene
                when "01" =>
                    trenutno_stanje <= data_in; -- Paralelan upis
                when "10" =>
                    trenutno_stanje(0) <= rin;
                    for j in 1 to 5 loop
                        trenutno_stanje(j) <= prethodno_stanje(j-1); -- Pomak u levo
                    end loop;
                when "11" =>
                    trenutno_stanje(5) <= lin;
                    for j in 0 to 4 loop
                        trenutno_stanje(j) <= prethodno_stanje(j+1); -- Pomak u desno
                    end loop;
                when others =>
                    trenutno_stanje <= "000000";
            end case;
        end if;
    end process;

    data_out <= trenutno_stanje;
end p_reg_arch;
