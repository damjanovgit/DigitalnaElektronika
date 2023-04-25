library ieee;
use ieee.std_logic_1164.all;

entity JK_FlipFlop_TB is
end entity JK_FlipFlop_TB;

architecture JK_FlipFlop_TB_beh of JK_FlipFlop_TB is
component JK_FlipFlop is 
port(
       J, K, CLK : in std_logic;
       Q : out std_logic
    );
end component JK_FlipFlop;

    signal J_in : std_logic :='0';
    signal K_in : std_logic :='0';
    signal CLK_in : std_logic :='0';
    signal Q_out : std_logic :='0';

    begin
        DUT: JK_FlipFlop port map(J => J_in, K => K_in, CLK => CLK_in, Q => Q_out);
        JK_TB_proc:process 
		begin
		   
		    wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For J=0 & K=0 State should stay the same as previous" severity error;

            CLK_in <= '0';
            J_in <= '1';
            K_in <= '0';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '1') report "For J=1 & K=0 State should be Q_out=1" severity error;

            CLK_in <= '0';
            J_in <= '0';
            K_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For J=0 & K=1 State should be Q_out=0" severity error;

            CLK_in <= '0';
            J_in <= '1';
            K_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '1') report "For J=1 & K=1 State should be inverted compared to previous state" severity error;

            --- Clear inputs
             CLK_in <= '0';
             J_in <= '0';
             K_in <= '0';
             assert false report "Test done." severity note;
             wait;
        end process JK_TB_proc;
end architecture JK_FlipFlop_TB_beh;