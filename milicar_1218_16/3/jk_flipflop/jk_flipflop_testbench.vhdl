library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
    component jk_flipflop is
        port
        (
            -- Input ports
            j	: in  std_logic;
            k	: in  std_logic;
            clk	: in  std_logic;
            reset: in std_logic;
    
            -- Output ports
            q	: out std_logic
        );
    end component;
    
signal j_test : std_logic;
signal k_test : std_logic;
signal clk_test : std_logic;
signal reset_test : std_logic;
signal q_test : std_logic;
signal i:integer:=0;
constant num_of_clks : integer:= 10;

begin
 DUT: jk_flipflop port map(j_test,k_test,clk_test,reset_test,q_test);
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
 j_test <= '0';
 k_test <= '0';
 wait for 1 ns;
 --assert(q_test=q) report "Fail 0/0" severity error;

 j_test <= '0';
 k_test <= '1';
 wait for 1 ns;
 --assert(q_test='0') report "Fail 0/1" severity error;

 j_test <= '1';
 k_test <= '0';
 wait for 1 ns;
 --assert(q_test='1') report "Fail 1/X" severity error;

 j_test <= '1';
 k_test <= '1';
 wait for 1 ns;
 --assert(q_test=not q) report "Fail 1/1" severity error;

 
 --assert false report "Test done." severity note;
 wait;
 end process;

 reset_test <= '1' , '0' after 4 ns;
end tb;