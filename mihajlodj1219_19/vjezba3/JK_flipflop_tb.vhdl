library ieee;
use ieee.std_logic_1164.all;

entity JK_flipflop_tb is
end JK_flipflop_tb;

architecture arh_JK_testbench of JK_flipflop_tb is

    component JK_flipflop is
        port(
            J, K, CP : in std_logic;
            Q, Qnot : out std_logic
        );
    end component;

    signal J_in: std_logic := '1';
    signal K_in: std_logic := '0';
    signal CP_in: std_logic := '1';
    signal Q_out: std_logic := '1';
    signal Qnot_out: std_logic := '0';

    begin

        DUT: JK_flipflop port map(J_in, K_in, CP_in, Q_out, Qnot_out);

        parametri: process
        begin

            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and Qnot_out = '0') report "Neispravan izlaz kada je J na visokom nivou" severity error;

            CP_in <= '1';
            K_in <= '1';
            J_in <= '0';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Neispravan izlaz kada je K na visokom nivou" severity error;

            CP_in <= '1';
            J_in <= '0';
            K_in <= '0';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Izlaz nije zadrzao prethodno stanje kada su J i K na niskom nivou" severity error;

            CP_in <= '1';
            J_in <= '1';
            K_in <= '1';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and Qnot_out = '0') report "Izlaz nije invertovan kada su J i K na visokom nivou" severity error;

            assert false report "Test zavrsen!" severity note;
            wait; 

            end process parametri;
 end arh_JK_testbench;