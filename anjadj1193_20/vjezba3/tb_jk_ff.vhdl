library ieee;
use ieee.std_logic_1164.all;

entity tb_jk_ff is
end tb_jk_ff;

architecture beh_tb_jk_ff of tb_jk_ff is

    component jk_ff is
    port(k,j,clk : in std_logic;
         q,qnot : out std_logic
    );
    end component;

    signal k, j, clk, q, qnot : std_logic;

    begin

        hac : jk_ff port map(
                qnot => qnot,
                clk => clk,
                k => k,
                j => j,
                q => q
        );

       clock : process
        begin
            clk <= '0';     j <= '1';   k <= '0';   wait for 10 ns;
            assert (q = '0') report "Greska : Neregularno pocetno stanje" severity error;

            clk <= '1';     j <= '1';   k <= '0';    wait for 5 ns;
            assert (q = '0') report "Greska : clk = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '1';     j <= '0';   k <= '0';    wait for 5 ns;
            assert (q = '0') report "Greska : clk = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '0';     j <= '0';   k <= '0';    wait for 5 ns;
            assert (q = '1') report "Greska : clk = 0 , qm = 1 -> q = 1" severity error;

            clk <= '0';     j <= '0';   k <= '1';    wait for 5 ns;
            assert (q = '1') report "Greska : clk = 0 , qm = 1 -> q = 1" severity error;

            clk <= '1';     j <= '0';   k <= '1';    wait for 10 ns;
            assert (q = '1') report "Greska : clk = 0 , qn-1 = 1 -> q = 1" severity error;

            clk <= '0';     j <= '0';   k <= '1';    wait for 2.5 ns;
            assert (q = '0') report "Greska : clk = 0 , qm = 0 -> q = 0" severity error;

            clk <= '0';     j <= '1';   k <= '1';    wait for 2.5 ns;
            assert (q = '0') report "Greska : clk = 0 , qm = 0 -> q = 0" severity error;

            clk <= '0';     j <= '1';   k <= '0';    wait for 5 ns;
            assert (q = '0') report "Greska : clk = 0 , qm = 0 -> q = 0" severity error;

            clk <= '1';     j <= '1';   k <= '1';    wait for 10 ns;
            assert (q = '0') report "Greska : clk = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '0';     j <= '1';   k <= '1';    wait for 10 ns;
            assert (q = '1') report "Greska : clk = j = k = 1, qn-1 = 0, clk = 0 -> q = 1" severity error;
            
            assert false report "Test zavrsen" severity note;
            wait;

        end process;

end beh_tb_jk_ff;