
library ieee;
use ieee.std_logic_1164.all;

entity or_gate_testbench is
end or_gate_testbench;

architecture or_gate_testbench_functionality of or_gate_testbench is
    component or_gate is
    port(
    A : in std_logic;
    B : in std_logic;
    C : out std_logic
    );
    end component;
    signal input : std_logic_vector(1 downto 0);
    signal output : std_logic;
begin
    og : or_gate port map(
        A => input(0),
        B => input(1),
        C => output
    );

    testbench_process : process
    begin
    input <= "00"; wait for 10 ns; assert output = '0' report "fail 0 or 0" severity error;
    input <= "01"; wait for 10 ns; assert output = '1' report "fail 0 or 1" severity error;
    input <= "10"; wait for 10 ns; assert output = '1' report "fail 1 or 0" severity error;
    input <= "11"; wait for 10 ns; assert output = '1' report "fail 1 or 1" severity error;
    report "or_gate testbench success";
    wait;
    end process;
end;