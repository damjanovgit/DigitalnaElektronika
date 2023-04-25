library ieee;
use ieee.std_logic_1164.all;

entity jk_ff_testbench is
end entity jk_ff_testbench;

architecture jk_ff_testbench_beh of jk_ff_testbench is 
 component jk_flipflop is port(
    j : in std_logic;
    k : in std_logic;
    clk : in std_logic;
    q : out std_logic;
    not_q : out std_logic);
  end component;

  signal clk_input, j_input, k_input, q_output, not_q_output : std_logic;

  begin 

  hac : jk_flipflop port map(

    j => j_input,
    k => k_input,
    clk => clk_input,
    q => q_output,
    not_q => not_q_output
  );

  process
  begin

    
    clk_input <= '1';
    j_input <= '1';
    k_input <= '0';
    wait for 10 ns;
    assert(q_output='0' and not_q_output ='1') report "Greska clk=1 i j=1 i k=0 i q_output !=0 " severity error;
    
    clk_input <= '0';
    j_input <= '1';
    k_input <= '0';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=0 i j=1 i k=0 i q_output !=1 " severity error;

    clk_input <= '1';
    j_input <= '0';
    k_input <= '0';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=1 i j=0 i k=0 i q_output !=1 " severity error;

    clk_input <= '0';
    j_input <= '0';
    k_input <= '0';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=0 i j=0 i k=0 i q_output !=1" severity error;
    
    clk_input <= '1';
    j_input <= '0';
    k_input <= '1';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=1 i j=0 i k=1 i q_output !=1 " severity error;
    
    clk_input <= '0';
    j_input <= '0';
    k_input <= '1';
    wait for 10 ns;
    assert(q_output='0' and not_q_output ='1') report "Greska clk=0 i j=0 i k=1 i q_output !=0 " severity error;

    clk_input <= '1';
    j_input <= '1';
    k_input <= '1';
    wait for 10 ns;
    assert(q_output='0' and not_q_output ='1') report "Greska clk=0 i j=1 i k=1 i q_output !=1 " severity error;
    
    clk_input <= '0';
    j_input <= '1';
    k_input <= '1';
    wait for 10 ns;
    assert(q_output='1' and not_q_output ='0') report "Greska clk=0 i j=1 i k=1 i q_output !=1 " severity error;

    report "Test done." severity note;
    wait;
  end process;
end jk_ff_testbench_beh;

