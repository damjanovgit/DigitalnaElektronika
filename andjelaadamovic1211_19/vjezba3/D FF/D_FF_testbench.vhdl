library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
end testbench;

architecture DFlipFlop_tb of testbench is
component DFlipFlop is port(    -- Komponenta koja se testira
            d : in std_logic;
            clk : in std_logic;
            rst : in std_logic;
            q : out std_logic
);
end component;
signal d_sig, clk_sig, rst_sig, q_sig : std_logic;

     constant CLOCK_PERIOD : time := 10 ns;  

begin
    dut: DFlipFlop port map ( d_sig, clk_sig, rst_sig, q_sig);

    process
    begin
        while now < 50 ns loop  
            clk_sig <= '0';
            wait for CLOCK_PERIOD/4;
            clk_sig <= '1';
            wait for CLOCK_PERIOD/4;
        end loop;
        wait;
    end process;

    process
    begin
    
        d_sig <= '0';
        rst_sig <= '0';
        wait for 5 ns;

        d_sig <= '1';
        wait for 10 ns;

        d_sig <= '1';
        wait for 10 ns;

        d_sig <= '0';
        wait for 10 ns;

        d_sig <= '1';
        wait for 10 ns;

        rst_sig <= '1';

        wait;
    end process;

end architecture DFlipFlop_tb;
