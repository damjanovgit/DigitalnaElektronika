library ieee;
use ieee.std_logic_1164.all;

entity Stac_registar is
port(
    clock, reset, enable: in std_logic;
    input_data : in std_logic_vector(9 downto 0);
    output_data : out std_logic_vector(9 downto 0)
);
end entity Stac_registar;

architecture arh_Stac_registar of Stac_registar is
    signal pom : std_logic_vector(9 downto 0) := "0000000000";
begin
    process(clock)
    begin
        if (rising_edge(clock) and enable = '1') then
            if(reset = '1') then
                pom <= "0000000000";
            else
                pom <= input_data;
            end if;
        end if;
    end process;

    output_data <= pom;
end architecture arh_Stac_registar; 