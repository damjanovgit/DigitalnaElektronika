library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture JK_FF_tb of testbench is

component JK_FF is port(
     J: in std_logic;
     K: in std_logic;
     CLK: in std_logic;
     RST : in std_logic;
     Q: out std_logic;
     Q_cp : out std_logic
);
end component;
    signal j_sig, k_sig, clk_sig, rst_sig : std_logic;
    signal q_sig : std_logic := '0';
    signal q_cp_sig : std_logic := '1';

    constant CLOCK_PERIOD : time := 10 ns; 

begin
    dut: JK_FF port map ( j_sig, k_sig, clk_sig, q_sig, q_cp_sig);

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

       
        j_sig <= '0';
        k_sig <= '0';

        wait for 5 ns;

     
        j_sig <= '1';
        k_sig <= '0';

        wait for 10 ns;

        j_sig <= '0';
        k_sig <= '1';
        wait for 10 ns;

        j_sig <= '1';
        k_sig <= '1';
        wait for 10 ns;

        j_sig <= '0';
        k_sig <= '0';

        wait for 10 ns;

        wait;
    end process;

end architecture JK_FF_tb;
