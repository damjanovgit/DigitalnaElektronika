library ieee;
use ieee.std_logic_1164.all;

entity stacionarni_registar_testbench is
end stacionarni_registar_testbench;

architecture stacionarni_registar_tb of stacionarni_registar_testbench is
    component stacionarni_registar is
        port(
            data_in : in std_logic_vector(9 downto 0);
            data_out : out std_logic_vector(9 downto 0);
            enable, clk, clr : in std_logic
        );
    end component;

    signal data_in1, data_out1 : std_logic_vector(9 downto 0);
    signal enable1, clk1, clr1 : std_logic;

begin
    DUT: stacionarni_registar port map(
        data_in => data_in1, 
        data_out => data_out1,
        enable => enable1,
        clk => clk1,
        clr => clr1
    );

process 
begin

    data_in1 <= "0000000000";
    enable1 <= '0';
    clr1 <= '0';
    clk1 <= '0';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "0000000000") report "Fail data_out = 0" severity error;
    wait for 1 ns;

    data_in1 <= "0000000001";
    enable1 <= '1';
    clr1 <= '0';
    clk1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    wait for 1 ns;
    assert(data_out1 = "0000000001") report "Fail data_out = 1" severity error;
    wait for 1 ns;

    data_in1 <= "1000000000";
    enable1 <= '1';
    clr1 <= '1';
    clk1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    wait for 1 ns;
    assert(data_out1 = "0000000000") report "Fail data_out = 0" severity error;
    wait for 1 ns;

    data_in1 <= "1000000001";
    enable1 <= '1';
    clr1 <= '0';
    clk1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    wait for 1 ns;
    assert(data_out1 = "1000000001") report "Fail data_out = 513" severity error;
    wait for 1 ns;

    data_in1 <= "1111111111";
    enable1 <= '0';
    clr1 <= '0';
    clk1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    wait for 1 ns;
    assert(data_out1 = "1000000001") report "Fail data_out = 513" severity error;
    wait for 1 ns;

    data_in1 <= "1111111111";
    enable1 <= '0';
    clr1 <= '1';
    clk1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    wait for 1 ns;
    assert(data_out1 = "0000000000") report "Fail data_out = 0" severity error;
    wait for 1 ns;

    assert false report "Test finished" severity note;
    wait;

end process;
end stacionarni_registar_tb;
