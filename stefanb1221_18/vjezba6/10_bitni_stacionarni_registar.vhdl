library ieee;
use ieee.std_logic_1164.all;

entity stat_register is
    port
    (
        clk, clr, oe : in std_logic;
        data_in : in std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(9 downto 0)
    );
end entity stat_register;

architecture behavior of stat_register is
    signal temp_data : std_logic_vector(9 downto 0) := "0000000000";
begin
    process (clk)
    begin
        if ( rising_edge(clk)) then 
            if ( clr = '1' ) then
                temp_data <= "0000000000";
            elsif ( oe = '1' ) then 
                temp_data <= data_in;
            end if;
        end if;
    end process;
end behavior;