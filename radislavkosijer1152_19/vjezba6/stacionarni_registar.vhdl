library ieee;

use ieee.std_logic_1164.all;

entity stacionarni_registar is
    port(
        CLR, CLK, EN: in std_logic;
        data_in : in std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(9 downto 0)
    );
end stacionarni_registar;

architecture stacionarni_registar_beh of stacionarni_registar is

signal tmp_out : std_logic_vector(9 downto 0) := "0000000000";

begin
    data_out <= tmp_out;
    process(CLK) 
    begin
        if(rising_edge(CLK)) then
            if(CLR = '1') then
                tmp_out <= "0000000000";
            elsif(EN = '1') then
                tmp_out <= data_in;
            end if;
        end if;
    end process;


end stacionarni_registar_beh;