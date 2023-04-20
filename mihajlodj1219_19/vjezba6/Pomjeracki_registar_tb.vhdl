library ieee;
use ieee.std_logic_1164.all;

entity Pomjeracki_registar_tb is
end entity Pomjeracki_registar_tb;

architecture arh_Pomjeracki_registar_tb of Pomjeracki_registar_tb is

    component Pomjeracki_registar is
        port(
            clk, rst, L_input, R_input: in std_logic;
            mode : in std_logic_vector(1 downto 0);
            parallel_input : in std_logic_vector(5 downto 0);
            parallel_output : out std_logic_vector(5 downto 0)
        );
        end component Pomjeracki_registar;

        signal clk_in: std_logic := '0';
        signal rst_in: std_logic := '1';
        signal L_input_in: std_logic := '1';
        signal R_input_in: std_logic := '0';
        signal mode_in: std_logic_vector(1 downto 0) := "10";
        signal parallel_input_in: std_logic_vector(5 downto 0) := "100000";
        signal parallel_output_out: std_logic_vector(5 downto 0) := "000000";

        begin

            DUT: Pomjeracki_registar port map (clk_in, rst_in, L_input_in, R_input_in, mode_in, parallel_input_in, parallel_output_out);

            parametri: process
            begin

                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "100000") report "Neispravan izlaz kada se vrsi paralelni upis" severity error;

                clk_in <= '0';
                mode_in <= "01";
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "010000") report "Neispravan izlaz kada se vrsi pomjeranje udesno" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "001000") report "Neispravan izlaz kada se vrsi pomjeranje udesno" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000100") report "Neispravan izlaz kada se vrsi pomjeranje udesno" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000010") report "Neispravan izlaz kada se vrsi pomjeranje udesno" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000001") report "Neispravan izlaz kada se vrsi pomjeranje udesno" severity error;

                clk_in <= '0';
                rst_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000000") report "Neispravan izlaz kada se vrsi asinhrono resetovanje" severity error;

                clk_in <= '0';
                mode_in <= "00";
                rst_in <= '1';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000001") report "Neispravan izlaz kada se vrsi pomjeranje ulijevo" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000011") report "Neispravan izlaz kada se vrsi pomjeranje ulijevo" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "000111") report "Neispravan izlaz kada se vrsi pomjeranje ulijevo" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "001111") report "Neispravan izlaz kada se vrsi pomjeranje ulijevo" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "011111") report "Neispravan izlaz kada se vrsi pomjeranje ulijevo" severity error;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "111111") report "Neispravan izlaz kada se vrsi pomjeranje ulijevo" severity error;

                clk_in <= '0';
                mode_in <= "11";
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(parallel_output_out = "111111") report "Neispravan izlaz kada se vrsi zadrzavanje prethodnog stanje" severity error;

            assert false report "Test zavrsen!" severity note;
            wait;
            end process parametri;
end architecture arh_Pomjeracki_registar_tb;