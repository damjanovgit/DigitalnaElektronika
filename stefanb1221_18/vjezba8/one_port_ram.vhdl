library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_port_ram is
    port ( 
            clk     : in std_logic;
            data_in : in std_logic_vector(7 downto 0);
            write_en: in std_logic;
            address : in std_logic_vector(6 downto 0);
            data_out: out std_logic_vector(7 downto 0));
end one_port_ram;

architecture behavior of one_port_ram is
    type ram_array is array (0 to 127) of std_logic_vector(7 downto 0);
    signal ram : ram_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if write_en = '1' then
                ram(to_integer(unsigned(address))) <= data_in;
            end if;
            data_out <= ram(to_integer(unsigned(address)));
        end if;
    end process;
end behavior;
