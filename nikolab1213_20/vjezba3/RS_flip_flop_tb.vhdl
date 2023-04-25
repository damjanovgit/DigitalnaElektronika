library ieee;
use ieee.std_logic_1164.all;

entity RS_testbench is
end RS_testbench;

architecture tb of RS_testbench is
component RS_flip_flop is
port(
    R, S : in std_logic;
    Q, nQ : out std_logic
);
end component;

signal R_in, S_in, Q_out, nQ_out: std_logic;

begin
DUT: RS_flip_flop port map(
    R => R_in, 
    S => S_in,
    Q => Q_out, 
    nQ => nQ_out);
process
begin

R_in <= '1';
S_in <= '0';
wait for 1 ns;
--resetovanje flip flopa

R_in <= '0';
S_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail 0/0" severity error;
assert(nQ_out='1') report "Fail 0/0" severity error;

R_in <= '0';
S_in <= '1';
wait for 1 ns;
assert(Q_out='1') report "Fail 0/1" severity error;
assert(nQ_out='0') report "Fail 0/1" severity error;

R_in <= '1';
S_in <= '0';
wait for 1 ns;
assert(Q_out='0') report "Fail 1/0" severity error;
assert(nQ_out='1') report "Fail 1/0" severity error;

-- Clear inputs
R_in <= '0';
S_in <= '0';
assert false report "Test done." severity note;
wait;

end process;
end tb;