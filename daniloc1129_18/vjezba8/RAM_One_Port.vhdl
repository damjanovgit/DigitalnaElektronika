library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_One_Port is
generic
(
	byte_size : integer := 8;
    memory_size : integer := 128;
    address_size : integer := 7
);
port
(
    CLK, Read_Write : in std_logic; ------	Read_Write = '1' for writing , Read_Write = '0' for reading data
	input : in std_logic_vector (byte_size-1 downto 0);
    Address : in std_logic_vector(address_size-1 downto 0);
    output : out std_logic_vector (byte_size-1 downto 0)
);
end entity RAM_One_Port;


architecture RAM_One_Port_beh of RAM_One_Port is

    type RAM_array is array(0 to memory_size-1) of std_logic_vector(byte_size-1 downto 0);
    signal arr : RAM_array;

begin
    RAM_One_Port_proc:process(CLK)
    begin
        if(rising_edge(CLK)) then 
            if(Read_Write = '0') then  output <= arr(to_integer(unsigned(Address)));
            elsif(Read_Write = '1') then  arr(to_integer(unsigned(Address))) <= input;
            end if;
        end if;
    end process RAM_One_Port_proc;
end architecture RAM_One_Port_beh;