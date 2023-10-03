library ieee;
use ieee.std_logic_1164.all;

entity RS_flipflop_tb is
end RS_flipflop_tb;

architecture RS_testbench_beh of RS_flipflop_tb is

    component RS_flipflop is
        port(
            S, R, CP : in std_logic;
            Q, Qnot : out std_logic
        );
    end component;

    signal S_in: std_logic := '1';
    signal R_in: std_logic := '0';
    signal CP_in: std_logic := '1';
    signal Q_out: std_logic := '1';
    signal Qnot_out: std_logic := '0';

    begin

        DUT: RS_flipflop port map(S_in, R_in, CP_in, Q_out, Qnot_out);

        process
        begin

            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and Qnot_out = '0') report "Neispravan izlaz kada je S na visokom nivou" severity error;

            CP_in <= '1';
            R_in <= '1';
            S_in <= '0';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Neispravan izlaz kada je R na visokom nivou" severity error;

            CP_in <= '1';
            S_in <= '0';
            R_in <= '0';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Izlaz nije zadrzao prethodno stanje kada su S i R na niskom nivou" severity error;

            CP_in <= '1';
            S_in <= '1';
            R_in <= '1';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = 'X' and Qnot_out = 'X') report "Izlaz nije nedefinisan kada su S i R na visokom nivou" severity error;
            

            assert false report "Test zavrsen!" severity note;
            wait;
            end process;
 end RS_testbench_beh;