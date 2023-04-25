library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_ram_memory is
    generic(
        ADDR_SIZE : integer := 4;
        WORD_SIZE : integer := 8
    );
    port(
        CLK, OE, WE : in std_logic;
        address : in std_logic_vector(ADDR_SIZE-1 downto 0);
        data_in : in std_logic_vector(WORD_SIZE-1 downto 0);
        data_out : out std_logic_vector(WORD_SIZE-1 downto 0)
    );
end my_ram_memory;

architecture my_ram_memory_beh of my_ram_memory is

    type memory_array is array(0 to 2**ADDR_SIZE-1) of std_logic_vector(WORD_SIZE-1 downto 0);

    signal addr_index : integer := 0;
    signal mem_array : memory_array;
begin
    process(CLK) begin
        if(rising_edge(CLK)) then
            addr_index <= to_integer(unsigned(address));
            if(OE = '1') then
                data_out <= mem_array(addr_index);
            elsif(WE = '1') then
                mem_array(addr_index) <= data_in;
            end if;
        end if;
    end process;
end my_ram_memory_beh;

-- Posto je u tekstu zadatka data velicina RAM memorije od 128b, mozemo uzeti da je velicina memorijske rijeci 8b sto znaci da cemo onda imati 16 
-- ukupnih memorijskih lokacija, pa su nam potrebne adrese od 4b da bi ove lokacije adresirali.