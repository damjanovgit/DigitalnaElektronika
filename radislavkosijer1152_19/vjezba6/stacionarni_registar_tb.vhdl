library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stacionarni_registar_tb is
end stacionarni_registar_tb;

architecture stacionarni_registar_tb_beh of stacionarni_registar_tb is
    component stacionarni_registar is
        port(
            CLR, CLK, EN : in std_logic;
            data_in : in std_logic_vector(9 downto 0);
            data_out : out std_logic_vector(9 downto 0)
        );
    end component;

    signal clock, clear, enable : std_logic :='0';
    signal d_in, d_out : std_logic_vector(9 downto 0) := "0000000000";
begin
    lbl: stacionarni_registar port map(CLR => clear, CLK => clock, EN => enable, data_in => d_in, data_out => d_out);
    process begin
        clock <= '0';
        wait for 10 ns;
        assert (d_out = "0000000000") report "Failed beginning clk = 0" severity error;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "0000000000") report "Failed beginning clk = 1" severity error;
        for i in 1 to 1023 loop
            clock <= '0';
            wait for 10 ns;
            clear <= '0';
            enable <= '1';
            d_in <= std_logic_vector(to_unsigned(i, d_in'length));
            clock <= '1';
            wait for 10 ns;
            assert (d_out = d_in) report "Failed i = " & integer'image(i) severity error;
        end loop;
        clock <= '0';
        wait for 10 ns;
        enable <= '0';
        clear <= '1';
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "0000000000") report "Failed clear = 1" severity error;
        
        assert false report "Test finished." severity note;
        wait;
    end process;
end stacionarni_registar_tb_beh ; 