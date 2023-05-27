library ieee;
use ieee.std_logic_1164.all;

entity stac_reg_10 is
port(   data_in : in std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(9 downto 0);
        clk, clr, e : in std_logic
); end stac_reg_10;

architecture beh_stac_reg_10 of stac_reg_10 is
begin
    process(clk)
    begin
        if (rising_edge(clk) and clr = '1') then data_out <= "0000000000";
        elsif (rising_edge(clk) and clr = '0' and E = '1') then data_out <= data_in;
        end if;
    end process;
end beh_stac_reg_10;