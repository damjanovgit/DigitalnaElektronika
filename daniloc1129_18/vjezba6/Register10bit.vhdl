library ieee;
use ieee.std_logic_1164.all;

entity Register10bit is
    port(
        CLK, clear, enable : in std_logic;
        input : in std_logic_vector(9 downto 0);
        output : out std_logic_vector(9 downto 0)
    );
end entity Register10bit;

architecture Register10bit_beh of Register10bit is

signal temp : std_logic_vector(9 downto 0) := "0000000000";

begin
    
    Register10bit_proc:process(CLK) 
    begin
        if(rising_edge(CLK)) then
            if(clear = '1') then temp <= "0000000000";
            elsif(enable = '1') then temp <= input; 
            end if;
        end if;
    end process Register10bit_proc;
	output <= temp;
end architecture Register10bit_beh;