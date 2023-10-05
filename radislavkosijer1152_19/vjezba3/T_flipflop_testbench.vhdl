library ieee;
use ieee.std_logic_1164.all;

entity T_flipflop_tb is
end entity T_flipflop_tb;

architecture T_flipflop_tb_beh of T_flipflop_tb is
component T_flipFlop is 
port(
       T, CLK : in std_logic;
       Q, nQ : out std_logic
    );
end component T_flipflop;

    signal T_in : std_logic :='0';
    signal CLK_in : std_logic :='1';
    signal Q_out : std_logic :='1';
    signal nQ_out : std_logic :='0';

    begin
        DUT: T_flipflop port map(T_in,CLK_in, Q_out, nQ_out);

        process
        begin

            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '1' and nQ_out = '0') report "Izlaz nije zadrzao prethodno stanje kada je T na niskom nivou" severity error;

            CLK_in <= '1';
            T_in <= '1';
            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and nQ_out = '1') report "Izlaz nije promijenio prethodno stanje kada je T na visokom nivou" severity error;

            CLK_in <= '1';
            T_in <= '0';
            wait for 1 ns;
            CLK_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and nQ_out = '1') report "Izlaz nije zadrzao prethodno stanje kada je T na niskom nivou" severity error;

            assert false report "Test done." severity note;
            wait;

        end process;
end architecture T_flipflop_tb_beh;