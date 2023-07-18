library ieee;
use ieee.std_logic_1164.all;

entity T_testbench is
end T_testbench;

architecture T_tb of T_testbench is
component T_flip_flop is
port(
    T, clk : in std_logic;
    Q, nQ : out std_logic
);
end component;

signal T_in, clk_in, Q_out, nQ_out: std_logic;

begin
DUT: T_flip_flop port map(
    T => T_in, 
    clk => clk_in,
    Q => Q_out, 
    nQ => nQ_out);
process
begin

T_in <= '0';
clk_in <= '0';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail T = 0, clk = 0" severity error;
assert(nQ_out='1') report "Fail T = 0, clk = 0" severity error;
wait for 1 ns;

T_in <= '1';
clk_in <= '0';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail T = 1, clk = 0" severity error;
assert(nQ_out='1') report "Fail T = 1, clk = 0" severity error;
wait for 1 ns;

T_in <= '1';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='1') report "Fail T = 1, clk = 1" severity error;
assert(nQ_out='0') report "Fail T = 1, clk = 1" severity error;
wait for 1 ns;

T_in <= '0';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='1') report "Fail T = 0, clk = 1" severity error;
assert(nQ_out='0') report "Fail T = 0, clk = 1" severity error;
wait for 1 ns;

T_in <= '1';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail T = 1, clk = 1" severity error;
assert(nQ_out='1') report "Fail T = 1, clk = 1" severity error;
wait for 1 ns;

T_in <= '0';
clk_in <= '0';
assert false report "Test finished" severity note;
wait;

end process;
end T_tb;