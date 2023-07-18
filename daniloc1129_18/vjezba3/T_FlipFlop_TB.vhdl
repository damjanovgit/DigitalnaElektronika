library ieee;
use ieee.std_logic_1164.all;

entity T_FlipFlop_TB is
end entity T_FlipFlop_TB;

architecture T_FlipFlop_TB_beh of T_FlipFlop_TB is
component T_FlipFlop is 
port(
       T, CLK : in std_logic;
       Q : out std_logic
    );
end component T_FlipFlop;

    signal T_in : std_logic :='0';
    signal CLK_in : std_logic :='0';
    signal Q_out : std_logic :='0';

    begin
        DUT: T_FlipFlop port map(T => T_in, CLK => CLK_in, Q => Q_out);
        T_TB_proc: process 
		begin
            
			wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For T=0 State should stay the same as previous" severity error;

            CLK_in <= '0';
            T_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '1') report "For T=1 State should be inverted compared to previous" severity error;

            
            wait for 5 ns;
            CLK_in <= '0';
            wait for 5 ns;
            assert(Q_out = '1') report "State should be unchanged" severity error;

           
            T_in <= '0';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '1') report "State should be unchanged" severity error;

			CLK_in <= '0';
            T_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For T=1 State should be inverted compared to previous" severity error;
            --- Clear inputs
             CLK_in <= '0';
             T_in <= '0';
             assert false report "Test done." severity note;
             wait;   
        end process T_TB_proc;
end architecture T_FlipFlop_TB_beh;