library IEEE;
use IEEE.std_logic_1164.all;

entity TestBenchPReg is
end TestBenchPReg;

architecture tb_arch of TestBenchPReg is
    component Pomjeracki_Registar is
        port (
            clk, rst, rin, lin : in std_logic;
            mode : in std_logic_vector(1 downto 0);
            data_in : in std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(5 downto 0)
        );
    end component;

    signal clk_in, rst_in, rin_in, lin_in : std_logic;
    signal mode_in : std_logic_vector(1 downto 0);
    signal data_in, data_out : std_logic_vector(5 downto 0);
begin
    
    DUT: Pomjeracki_Registar port map(clk_in, rst_in, rin_in, lin_in, mode_in, data_in, data_out);

    process
    begin
        clk_in <= '0';
        rst_in <= '1';
        rin_in <= '0';
        lin_in <= '1';
        mode_in <= "01";
        data_in <= "011010";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        mode_in <= "00";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        mode_in <= "10";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        mode_in <= "11";
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        rst_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        clk_in <= '0';
        wait for 1 ns;

        clk_in <= '1';
        wait for 1 ns;

        wait;
    end process;
end tb_arch;
