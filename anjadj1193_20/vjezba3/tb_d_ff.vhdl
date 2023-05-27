library ieee;
use ieee.std_logic_1164.all;

entity tb_d_ff is
end tb_d_ff;

architecture beh_tb_d_ff of tb_d_ff is
    component d_ff is
    port( d, clk : in std_logic;
          q, qnot : out std_logic
    );
    end component;

    signal d, clk, q, qnot : std_logic :='0';

    begin

        hac : d_ff port map(
            d => d,
            clk => clk,
            q => q,
            qnot => qnot
        );

        clock : process
        begin

            clk <= '0';     d <= '0';       wait for 10 ns;
            assert (q = '0' and qnot = '1') report "Greska : Nevalidno pocetno stanje" severity error;

            clk <= '1';     d <= '0';       wait for 10 ns;
            assert (q = '0' and qnot = '1') report "Greska : clk = 1 , d = 0 , qn-1 = 0 -> q = 0" severity error;

            clk <= '0';     d <= '1';       wait for 10 ns;
            assert (q = '0' and qnot = '1') report "Greska : clk = 0 , d = 1 , qm = 0 -> q = 0" severity error;

            clk <= '1';     d <= '1';       wait for 10 ns;
            assert (q = '0' and qnot = '1') report "Greska : clk = 1 , d = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '0';     d <= '1';       wait for 10 ns;
            assert (q = '1' and qnot = '0') report "Greska : clk = 0 , d = 1 , qm = 1 -> q = 1" severity error;

            clk <= '1';     d <= '1';       wait for 10 ns;
            assert (q = '1' and qnot = '0') report "Greska : clk = 1 , d = 1 , qn-1 = 1 -> q = 1" severity error;

            clk <= '0';     d <= '0';       wait for 10 ns;
            assert (q = '1' and qnot = '0') report "Greska : clk = 0 , d = 0 , qm = 1 -> q = 1" severity error;

            clk <= '1';     d <= '0';       wait for 10 ns;
            assert (q = '1' and qnot = '0') report "Greska : clk = 1 , d = 0 , qn-1 = 1 -> q = 1" severity error;

            clk <= '0';     d <= '0';       wait for 10 ns;
            assert (q = '0' and qnot = '1') report "Greska : clk = 0 , d = 0 , qm = 0 -> q = 0" severity error;

            assert false report "Test zavrsen" severity note;
            wait;

        end process;
end beh_tb_d_ff;
