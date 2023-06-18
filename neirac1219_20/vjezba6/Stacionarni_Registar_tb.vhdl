library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Stacionarni_Registar_tb is
end Stacionarni_Registar_tb;

architecture Stacionarni_Registar_tb_beh of Stacionarni_Registar_tb is
    component Stacionarni_Registar is
        port(
            RST, CLK, EN : in std_logic;
            ulaz : in std_logic_vector(9 downto 0);
            izlaz : out std_logic_vector(9 downto 0)
        );
    end component;

        signal CLK_in: std_logic := '0';
        signal RST_in: std_logic := '0';
        signal EN_in: std_logic := '0';
        signal ulaz_in: std_logic_vector(9 downto 0) := "0000000000";
        signal izlaz_out: std_logic_vector(9 downto 0) := "0000000000";
begin
    DUT: Stacionarni_Registar port map(CLK => CLK_in, RST => RST_in, EN => EN_in, ulaz => ulaz_in , izlaz => izlaz_out);
    process 
        begin

            CLK_in <= '0'; RST_in <= '0'; EN_in <= '1'; wait for 10 ns;

            CLK_in <= '1'; RST_in <= '1'; ulaz_in <= "1000000001"; wait for 10 ns;
            assert (izlaz_out = "0000000000") report "Greska pri resetu" severity error;
            CLK_in <= '0'; RST_in <= '0'; wait for 10 ns;

            CLK_in <= '1'; ulaz_in <= "1000000001"; wait for 10 ns;
            assert (izlaz_out = "1000000001") report "Greska pri upisu" severity error;
            CLK_in <= '0'; wait for 10 ns;

            CLK_in <= '1'; ulaz_in <= "1000000000"; wait for 10 ns;
            assert (izlaz_out = "1000000000") report "Greska pri upisu" severity error;
            CLK_in <= '0'; wait for 10 ns;

            CLK_in <= '1'; RST_in <= '1'; wait for 10 ns;
            assert (izlaz_out = "0000000000") report "Greska pri upisu" severity error;
            CLK_in <= '0'; RST_in <= '0'; wait for 10 ns;

            CLK_in <= '1'; ulaz_in <= "1111111111"; wait for 10 ns;
            assert (izlaz_out = "1111111111") report "Greska pri upisu" severity error;
            CLK_in <= '0'; wait for 10 ns;

            CLK_in <= '1'; EN_in <= '0'; ulaz_in <= "1000111001"; wait for 10 ns;
            assert (izlaz_out = "1111111111") report "Greska pri EN=0" severity error;
            CLK_in <= '0'; wait for 10 ns;

            CLK_in <= '1'; RST_in <= '1'; wait for 10 ns;
            assert (izlaz_out = "0000000000") report "Greska pri resetu" severity error;
            CLK_in <= '0'; wait for 10 ns;

         assert false report "Test zavrsen." severity note;
        wait;
    end process;
end Stacionarni_Registar_tb_beh; 