library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_tb is
end entity RAM_tb;

architecture arh_RAM_tb of RAM_tb is

    component RAM is
        generic(
            memory_size : integer := 128;
            word_size : integer := 8;
            address_size : integer := 7
        );
        port(
            CLK, RW : in std_logic; 
            ADDRESS : in std_logic_vector(address_size-1 downto 0);
            DATA_IN : in std_logic_vector (word_size-1 downto 0);
            DATA_OUT : out std_logic_vector (word_size-1 downto 0)
        );
    end component RAM;

    constant memory_s : integer := 128;
    constant word_s : integer := 8;
    constant address_s : integer := 7;
  

    signal clk_in: std_logic;
    signal rw_in: std_logic := '1';
    signal address_in : std_logic_vector(address_s-1 downto 0) := "0000000";
    signal data_in_in: std_logic_vector(word_s-1 downto 0);
    signal data_out_out: std_logic_vector(word_s-1 downto 0);

begin

    DUT: RAM generic map (memory_size => memory_s, word_size => word_s, address_size => address_s) port map (CLK => clk_in, RW => rw_in, ADDRESS => address_in, DATA_IN => data_in_in, DATA_OUT => data_out_out);

    parametri: process
    begin

        data_in_in <= "00000000";
        for i in 0 to memory_s-1 loop
            clk_in <= '0';
            wait for 1 ns;
            clk_in <= '1';
            wait for 1 ns;
            data_in_in <= std_logic_vector(unsigned(data_in_in) + 1);
            address_in <= std_logic_vector(unsigned(address_in) + 1);
        end loop;

        rw_in <= '0';
        address_in <= "0000000";
        for m in 0 to memory_s-1 loop
            clk_in <= '0';
            wait for 1 ns;
            clk_in <= '1';
            wait for 1 ns;
            assert(to_integer(unsigned(data_out_out)) = m) report "Neispravan izlaz kada se vrsi ispis sa adrese m" & integer'image(m) severity error; --jer se m poklapa sa decimalnom vrijednoscu adrese kao i upisane vrijednosti
            address_in <= std_logic_vector(unsigned(address_in) + 1);
        end loop;

        assert false report "Test zavrsen!" severity note;
        wait;
    end process parametri;

end architecture arh_RAM_tb;