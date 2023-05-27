library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop_tb is
end D_flipflop_tb;

architecture arh_D_testbench of D_flipflop_tb is

    component D_flipflop is
        port(
            D, CP : in std_logic;
            Q, Qnot : out std_logic
        );
    end component;

    signal D_in: std_logic := '1';
    signal CP_in: std_logic := '1';
    signal Q_out: std_logic := '1';
    signal Qnot_out: std_logic := '0';

    begin

        DUT: D_flipflop port map(D_in, CP_in, Q_out, Qnot_out);

        parametri: process
        begin
            
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and Qnot_out = '0') report "Neispravan izlaz kada je D na visokom nivou" severity error;

            CP_in <= '1';
            D_in <= '0';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qnot_out = '1') report "Neispravan izlaz kada je D na visokom nivou" severity error;

            CP_in <= '1';
            D_in <= '1';
            wait for 1 ns;
            CP_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and Qnot_out = '0') report "Neispravan izlaz kada je D na visokom nivou" severity error;

            assert false report "Test zavrsen!" severity note;
            wait; 

            end process parametri;
 end arh_D_testbench;