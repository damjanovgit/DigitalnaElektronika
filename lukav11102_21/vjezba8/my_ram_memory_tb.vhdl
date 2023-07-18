library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_ram_memory_tb is
    generic(
            TB_ADDR_SIZE : integer := 7;
            TB_WORD_SIZE : integer := 8
    );
end my_ram_memory_tb;

architecture my_ram_memory_tb_beh of my_ram_memory_tb is

    component my_ram_memory is
        generic(
            ADDR_SIZE : integer := 7;
            WORD_SIZE : integer := 8
        );
        port(
            CLK, OE, WE : in std_logic;
            address : in std_logic_vector(ADDR_SIZE-1 downto 0);
            data_in : in std_logic_vector(WORD_SIZE-1 downto 0);
            data_out : out std_logic_vector(WORD_SIZE-1 downto 0)
        );
    end component;

    signal clock,output_enable, write_enable : std_logic;
    signal addr : std_logic_vector(TB_ADDR_SIZE-1 downto 0);
    signal d_in, d_out : std_logic_vector(TB_WORD_SIZE-1 downto 0);

begin
    lbl: my_ram_memory port map(CLK => clock, OE => output_enable, WE => write_enable, address => addr, data_in => d_in, data_out => d_out);
    process begin
        clock <= '0';
        write_enable <= '1';
        wait for 10 ns;
        for i in 0 to 2**TB_ADDR_SIZE-1 loop
            addr <= std_logic_vector(to_unsigned(i, addr'length));
            d_in <= std_logic_vector(to_unsigned(i, d_in'length));
            clock <= '1';
            wait for 10 ns;
            clock <= '0';
            wait for 10 ns;
        end loop;
        write_enable <= '0';
        output_enable <= '1';
        for i in 0 to 2**TB_ADDR_SIZE-1 loop
            addr <= std_logic_vector(to_unsigned(i, addr'length));
            clock <= '1';
            wait for 10 ns;
            assert(i = to_integer(unsigned(d_out))) report "Failed memory location, i = " & integer'image(i) severity error;
            clock <= '0';
            wait for 10 ns;
        end loop;

        assert false report "Test finished." severity note;
        wait;
    end process;
end my_ram_memory_tb_beh ;