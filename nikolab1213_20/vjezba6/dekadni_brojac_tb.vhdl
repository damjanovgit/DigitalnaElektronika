library ieee;
use ieee.std_logic_1164.all;

entity dekadni_brojac_testbench is
end dekadni_brojac_testbench;

architecture dekadni_brojac_tb of dekadni_brojac_testbench is
    component dekadni_brojac is
        port(
            data_out : out std_logic_vector(3 downto 0);
            clk, rst, mode : in std_logic
        );
    end component;

signal data_out1 : std_logic_vector(3 downto 0);
signal clk1, rst1, mode1 : std_logic;

begin
    DUT: dekadni_brojac port map(
        data_out => data_out1,
        mode => mode1,
        clk => clk1,
        rst => rst1
    );

    process 
    begin
    
        rst1 <= '0';
        clk1 <= '0';
        mode1 <= '0';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "0000") report "Fail data_out = 0" severity error;
        wait for 1 ns;

        rst1 <= '0';
        clk1 <= '1';
        mode1 <= '0';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "0001") report "Fail data_out = 1" severity error;
        wait for 1 ns;

        rst1 <= '0';
        clk1 <= '1';
        mode1 <= '0';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "0010") report "Fail data_out = 2" severity error;
        mode1 <= '1';
        wait for 1 ns;

        rst1 <= '0';
        clk1 <= '1';
        mode1 <= '1';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "0001") report "Fail data_out = 1" severity error;
        wait for 1 ns;

        rst1 <= '0';
        clk1 <= '1';
        mode1 <= '1';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "0000") report "Fail data_out = 0" severity error;
        wait for 1 ns;

        rst1 <= '0';
        clk1 <= '1';
        mode1 <= '1';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "1001") report "Fail data_out = 9" severity error;
        wait for 1 ns;

        rst1 <= '0';
        clk1 <= '1';
        mode1 <= '1';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "1000") report "Fail data_out = 8" severity error;
        rst1 <= '1';
        wait for 1 ns;

        rst1 <= '1';
        clk1 <= '1';
        mode1 <= '1';
        wait for 1 ns;
        clk1 <= '0';
        assert(data_out1 = "0000") report "Fail data_out = 0" severity error;
        wait for 1 ns;

        assert false report "Test finished" severity note;
        wait;

end process;
end dekadni_brojac_tb;





