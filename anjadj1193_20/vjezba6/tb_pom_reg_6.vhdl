library ieee;
use ieee.std_logic_1164.all;

entity tb_pom_reg_6 is
end tb_pom_reg_6;

architecture beh_tb_pom_reg_6 of tb_pom_reg_6 is

    component pom_reg_6 is
    port(   data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(5 downto 0);
            s_mode   : in  std_logic_vector(1 downto 0);
            R_in, L_in, clk, clr : in std_logic
    ); end component;

    signal data_in, data_out : std_logic_vector(5 downto 0) := "000000";
    signal s_mode            : std_logic_vector(1 downto 0) := "00";
    signal R_in,L_in,clk,clr        : std_logic := '0';

    begin
        hac : pom_reg_6 port map(
                data_in => data_in,
                data_out => data_out,
                s_mode => s_mode,
                R_in => R_in,
                L_in => L_in,
                clk => clk,
                clr => clr
        );

    process
    begin

        clr <= '0'; clk <= '0';  wait for 5 ns;
        assert (data_out = "000000") report "E1" severity error;
        clr <= '1';              wait for 5 ns;

        -- paralelan upis
        clk <= '1';  s_mode <= "11";  data_in <="101010";  wait for 5 ns;
        assert (data_out = "101010") report "E2" severity error;
        clk <= '0';  wait for 5 ns;

        -- pomeranje udesno -->
        clk <= '1';  s_mode <= "01";  R_in <= '1';  wait for 5 ns;
        assert (data_out = "110101") report "E3" severity error;
        clk <= '0';  wait for 5 ns;

        -- pomeranje udesno -->
        clk <= '1';  s_mode <= "01";  R_in <= '1';  wait for 5 ns;
        assert (data_out = "111010") report "E3" severity error;
        clk <= '0';  wait for 5 ns;

        -- pomeranje ulevo <--
        clk <= '1';  s_mode <= "10";  L_in <= '1';  wait for 5 ns;
        assert (data_out = "110101") report "E4" severity error;
        clk <= '0';  wait for 5 ns;

        -- pomeranje ulevo <--
        clk <= '1';  s_mode <= "10";  L_in <= '1';  wait for 5 ns;
        assert (data_out = "101011") report "E4" severity error;
        clk <= '0';  wait for 5 ns;

        -- cuvanje prethodne vrednosti
        clk <= '1';  s_mode <= "00";                wait for 5 ns;
        assert (data_out = "101011") report "E5" severity error;
        clk <= '0';  wait for 5 ns;

        assert false report "Test done!" severity error;
        wait;

    end process;
end beh_tb_pom_reg_6;