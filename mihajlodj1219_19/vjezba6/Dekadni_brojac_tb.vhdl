library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Dekadni_brojac_tb is
end entity Dekadni_brojac_tb;

architecture arh_Dekadni_brojac_tb of Dekadni_brojac_tb is

    component Dekadni_brojac is
        port(
            clk, reset, up_down : in std_logic; 
            count : out std_logic_vector(3 downto 0)
        );
        end component Dekadni_brojac;

        signal clk_in: std_logic := '0';
        signal reset_in: std_logic := '1';
        signal up_down_in: std_logic := '0';
        signal count_out: std_logic_vector(3 downto 0) := "0000";

        begin

            DUT: Dekadni_brojac port map (clk_in, reset_in, up_down_in, count_out);

            parametri: process
            begin

                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(count_out = "1001") report "Neispravan izlaz kada se brojac resetuje pri brojanju unazad" severity error;

                clk_in <= '0';
                up_down_in <= '1';
                reset_in <= '1';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(count_out = "0000") report "Neispravan izlaz kada se brojac resetuje pri brojanju unaprijed" severity error;

                reset_in <= '0';
                for i in 1 to 9 loop
                    clk_in <= '0';
                    wait for 1 ns;
                    clk_in <= '1';
                    wait for 1 ns;

                    assert(count_out = std_logic_vector(to_unsigned(i, 4))) report "Neispravan izlaz kada brojac prelazi unaprijed na " & integer'image(i) severity error;
                end loop;
                
                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(count_out = "0000") report "Neispravan izlaz kada brojac prelazi sa 9  na 0" severity error;

                clk_in <= '0';
                up_down_in <= '0';
                reset_in <= '1';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(count_out = "1001") report "Neispravan izlaz kada se brojac resetuje pri brojanju unazad" severity error;
                
                reset_in <= '0';
                for m in 8 downto 0 loop
                    clk_in <= '0';
                    wait for 1 ns;
                    clk_in <= '1';
                    wait for 1 ns;

                    assert(count_out = std_logic_vector(to_unsigned(m, 4))) report "Neispravan izlaz kada brojac prelazi unazad na " & integer'image(m) severity error;
                end loop;

                clk_in <= '0';
                wait for 1 ns;
                clk_in <= '1';
                wait for 1 ns;
                assert(count_out = "1001") report "Neispravan izlaz kada brojac prelazi sa 0  na 9" severity error;

                assert false report "Test zavrsen!" severity note;
                wait;
                end process parametri;
end architecture arh_Dekadni_brojac_tb; 