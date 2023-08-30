library ieee;
use ieee.std_logic_1164.all;

entity shift_register_tb is
end entity shift_register_tb;

architecture behavior of shift_register_tb is

    component shift_register is
        port(
            clk, rst, l_in, r_in : in std_logic;
            mode : in std_logic_vector(1 downto 0);
            p_in : in std_logic_vector(5 downto 0);
            p_out : out std_logic_vector(5 downto 0)
        );
        end component shift_register;

        signal clock: std_logic := '0';
        signal reset: std_logic := '1';
        signal l_input: std_logic := '1';
        signal r_input: std_logic := '0';
        signal mode_in: std_logic_vector(1 downto 0) := "10";
        signal p_input: std_logic_vector(5 downto 0) := "100000";
        signal p_output: std_logic_vector(5 downto 0) := "000000";

        begin

            DUT: shift_register port map (clock, reset, l_input, r_input, mode_in, p_input, p_output);

            process
            begin

                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "100000") report "Neispravan izlaz prilikom paralelnog upisa" severity error;

                clock <= '0';
                mode_in <= "01";
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "010000") report "Neispravan izlaz prilikom upisa desno" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "001000") report "Neispravan izlaz prilikom pomjeranja udesno" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000100") report "Neispravan izlaz prilikom pomjeranja udesno" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000010") report "Neispravan izlaz prilikom pomjeranja udesno" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000001") report "Neispravan izlaz prilikom pomjeranja udesno" severity error;

                clock <= '0';
                reset <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000000") report "Neispravan izlaz prilikom asinhronog resetovanja" severity error;

                clock <= '0';
                mode_in <= "00";
                reset <= '1';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000001") report "Neispravan izlaz prilikom pomjeranja ulijevo" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000011") report "Neispravan izlaz prilikom pomjeranja ulijevo" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "000111") report "Neispravan izlaz prilikom pomjeranja ulijevo" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "001111") report "Neispravan izlaz prilikom pomjeranja ulijevo" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "011111") report "Neispravan izlaz prilikom pomjeranja ulijevo" severity error;

                clock <= '0';
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "111111") report "Neispravan izlaz prilikom pomjeranja ulijevo" severity error;

                clock <= '0';
                mode_in <= "11";
                wait for 1 ns;
                clock <= '1';
                wait for 1 ns;
                assert(p_output = "111111") report "Neispravan izlaz prilikom zadrzavanja prethodnog stanja" severity error;

            assert false report "Kraj testa!" severity note;
            wait;
            end process;
end architecture;