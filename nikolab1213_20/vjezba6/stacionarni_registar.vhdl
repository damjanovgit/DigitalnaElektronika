library ieee;
use ieee.std_logic_1164.all;

entity stacionarni_registar is
port(
    data_in : in std_logic_vector(9 downto 0);
    data_out : out std_logic_vector(9 downto 0);
    enable, clk, clr : in std_logic
);
end stacionarni_registar;

architecture stacionarni_registar_beh of stacionarni_registar is
signal stanje : std_logic_vector(9 downto 0) := "0000000000";
begin
    process(clk, clr)
    begin
        if (clk = '1' and clk'event) then
            if (clr = '1') then
                stanje <= "0000000000";
            elsif (enable = '1') then
                stanje <= data_in;
            end if;
        end if;
    data_out <= stanje;
    end process;
end stacionarni_registar_beh;