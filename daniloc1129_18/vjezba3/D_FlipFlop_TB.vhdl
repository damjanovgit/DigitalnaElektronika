library ieee;
use ieee.std_logic_1164.all;

entity D_FlipFlop_TB is
end entity D_FlipFlop_TB;

architecture D_FlipFlop_TB_beh of D_FlipFlop_TB is
component D_FlipFlop is 
port(
       D, CLK : in std_logic;
       Q : out std_logic
    );
end component D_FlipFlop;

    signal D_in : std_logic :='0';
    signal CLK_in : std_logic :='0';
    signal Q_out : std_logic :='0';

    begin
        DUT: D_FlipFlop port map(D => D_in, CLK => CLK_in, Q => Q_out);
        D_TB_proc: process
		begin
		
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '0') report "For D=0 State should be Q_out=0" severity error;

            CLK_in <= '0';
            D_in <= '1';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(Q_out = '1') report "For D=1 State should be Q_out=1" severity error;

            D_in <= '0';
            wait for 5 ns;
            CLK_in <= '0';
            wait for 5 ns;
            assert(Q_out = '1') report "State should be unchanged" severity error;

			CLK_in <= '1';
			wait for 5 ns;
			assert(Q_out = '0') report "State should follow D" severity error;
			
            -- Clear inputs
            CLK_in <= '0';
            D_in <= '0';
            assert false report "Test done." severity note;
            wait;
        end process D_TB_proc;
end architecture D_FlipFlop_TB_beh;