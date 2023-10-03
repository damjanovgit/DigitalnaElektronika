library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
end testbench;

architecture T_FF_tb of testbench is
component T_FF is 
port(
    T :in std_logic;
    CLK : in std_logic;
    Q : out std_logic;
    reset : in std_logic;
     Q_cp : out std_logic
);
end component;

signal T_sig : std_logic := '0';
signal clk_sig :std_logic := '1';
signal reset_sig: std_logic;
signal q_sig : std_logic := '1';
signal q_cp_sig : std_logic := '0';

constant CLOCK_PERIOD : time := 10 ns;
begin
DUT: T_FF port map (T_sig, clk_sig, q_sig, q_cp_sig);

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

    stimulus_process: process
    begin
        
        T_sig <= '0';
        reset_sig <= '0';
        wait for 5 ns;

        T_sig <= '1';
        wait for 10 ns;

        T_sig <= '1';
        wait for 10 ns;

        T_sig <= '0';
        wait for 10 ns;

        T_sig <= '1';
        wait for 10 ns;

        reset_sig <= '1';

        wait;
    end process;
end T_FF_tb;
