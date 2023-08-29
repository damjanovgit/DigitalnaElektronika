library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is 

    generic
    (
        memory_size : integer := 128;
        word_size : integer :=8;
        address_size : integer := 7
    );

    port
    (    --  kada je read_write = 1 tada imamo upis podataka,a kada je read_write = 0 tada vrsimo citanje 
        CLK, read_write : in std_logic;  
        address : in std_logic_vector(address_size-1 downto 0);
        data_in : in std_logic_vector(word_size-1 downto 0);
        data_out : out std_logic_vector(word_size-1 downto 0)
    );
end ram;

architecture ram_beh of ram is 

   type  memory_array is array( 0 to memory_size) of std_logic_vector (word_size-1 downto 0);
   signal arddress_index : integer := 0;
   signal ram_array : memory_array;

begin

    process(CLK)
    begin

        if(rising_edge(CLK))then
            arddress_index <= to_integer(unsigned(address));

            if(read_write = '0')then
                data_out <= ram_array(arddress_index);
            elsif(read_write = '1')then
                ram_array(arddress_index) <= data_in;
            end if;
        end if;
    end process;
end ram_beh;            
            

