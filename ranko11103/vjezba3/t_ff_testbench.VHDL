library ieee;
use ieee.std_logic_1164.all;

entity t_ff_testbench is
end entity t_ff_testbench;

architecture t_ff_testbench_beh of t_ff_testbench is 
 component t_flipflop is port(
    clk : in std_logic;
    t : in std_logic;
    q : out std_logic;
    not_q : out std_logic);
 end component;

 signal clk_input, t_input, q_output, not_q_output : std_logic;

 begin

 hac : t_flipflop port map(
    clk => clk_input,
    t => t_input,
    q => q_output,
    not_q => not_q_output
 );

 process
 begin

    clk_input <= '1';
    t_input <= '0';
    wait for 10 ns;
    assert(q_output='0' and not_q_output ='1') report "Greska clk=1 and t=0  and q_output !=0 " severity error;

    clk_input <= '0';
    t_input <= '0';
    wait for 10 ns;
    assert(q_output='0' and not_q_output ='1') report "Greska clk=0 and t=0  and q_output !=0 " severity error;

    clk_input <= '1';
    t_input <= '1';
    wait for 10 ns;
    assert(q_output='0' and not_q_output ='1') report "Greska clk=1 and t=1 and q_output !=0 " severity error;

    clk_input <= '0';
    t_input <= '1';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=0 and t=1  and q_output !=1 " severity error;

          
      --   Odavde se signal ponovo ponavlja ista sekvenca 


     clk_input <= '1';
    t_input <= '0';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=1 and t=1  and q_output !=1 " severity error;

    report "Test done." severity note;
    wait;
    
  end process;
end t_ff_testbench_beh;    