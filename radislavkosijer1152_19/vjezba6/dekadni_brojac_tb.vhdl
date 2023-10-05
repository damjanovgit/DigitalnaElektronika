library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dekadni_brojac_tb is
end entity dekadni_brojac_tb;

architecture dekadni_brojac_tb_beh of dekadni_brojac_tb is

    component dekadni_brojac is
        port(
            clk, reset, up_down : in std_logic; 
            count : out std_logic_vector(3 downto 0)
        );
        end component dekadni_brojac;

        signal CLK_in: std_logic := '0';
        signal RST_in: std_logic := '1';
        signal UpDown_in: std_logic := '0';
        signal count_out: std_logic_vector(3 downto 0) := "0000";

        begin

            DUT: dekadni_brojac port map (CLK_in, RST_in, UpDown_in, count_out);

            process
            begin

                wait for 1 ns;
                CLK_in <= '1';
                wait for 1 ns;
                assert(count_out = "1001") report "Neispravan izlaz kada se brojac resetuje pri brojanju unazad" severity error;

                CLK_in <= '0';
                UpDown_in <= '1';
                RST_in <= '1';
                wait for 1 ns;
                CLK_in <= '1';
                wait for 1 ns;
                assert(count_out = "0000") report "Neispravan izlaz kada se brojac resetuje pri brojanju unaprijed" severity error;

                RST_in <= '0';
                for i in 1 to 9 loop
                    CLK_in <= '0';
                    wait for 1 ns;
                    CLK_in <= '1';
                    wait for 1 ns;

                    assert(count_out = std_logic_vector(to_unsigned(i, 4))) report "Neispravan izlaz kada brojac prelazi unaprijed na " & integer'image(i) severity error;
                end loop;
                
                CLK_in <= '0';
                wait for 1 ns;
                CLK_in <= '1';
                wait for 1 ns;
                assert(count_out = "0000") report "Neispravan izlaz kada brojac prelazi sa 9  na 0" severity error;

                CLK_in <= '0';
                UpDown_in <= '0';
                RST_in <= '1';
                wait for 1 ns;
                CLK_in <= '1';
                wait for 1 ns;
                assert(count_out = "1001") report "Neispravan izlaz kada se brojac resetuje pri brojanju unazad" severity error;
                
                RST_in <= '0';
                for m in 8 downto 0 loop
                    CLK_in <= '0';
                    wait for 1 ns;
                    CLK_in <= '1';
                    wait for 1 ns;

                    assert(count_out = std_logic_vector(to_unsigned(m, 4))) report "Neispravan izlaz kada brojac prelazi unazad na " & integer'image(m) severity error;
                end loop;

                CLK_in <= '0';
                wait for 1 ns;
                CLK_in <= '1';
                wait for 1 ns;
                assert(count_out = "1001") report "Neispravan izlaz kada brojac prelazi sa 0  na 9" severity error;

                assert false report "Test zavrsen!" severity note;
                wait;
                end process;
end architecture dekadni_brojac_tb_beh; 