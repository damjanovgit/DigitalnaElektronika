library ieee;
use ieee.std_logic_1164.all;

entity JK_testbench is
end JK_testbench;

architecture JK_tb of JK_testbench is
component JK_flip_flop is
port(
    J, K, clk : in std_logic;
    Q, nQ : out std_logic
);
end component;

signal J_in, K_in, clk_in, Q_out, nQ_out: std_logic;

begin
DUT: JK_flip_flop port map(
    J => J_in, 
    K => K_in,
    clk => clk_in,
    Q => Q_out, 
    nQ => nQ_out);
process
begin

J_in <= '0';
K_in <= '0';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail J = 0, K = 0" severity error;
assert(nQ_out='1') report "Fail J = 0, K = 0" severity error;
wait for 1 ns;

J_in <= '1';
K_in <= '0';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='1') report "Fail J = 1, K = 0" severity error;
assert(nQ_out='0') report "Fail J = 1, K = 0" severity error;
wait for 1 ns;

J_in <= '0';
K_in <= '1';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail J = 0, K = 1" severity error;
assert(nQ_out='1') report "Fail J = 0, K = 1" severity error;
wait for 1 ns;

J_in <= '1';
K_in <= '1';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='1') report "Fail J = 1, K = 1" severity error;
assert(nQ_out='0') report "Fail J = 1, K = 1" severity error;
wait for 1 ns;

J_in <= '1';
K_in <= '1';
wait for 1 ns;
assert(Q_out='1') report "Clock error" severity error;
assert(nQ_out='0') report "Clock error" severity error;

J_in <= '0';
K_in <= '0';
clk_in <= '0';
assert false report "Test finished" severity note;
wait;


end process;
end JK_tb;