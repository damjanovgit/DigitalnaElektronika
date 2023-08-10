library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stac_register_tb is
end stac_register_tb;

architecture behavior of stac_register_tb is
    component stat_register is
        port(
            clk, clr, oe : in std_logic;
            data_in : in std_logic_vector(9 downto 0);
            data_out : out std_logic_vector(9 downto 0)
        );
    end component;

    signal clock, clear, enable : std_logic :='0';
    signal d_in, d_out : std_logic_vector(9 downto 0) := "0000000000";
begin
    lbl: stat_register port map(clr => clear, clk => clock, oe => enable, data_in => d_in, data_out => d_out);
    process begin
        clock <= '0';
        wait for 10 ns;
        assert (d_out = "0000000000") report "Greska kada je CLOCK = 0" severity error;

        for i in 1 to 1023 loop
            clock <= '0';
            wait for 10 ns;
            clear <= '0';
            enable <= '1';
            d_in <= std_logic_vector(unsigned(d_in) + 1);
            clock <= '1';
            wait for 10 ns;
            assert (d_out = d_in) report "Greska za i = " & integer'image(i) severity error;
        end loop;

        clock <= '0';
        wait for 10 ns;
        enable <= '0';
        wait for 10 ns;
        clear <= '1';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "0000000000") report "Greska kada je CLEAR = 1" severity error;
        
        assert false report "Kraj testa" severity note;
        wait;
    end process;
end behavior ; 