library ieee;
use ieee.std_logic_1164.all;

entity tb_stac_reg_10 is
end tb_stac_reg_10;

architecture beh_tb_stac_reg_10 of tb_stac_reg_10 is

    component stac_reg_10 is
    port(   data_in  : in std_logic_vector(9 downto 0);
            data_out : out std_logic_vector(9 downto 0);
            clk, clr, e : in std_logic
    ); end component;

    signal data_in, data_out : std_logic_vector(9 downto 0) := "0000000000";
    signal clk, clr, e       : std_logic;

begin

    hac : stac_reg_10 port map(
            data_in => data_in,
            data_out => data_out,
            clk => clk,
            clr => clr,
            E => E
    );

    process 
    begin

            clk <= '0'; clr <= '0'; E <= '1'; wait for 5 ns;

            clk <= '1'; clr <= '1'; data_in <= "1111111111"; wait for 5 ns;
            assert (data_out = "0000000000") report "E1" severity error;
            clk <= '0'; clr <= '0'; wait for 5 ns;

            clk <= '1'; data_in <= "1111111111"; wait for 5 ns;
            assert (data_out = "1111111111") report "E2" severity error;
            clk <= '0'; wait for 5 ns;

            clk <= '1'; data_in <= "1111100000"; wait for 5 ns;
            assert (data_out = "1111100000") report "E3" severity error;
            clk <= '0'; wait for 5 ns;

            clk <= '1'; clr <= '1'; wait for 5 ns;
            assert (data_out = "0000000000") report "E4" severity error;
            clk <= '0'; clr <= '0'; wait for 5 ns;

            clk <= '1'; data_in <= "1010101010"; wait for 5 ns;
            assert (data_out = "1010101010") report "E5" severity error;
            clk <= '0'; wait for 5 ns;

            clk <= '1'; E <= '0'; data_in <= "1111111111"; wait for 5 ns;
            assert (data_out = "1010101010") report "E6" severity error;
            clk <= '0'; wait for 5 ns;

            clk <= '1'; clr <= '1'; wait for 5 ns;
            assert (data_out = "0000000000") report "E7" severity error;
            clk <= '0'; wait for 5 ns;

            assert false report "Test done!" severity error;
            wait;
    end process;
end beh_tb_stac_reg_10;