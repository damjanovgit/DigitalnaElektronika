library ieee;
use ieee.std_logic_1164.all;

entity RS_FlipFlop_TB is
end entity RS_FlipFlop_TB;

architecture RS_FlipFlop_TB_beh of RS_FlipFlop_TB is
component RS_FlipFlop is 
port(
       R, S, CLK : in std_logic;
       Q : out std_logic
    );
end component RS_FlipFlop;

    signal R_in : std_logic :='0';
    signal S_in : std_logic :='0';
    signal CLK_in : std_logic :='0';
    signal Q_out : std_logic :='0';

    begin
        DUT: RS_FlipFlop port map(R => R_in, S => S_in, CLK => CLK_in, Q => Q_out);
        RS_TB_proc:process
		begin
            
			wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For R=0 & S=0 State should stay the same as previous" severity error;

            CLK_in <= '0';
            R_in <= '0';
            S_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '1') report "For R=0 & S=1 State should be Q_out=1" severity error;

            CLK_in <= '0';
            R_in <= '1';
            S_in <= '0';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For R=1 & S=0 State should be Q_out=0" severity error;

            CLK_in <= '0';
            R_in <= '1';
            S_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = 'X') report "For R=1 & S=1 State should be udefined" severity error;

            --- Clear inputs
             CLK_in <= '0';
             R_in <= '0';
             S_in <= '0';
             assert false report "Test done." severity note;
             wait;
        end process RS_TB_proc;
end architecture RS_FlipFlop_TB_beh;