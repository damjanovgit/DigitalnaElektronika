library ieee;
use ieee.std_logic_1164.all;

entity tb_rs_ff is
end tb_rs_ff;

architecture beh_tb_rs_ff of tb_rs_ff is

    component rs_ff is
    port(r,s,clk : in std_logic;
         q,qnot : out std_logic
    );
    end component;

    signal r, s, clk, q, qnot : std_logic;

    begin

        hac : rs_ff port map(
                qnot => qnot,
                clk => clk,
                r => r,
                s => s,
                q => q
        );

        clock : process
        begin
            clk <= '0';     s <= '1';   r <= '0';   wait for 10 ns;
            assert (q = '0') report "Greska : Neregularno pocetno stanje" severity error;

            clk <= '1';     s <= '1';   r <= '0';    wait for 5 ns;
            assert (q = '0') report "Greska : clk = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '1';     s <= '0';   r <= '0';    wait for 5 ns;
            assert (q = '0') report "Greska : clk = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '0';     s <= '0';   r <= '0';    wait for 5 ns;
            assert (q = '1') report "Greska : clk = 0 , qm = 1 -> q = 1" severity error;

            clk <= '0';     s <= '0';   r <= '1';    wait for 5 ns;
            assert (q = '1') report "Greska : clk = 0 , qm = 1 -> q = 1" severity error;

            clk <= '1';     s <= '0';   r <= '1';    wait for 10 ns;
            assert (q = '1') report "Greska : clk = 0 , qn-1 = 1 -> q = 1" severity error;

            clk <= '0';     s <= '0';   r <= '1';    wait for 2.5 ns;
            assert (q = '0') report "Greska : clk = 0 , qm = 0 -> q = 0" severity error;

            clk <= '0';     s <= '1';   r <= '1';    wait for 2.5 ns;
            assert (q = '0') report "Greska : clk = 0 , qm = 0 -> q = 0" severity error;

            clk <= '0';     s <= '1';   r <= '0';    wait for 5 ns;
            assert (q = '0') report "Greska : clk = 0 , qm = 0 -> q = 0" severity error;

            clk <= '1';     s <= '1';   r <= '1';    wait for 10 ns;
            assert (q = '0') report "Greska : clk = 1 , qn-1 = 0 -> q = 0" severity error;

            clk <= '0';     s <= '1';   r <= '1';    wait for 10 ns;
            assert (q = '-') report "Greska : ocekivano je neodredjeno stanje" severity error;
            
            assert false report "Test zavrsen" severity note;
            wait;

        end process;

end beh_tb_rs_ff;