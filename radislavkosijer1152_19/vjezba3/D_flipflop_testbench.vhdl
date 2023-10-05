library IEEE;
use IEEE.std_logic_1164.all;

entity D_testbench is 
end D_testbench;

architecture D_flipflop_tb of D_testbench is
component D_flipflop is 
port(
    D, CLK : in std_logic;
    Q, nQ : out std_logic
);
end component;

signal D_tb, CLK_tb, Q_tb, nQ_tb : std_logic;

begin

DUT: D_flipflop port map (
    D => D_tb, 
    CLK => CLK_tb, 
    Q => Q_tb,
    nQ => nQ_tb);

process
begin

D_tb <= '1';
CLK_tb <= '0';
wait for 1 ns;
CLK_tb <= '0';
wait for 1 ns;
assert(Q_tb='0') report "Fail D = 1, CLK = 0" severity error;
assert(nQ_tb='1') report "Fail D = 1, clk = 0" severity error;
wait for 1 ns;

D_tb <= '1';
CLK_tb <= '1';
wait for 1 ns;
CLK_tb <= '0';
wait for 1 ns;
assert(Q_tb='1') report "Fail D = 1, clk = 1" severity error;
assert(nQ_tb='0') report "Fail D = 1, clk = 1" severity error;
wait for 1 ns;

D_tb <= '0';
CLK_tb <= '1';
wait for 1 ns;
CLK_tb <= '0';
wait for 1 ns;
assert(Q_tb='0') report "Fail D = 0, clk = 1" severity error;
assert(nQ_tb='1') report "Fail D = 0, clk = 1" severity error;
wait for 1 ns;

D_tb <= '0';
CLK_tb <= '0';
assert false report "Test finished" severity note;
wait;

end process;
end architecture D_flipflop_tb;
