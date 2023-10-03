library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture STAT_tb of testbench is
    
    signal input : std_logic_vector(9 downto 0); 
    signal enable :std_logic;
    signal output: std_logic_vector(9 downto 0) ;
    signal clk, reset : std_logic;


    component STAT_REG is
        port (
          input : in std_logic_vector (9 downto 0);
          reset, clk, enable : in std_logic;
          output : out std_logic_vector (9 downto 0)
        );
    end component STAT_REG;

begin
    dut : STAT_REG
    port map (input,enable,reset,clk,output);
  
    process
    begin
        
        input<= "0101010101";
        enable <= '1';
        reset <= '0';

        wait for 10 ns;

    
        input <= "0111111110";

        wait for 20 ns;

    
        reset <= '1';

       wait;
    end process;

    clk_process: process
    begin
      while now < 100 ns loop
        clk <= '0'; 
        wait for 5 ns; 
        clk <= '1'; 
        wait for 5 ns; 
        end loop;
        wait;
    end process clk_process;

end architecture STAT_tb;