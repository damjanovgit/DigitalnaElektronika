library ieee;
use ieee.std_logic_1164.all;

entity D_testbench is
end D_testbench;

architecture D_tb of D_testbench is
component D_flip_flop is
port(
    D, clk : in std_logic;
    Q, nQ : out std_logic
);
end component;

signal D_in, clk_in, Q_out, nQ_out: std_logic;

begin
DUT: D_flip_flop port map(
    D => D_in, 
    clk => clk_in,
    Q => Q_out, 
    nQ => nQ_out);
process
begin

D_in <= '0';
clk_in <= '0';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail D = 0, clk = 0" severity error;
assert(nQ_out='1') report "Fail D = 0, clk = 0" severity error;
wait for 1 ns;

D_in <= '1';
clk_in <= '0';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail D = 1, clk = 0" severity error;
assert(nQ_out='1') report "Fail D = 1, clk = 0" severity error;
wait for 1 ns;

D_in <= '1';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='1') report "Fail D = 1, clk = 1" severity error;
assert(nQ_out='0') report "Fail D = 1, clk = 1" severity error;
wait for 1 ns;

D_in <= '0';
clk_in <= '1';
wait for 1 ns;
clk_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail D = 0, clk = 1" severity error;
assert(nQ_out='1') report "Fail D = 0, clk = 1" severity error;
wait for 1 ns;

D_in <= '0';
clk_in <= '0';
assert false report "Test finished" severity note;
wait;

end process;
end D_tb;