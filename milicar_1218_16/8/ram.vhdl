library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is port (
    address : in std_logic_vector (3 downto 0);
    clock, w_r : in std_logic;
    data_in : in std_logic_vector (7 downto 0);
    data_out : out std_logic_vector (7 downto 0)
);
end ram;

architecture ram_beh of ram is 

    type ram_type is array (15 downto 0) of std_logic_vector(7 downto 0); -- 16x8 = 128b
    signal ram_pom : ram_type := (others => (others => '0'));
    signal read_address : integer range 0 to 15 := 0;
    signal write_enable : std_logic := '0'; -- Promenjen tip na std_logic
    signal write_data : std_logic_vector(7 downto 0) := (others => '0');
    
begin
    process(clock)
    begin
        if rising_edge(clock) then   
            read_address <= to_integer(unsigned(address));
            write_enable <= w_r;
            if write_enable = '1' then -- Provera za aktiviranje upisa
                ram_pom(read_address) <= data_in;
            end if;
        end if;   
    end process;
    
    data_out <= ram_pom(read_address);   
end ram_beh;
