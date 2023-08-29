library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
port(
    clk, we, oe : in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    address : in std_logic_vector(6 downto 0);
    data_out : out std_logic_vector(7 downto 0)
);
end ram;

architecture ram_beh of ram is
    type memorija is array(0 to 127) of std_logic_vector(7 downto 0);
    signal podaci : memorija;
    signal index : integer := 0;
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            index <= to_integer(unsigned(address));
            if (oe = '1') then
                data_out <= podaci(index);
            elsif (we = '1') then
                podaci(index) <= data_in;
            end if;
        end if;
    end process;
end ram_beh;