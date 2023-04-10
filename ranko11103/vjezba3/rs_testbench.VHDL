library ieee;
use ieee.std_logic_1164.all;


entity rs_testbench is 
end entity rs_testbench;

architecture rs_testbench_beh of rs_testbench is
 component rs is port (
      s: in std_logic;
      r: in std_logic;
      q: out std_logic;
      not_q: out std_logic);
 end component;
 signal r_input : std_logic;
 signal s_input : std_logic;
 signal q_output : std_logic;
 signal not_q_output: std_logic;

 begin

 hac: rs port map(
    s => s_input,
    r => r_input,
    q => q_output,
    not_q => not_q_output
 ); 

 process
 begin

  
  s_input <= '1';
  r_input <= '0';
  wait for 10 ns;
  assert(q_output='1' and not_q_output ='0') report "Greska s=1 and r=0" severity error;

  s_input <= '0';
  r_input <= '0';
  wait for 10 ns;
  assert(q_output='1' and not_q_output ='0') report "Greska s=1 and r=0" severity error;
  
  s_input <= '0';
  r_input <= '1';
  wait for 10 ns;
  assert(q_output='0' and not_q_output ='1') report "Greska s=0 and r=1" severity error;
  
   report "Test done." severity note;
  wait;
 end process;
end rs_testbench_beh; 
