library IEEE;
use IEEE.std_logic_1164.all;

entity T_flipflop_tb is
end T_flipflop_tb;

architecture arh_T_flipflop of T_flipflop_tb is

    component T_flipflop is
        port(
            T, CP: in std_logic;
            Q, Qnot : out std_logic
        );
    end component T_flipflop;

    signal T_in : std_logic := '0';
    signal CP_in : std_logic := '1';
    signal Q_out : std_logic := '1';
    signal Qnot_out : std_logic := '0';

    begin

        DUT: T_flipflop port map(T_in,CP_in, Q_out, Qnot_out);

        parametri: process
        begin

            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and Qnot_out = '0') report "Izlaz nije zadrzao prethodno stanje kada je T na niskom nivou" severity error;

            CP_in <= '1';
            T_in <= '1';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Izlaz nije promijenio prethodno stanje kada je T na visokom nivou" severity error;

            CP_in <= '1';
            T_in <= '0';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Izlaz nije zadrzao prethodno stanje kada je T na niskom nivou" severity error;

            assert false report "Test done." severity note;
            wait;

        end process parametri;
end arh_T_flipflop;