library ieee;
use ieee.std_logic_1164.all;

entity stacionarni_reg is
    port (
        clk, clr, ld: in std_logic;
        data_in: in std_logic_vector(9 downto 0);
        data_out: out std_logic_vector(9 downto 0)
    );
end entity stacionarni_reg;

architecture stacionarni_reg_beh of stacionarni_reg is
    signal stanje: std_logic_vector(9 downto 0) := "0000000000";
begin
    process(clk, clr, ld)
    begin
        if clr = '1' then
            stanje <= "0000000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                stanje <= data_in;
            end if;
        end if;
    end process;
    
    data_out <= stanje;
end stacionarni_reg_beh;
