library ieee;
use ieee.std_logic_1164.all;

entity JK_flipflop_tb is
end JK_flipflop_tb;

architecture JK_flipflop_testbench_beh of JK_flipflop_tb is

    component JK_flipflop is
        port(
            J, K, CLK : in std_logic;
            Q, nQ : out std_logic
        );
    end component;

    signal J_in: std_logic := '1';
    signal K_in: std_logic := '0';
    signal CLK_in: std_logic := '1';
    signal Q_out: std_logic := '1';
    signal nQ_out: std_logic := '0';

    begin

         DUT: JK_flipflop port map(J_in, K_in, CLK_in, Q_out, nQ_out);

        process
        begin

            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and nQ_out = '0') report "Neispravan izlaz kada je J na visokom nivou" severity error;

            CLK_in <= '1';
            K_in <= '1';
            J_in <= '0';
            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and nQ_out = '1') report "Neispravan izlaz kada je K na visokom nivou" severity error;

            CLK_in <= '1';
            J_in <= '0';
            K_in <= '0';
            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and nQ_out = '1') report "Izlaz nije zadrzao prethodno stanje kada su J i K na niskom nivou" severity error;

            CLK_in <= '1';
            J_in <= '1';
            K_in <= '1';
            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and nQ_out = '0') report "Izlaz nije invertovan kada su J i K na visokom nivou" severity error;

            assert false report "Test zavrsen!" severity note;
            wait; 

            end process ;
 end JK_flipflop_testbench_beh;