library ieee;
use ieee.std_logic_1164.all;

entity pomjeracki_registar_testbench is
end pomjeracki_registar_testbench;

architecture pomjeracki_registar_tb of pomjeracki_registar_testbench is
    component pomjeracki_registar is
        port(
            data_in : in std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(5 downto 0);
            mode : in std_logic_vector(1 downto 0);
            clk, clr, rin, lin : in std_logic
        );
    end component;

    signal data_in1, data_out1 : std_logic_vector(5 downto 0);
    signal mode1 : std_logic_vector(1 downto 0);
    signal clk1, clr1, rin1, lin1 : std_logic;

begin
    DUT: pomjeracki_registar port map(
        data_in => data_in1, 
        data_out => data_out1,
        mode => mode1,
        clk => clk1,
        clr => clr1,
        rin => rin1,
        lin => lin1
    );

process 
begin

    data_in1 <= "000000";
    clr1 <= '1';
    clk1 <= '0';
    mode1 <= "00";
    rin1 <= '0';
    lin1 <= '0';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "000000") report "Fail data_out = 0" severity error;
    wait for 1 ns;

    data_in1 <= "100001";
    clr1 <= '1';
    clk1 <= '1';
    mode1 <= "11";
    rin1 <= '0';
    lin1 <= '0';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "100001") report "Fail data_out = 100001" severity error;
    wait for 1 ns;

    data_in1 <= "100001";
    clr1 <= '1';
    clk1 <= '1';
    mode1 <= "01";
    rin1 <= '0';
    lin1 <= '0';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "010000") report "Fail data_out = 010000" severity error;
    wait for 1 ns;

    data_in1 <= "100001";
    clr1 <= '1';
    clk1 <= '1';
    mode1 <= "01";
    rin1 <= '1';
    lin1 <= '0';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "101000") report "Fail data_out = 101000" severity error;
    wait for 1 ns;

    data_in1 <= "100001";
    clr1 <= '1';
    clk1 <= '1';
    mode1 <= "10";
    rin1 <= '0';
    lin1 <= '0';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "010000") report "Fail data_out = 010000" severity error;
    wait for 1 ns;

    data_in1 <= "100001";
    clr1 <= '1';
    clk1 <= '1';
    mode1 <= "10";
    rin1 <= '0';
    lin1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "100001") report "Fail data_out = 100001" severity error;
    wait for 1 ns;

    data_in1 <= "100001";
    clr1 <= '0';
    clk1 <= '1';
    mode1 <= "10";
    rin1 <= '0';
    lin1 <= '1';
    wait for 1 ns;
    clk1 <= '0';
    assert(data_out1 = "000000") report "Fail data_out = 000000" severity error;
    wait for 1 ns;

    assert false report "Test finished" severity note;
    wait;

end process;
end pomjeracki_registar_tb;
