library ieee;
use ieee.std_logic_1164.all;

entity d_ff_testbench is 
end entity d_ff_testbench;

architecture d_ff_testbench_beh of d_ff_testbench is 
 component d_flipflop is port(
    
    cp : in std_logic;
    d : in std_logic;
    q : out std_logic;
    not_q : out std_logic);

 end component;

  signal cp_input, d_input, q_output, not_q_output : std_logic;

 begin 

 hac : d_flipflop  port map(
    cp => cp_input,
    d => d_input,
    q => q_output,
    not_q => not_q_output
 );
 process
 begin

 
  cp_input <= '0';
  d_input <= '1';
  wait for 10 ns;
  assert(q_output='0' and not_q_output ='1') report "Greska cp=1 and d=0  and q_output !=1 " severity error;

  cp_input <= '1';
  d_input <= '1';
  wait for 10 ns;
  assert(q_output='1' and not_q_output ='0') report "Greska cp=1 and d=0  and q_output !=1 " severity error;

  cp_input <= '0';
  d_input <= '1';
  wait for 10 ns;
  assert(q_output='1' and not_q_output ='0') report "Greska cp=1 and d=0  and q_output !=1 " severity error;

  cp_input <= '1';
  d_input <= '0';
  wait for 10 ns;
  assert(q_output='0' and not_q_output ='1') report "Greska cp=1 and d=0  and q_output !=1 " severity error;

  cp_input <= '0';
  d_input <= '0';
  wait for 10 ns;
  assert(q_output='0' and not_q_output ='1') report "Greska cp=1 and d=0  and q_output !=1 " severity error;

  report "Test done." severity note;
  wait;

 end process;
end d_ff_testbench_beh;   