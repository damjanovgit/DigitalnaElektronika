library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity One_Port_RAM is
generic(
    memory_size : integer := 128;
    word_size : integer := 8;
    address_size : integer := 7
);
port(
    CLK, RW : in std_logic; --RW = '1' upis podataka, RW = '0' citanje podataka
    ADDRESS : in std_logic_vector(address_size-1 downto 0);
    DATA_IN : in std_logic_vector (word_size-1 downto 0);
    DATA_OUT : out std_logic_vector (word_size-1 downto 0)
);
end entity One_Port_RAM;

architecture arh_One_Port_RAM of One_Port_RAM is

    type RAM_memory is array(0 to memory_size-1) of std_logic_vector(word_size-1 downto 0);
    signal mem : RAM_memory;

begin
    process(CLK)
    begin
        if(rising_edge(CLK)) then
            if(RW = '0') then
                DATA_OUT <= mem(to_integer(unsigned(ADDRESS)));
            elsif(RW = '1') then
                mem(to_integer(unsigned(ADDRESS))) <= DATA_IN;
            end if;
        end if;
    end process;
end architecture arh_One_Port_RAM;