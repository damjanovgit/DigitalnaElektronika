library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_One_Port_TB is
end entity RAM_One_Port_TB;

architecture RAM_One_Port_TB_beh of RAM_One_Port_TB is
component RAM_One_Port is
generic(
			byte_size : integer := 8;
			memory_size : integer := 128;
			address_size : integer := 7
		);
port(
        CLK, Read_Write : in std_logic; 
		input : in std_logic_vector (byte_size-1 downto 0);
		Address : in std_logic_vector(address_size-1 downto 0);
		output : out std_logic_vector (byte_size-1 downto 0) 
    );
end component RAM_One_Port;

	constant byte_size_in : integer := 8;
    constant memory_size_in : integer := 128;
    constant address_size_in : integer := 7;
  
    signal CLK_in: std_logic;
    signal Read_Write_in: std_logic := '1';
    signal Address_in : std_logic_vector(address_size_in-1 downto 0);
    signal input_in: std_logic_vector(byte_size_in-1 downto 0);
    signal output_out: std_logic_vector(byte_size_in-1 downto 0);

begin

    DUT: RAM_One_Port generic map (byte_size =>byte_size_in, memory_size => memory_size_in, address_size => address_size_in) 
	port map (CLK => CLK_in, Read_Write => Read_Write_in, Address => Address_in, input => input_in, output => output_out);

    RAM_One_Port_proc: process
    begin

        for i in 0 to memory_size_in-1 loop
			CLK_in <= '0';
            Address_in <= std_logic_vector(to_unsigned(i, Address_in'length));
            input_in <= std_logic_vector(to_unsigned(i, input_in'length));
			wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
        end loop;
        
        Read_Write_in <= '0';
		
        for i in 0 to memory_size_in-1 loop
            Address_in <= std_logic_vector(to_unsigned(i, Address_in'length));
            CLK_in <= '0';
            wait for 5 ns;
			CLK_in <= '1';
			wait for 5 ns;
            assert(i = to_integer(unsigned(output_out))) report "Value at memory location should be : " & integer'image(i) severity error;
        end loop;

        assert false report "Test done." severity note;
        wait;
    end process RAM_One_Port_proc;
end architecture RAM_One_Port_TB_beh;