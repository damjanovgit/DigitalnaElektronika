library ieee;
use ieee.std_logic_1164.all;

entity pomjeracki_registar_tb is
end pomjeracki_registar_tb;

architecture pomjeracki_registar_tb_beh of pomjeracki_registar_tb is

    component pomjeracki_registar is
    port(   parallel_input  : in  std_logic_vector(5 downto 0);
            parallel_output : out std_logic_vector(5 downto 0);
            mode   : in  std_logic_vector(1 downto 0);
            R_input, L_input, CLK, CLR : in std_logic
    ); end component;

    signal parallel_input, parallel_output : std_logic_vector(5 downto 0) := "000000";
    signal mode            : std_logic_vector(1 downto 0) := "00";
    signal R_input,L_input,CLK        : std_logic := '0';
    signal CLR : std_logic := '1';

    begin
        DUT : pomjeracki_registar port map(
                parallel_input => parallel_input,
                parallel_output => parallel_output,
                mode => mode,
                R_input => R_input,
                L_input => L_input,
                CLK => CLK,
                CLR => CLR
        );

   process begin
        CLK <= '0';
        wait for 10 ns;
        assert (parallel_output= "000000") report "Failed beginning CLK = 0." severity error;
        parallel_input <= "111111";
        mode <= "11";
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "111111") report "Failed parallel entry." severity error;
        CLK <= '0';
        wait for 10 ns;
        R_input<= '0';
        mode <= "01";
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "011111") report "Failed right shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "001111") report "Failed right shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000111") report "Failed right shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000011") report "Failed right shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000001") report "Failed right shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000000") report "Failed right shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        L_input<= '1';
        mode <= "10";
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000001") report "Failed left shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000011") report "Failed left shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "000111") report "Failed left shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "001111") report "Failed left shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "011111") report "Failed left shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
        assert (parallel_output= "111111") report "Failed left shift." severity error;
        CLK <= '0';
        wait for 10 ns;
        CLR <= '0';
        wait for 10 ns;
        assert (parallel_output= "000000") report "Failed clear." severity error;
        
        assert false report "Test finished." severity note;
        wait;
    end process;
end pomjeracki_registar_tb_beh;