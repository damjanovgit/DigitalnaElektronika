library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture RS_FF_tb of testbench is 

component RS_FF is 
port (
    S,R, CLK : in std_logic;
    Q, Q_cp : out std_logic
);
end component;

signal S_sig: std_logic := '1';
signal R_sig: std_logic := '0';
signal clk_sig: std_logic := '1';
signal q_sig: std_logic := '1';
signal q_cp_sig: std_logic := '0';

    begin

        DUT: RS_FF port map(S_sig, R_sig, clk_sig, q_sig, q_cp_sig);

        process
        begin

            wait for 1 ns;
            clk_sig <= '0';
            wait for 1 ns;

            clk_sig <= '1';
            R_sig <= '1';
            S_sig <= '0';
            wait for 1 ns;
            clk_sig <= '0';
            wait for 1 ns;

            clk_sig <= '1';
            S_sig <= '0';
            R_sig <= '0';
            wait for 1 ns;
            clk_sig <= '0';
            wait for 1 ns;

            clk_sig <= '1';
            S_sig <= '1';
            R_sig <= '1';
            wait for 1 ns;
            clk_sig <= '0';
            wait for 1 ns;
        
           
            end process;
end RS_FF_tb;






















