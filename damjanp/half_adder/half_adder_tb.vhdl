

library ieee;

use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture half_adder_tb_functionality of half_adder_tb is
component half_adder is
port(
    A : in std_logic;
    B : in std_logic;
    S : out std_logic;
    C : out std_logic
);
end component;
signal input : std_logic_vector(1 downto 0);
signal output : std_logic_vector(1 downto 0);
begin
    hac: half_adder port map(
       A => input(0),
       B => input(1),
       S => output(0),
       C => output(1) 
    );

    testbench_process: process
    begin
        input <= "00"; wait for 10 ns; assert output="00" report "greska 0+0 ne valja" severity error;
        input <= "01"; wait for 10 ns; assert output="01" report "greska 0+1 ne valja" severity error;
        input <= "10"; wait for 10 ns; assert output="01" report "greska 1+0 ne valja" severity error;
        input <= "11"; wait for 10 ns; assert output="10" report "greska 1+1 ne valja" severity error;
        report "Half_adder testbench uspjesno zavrsen";
        wait;
    end process;
end;