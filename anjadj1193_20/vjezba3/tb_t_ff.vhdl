library ieee;
use ieee.std_logic_1164.all;

entity tb_t_ff is
end tb_t_ff;

architecture beh_tb_t_ff of tb_t_ff is

    component t_ff is
    port(t,clk : in std_logic;
         q,qnot : out std_logic
    );
    end component;

    signal t, clk, q, qnot : std_logic := '0';

begin

    hac: t_ff port map(
            clk => clk,
            q => q,
            t => t,
            qnot => qnot
    );

    clock: process
    begin
        clk <= '0';     t <= '1';      wait for 5 ns;
        assert (q = '0' and qnot = '1') report "Greska : Nevalidno pocetno stanje" severity error;

        clk <= '1';     t <= '1';      wait for 5 ns;
        assert (q = '0' and qnot = '1') report "Greska : clk = 1 , t = 1 , qn-1 = 0 -> q = 0" severity error;

        clk <= '0';     t <= '0';      wait for 5 ns;
        assert (q = '0' and qnot = '1') report "Greska : clk = 0 , t = 0 , qn-1 = 0 -> q = 0" severity error;

        clk <= '1';     t <= '0';      wait for 5 ns;
        assert (q = '0' and qnot = '1') report "Greska : clk = 1 , t = 0 , qn-1 = 0 -> q = 0" severity error;

        clk <= '0';     t <= '1';      wait for 5 ns;
        assert (q = '1' and qnot = '0') report "Greska : clk = 0 , t = 1 , qn-1 = 0 -> q = 1" severity error;

        clk <= '1';     t <= '1';      wait for 5 ns;
        assert (q = '1' and qnot = '0') report "Greska : clk = 1 , t = 1 , qn-1 = 1 -> q = 1" severity error;

        clk <= '0';     t <= '1';      wait for 5 ns;
        assert (q = '0' and qnot = '1') report "Greska : clk = 0 , t = 1 , qn-1 = 1 -> q = 0" severity error;

        clk <= '1';     t <= '1';      wait for 5 ns;
        assert (q = '0' and qnot = '1') report "Greska : clk = 1 , t = 1 , qn-1 = 0 -> q = 0" severity error;

        clk <= '0';     t <= '1';      wait for 5 ns;
        assert (q = '1' and qnot = '0') report "Greska : clk = 0 , t = 1 , qn-1 = 0 -> q = 1" severity error;

        assert false report "Test zavrsen" severity note;
        wait;

    end process;
    
end beh_tb_t_ff;