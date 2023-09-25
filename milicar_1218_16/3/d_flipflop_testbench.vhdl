library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_testbench is 
end d_testbench;

architecture d_arch of d_testbench is
component d_flipflop is
    port 
    (
        clk : in std_logic;
        d : in std_logic;
        reset : in std_logic;
        q : out std_logic
    );
end component;
signal clk_test : std_logic;
signal d_test : std_logic;
signal reset_test : std_logic;
signal q_test : std_logic;
signal i:integer:=0;
constant num_of_clks : integer:= 10;

begin
DUT: d_flipflop port map(clk_test,d_test, reset_test,q_test);

process
begin 
clk_test <= '1';
wait for 0.5 ns;
clk_test <= '0';
wait for 0.5 ns;

if(i=num_of_clks) then 
    wait;
else 
    i <= i+1;
end if;
end process;

process
begin 
d_test <= '0';
wait for 1 ns;
--assert((q_test='0' and reset_test='0') or (q_test='0' and reset_test='1')) report "Fail" severity error;

d_test <= '1';
wait for 1 ns;
--assert((q_test='1' and reset_test='0') or (q_test='0' and reset_test='1')) report "Fail" severity error;

d_test <= '1';
wait for 1 ns;
--assert((q_test='1' and reset_test='0') or (q_test='0' and reset_test='1')) report "Fail" severity error;

d_test <= '0';
wait for 1 ns;
--assert((q_test='0' and reset_test='0') or (q_test='0' and reset_test='1')) report "Fail" severity error;

wait;
end process;

reset_test <= '1' , '0' after 2 ns;

end d_arch;