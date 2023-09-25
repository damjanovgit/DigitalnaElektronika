library ieee;
use ieee.std_logic_1164.all;

entity ram_testbench is
end ram_testbench;

architecture tb of ram_testbench is
    component ram is
        port (
            address : in std_logic_vector (3 downto 0);
            clock, w_r : in std_logic;
            data_in : in std_logic_vector (7 downto 0);
            data_out : out std_logic_vector (7 downto 0)
        );
    end component;
    
    signal clk_in, w_r_in : std_logic := '0';
    signal dat_in, dat_out : std_logic_vector(7 downto 0);
    signal add_in : std_logic_vector(3 downto 0) := "0000";
    
begin
    dut: ram port map(add_in, clk_in, w_r_in, dat_in, dat_out);
    
    process
    begin
        dat_in <= "00000000";
        add_in <= "0000";
        clk_in <= '0';
        w_r_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        w_r_in <= '1';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00000010";
        add_in <= "0001";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00101010";
        add_in <= "0010";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00000010";
        add_in <= "0011";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00000010";
        add_in <= "0100";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "01010110";
        add_in <= "0101";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "01011111";
        add_in <= "0110";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00010001";
        add_in <= "0111";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00010001";
        add_in <= "1000";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        dat_in <= "00010111";
        add_in <= "1001";
        wait for 1 ns;
     
        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        w_r_in <= '0';
        add_in <= "0001";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        add_in <= "0010";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        add_in <= "0011";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        wait for 1 ns;

        wait;
    end process;
end tb;
