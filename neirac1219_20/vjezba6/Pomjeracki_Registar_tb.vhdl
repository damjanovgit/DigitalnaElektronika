library ieee;
use ieee.std_logic_1164.all;

entity Pomjeracki_Registar_tb is
end entity Pomjeracki_Registar_tb;

architecture Pomjeracki_Registar_tb_beh of Pomjeracki_Registar_tb is

    component Pomjeracki_Registar is
        port(
            CLK, RST, L_ulaz, R_ulaz: in std_logic;
            mode : in std_logic_vector(1 downto 0);
            ulaz : in std_logic_vector(5 downto 0);
            izlaz : out std_logic_vector(5 downto 0)
        );
        end component;

        signal CLK_in: std_logic := '0';
        signal RST_in: std_logic := '0';
        signal L_ulaz_in: std_logic := '0';
        signal R_ulaz_in: std_logic := '0';
        signal mode_in: std_logic_vector(1 downto 0) := "00";
        signal ulaz_in: std_logic_vector(5 downto 0) := "000000";
        signal izlaz_out: std_logic_vector(5 downto 0) := "000000";

        begin

            DUT: Pomjeracki_Registar port map (CLK_in, RST_in, L_ulaz_in, R_ulaz_in, mode_in, ulaz_in, izlaz_out);

            process

            begin

            RST_in <= '0'; CLK_in <= '0';  wait for 10 ns;
            assert (izlaz_out = "000000") report "Greska na pocetku" severity error;
            RST_in <= '1';              
            wait for 10 ns;

            
            CLK_in <= '1';  mode_in <= "11";  ulaz_in <="111010";  
            wait for 10 ns;
            assert (izlaz_out = "111010") report "Greska pri paralelnom upisu." severity error;
            CLK_in <= '0';  
            wait for 10 ns;

            CLK_in <= '1';  mode_in <= "01";  L_ulaz_in <= '1';  
            wait for 10 ns;
            assert (izlaz_out = "110101") report "Greska pri pomjeranju ulijevo." severity error;
            CLK_in <= '0';  
            wait for 10 ns;

            
            CLK_in <= '1';  mode_in <= "01";  L_ulaz_in <= '1';  
            wait for 10 ns;
            assert (izlaz_out = "101011") report "Greska pri pomjeranju ulijevo." severity error;
            CLK_in <= '0';  
            wait for 10 ns;
             
            CLK_in<= '1';  mode_in <= "00";  R_ulaz_in <= '1';  
            wait for 10 ns;
            assert (izlaz_out = "110101") report "Greska pri pomjeranju udesno." severity error;
            CLK_in <= '0';  
            wait for 10 ns;

            CLK_in <= '1';  mode_in <= "00";  R_ulaz_in <= '1'; 
            wait for 10 ns;
            assert (izlaz_out = "111010") report "Greska pri pomjeranju udesno." severity error;
            CLK_in <= '0'; 
            wait for 10 ns;

            CLK_in <= '1';  mode_in <= "10";                
            wait for 10 ns;
            assert (izlaz_out = "111010") report "Greska pri zadrzavanju stanja." severity error;
            CLK_in <= '0'; 
            wait for 10 ns;
            
            assert false report "Test zavrsen!" severity note;
            wait;
            end process;
end Pomjeracki_Registar_tb_beh;