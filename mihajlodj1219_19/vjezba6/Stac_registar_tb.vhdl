library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Stac_registar_tb is
end entity Stac_registar_tb;

architecture arh_Stac_registar_tb of Stac_registar_tb is

    component Stac_registar is
        port(
            clock, reset, enable: in std_logic;
            input_data : in std_logic_vector(9 downto 0);
            output_data : out std_logic_vector(9 downto 0)
        );
        end component Stac_registar;

    
        signal clock_in: std_logic := '0';
        signal reset_in: std_logic := '1';
        signal enable_in: std_logic := '1';
        signal input_data_in: std_logic_vector(9 downto 0) := "0000000000";
        signal output_data_out: std_logic_vector(9 downto 0) := "0000000000";

        begin

            DUT: Stac_registar port map (clock_in, reset_in, enable_in, input_data_in, output_data_out);

            parametri: process
            begin

                --odmah provjeravam da li funkcionise reset
                wait for 1 ns;
                clock_in <= '1';
                wait for 1 ns;
                assert(output_data_out = "0000000000") report "Neispravan izlaz kada je aktivan reset" severity error;

                --provjera upisa najnize ulazne vrijednosti
                clock_in <= '0';
                reset_in <= '0';
                wait for 1 ns;
                clock_in <= '1';
                wait for 1 ns;
                assert(output_data_out = input_data_in) report "Neispravan izlaz za najnizu vrijednost ulaza" severity error;

                --provjera upisa svih ostalih mogucih vrijednosti na ulazu
                for count in 1 to 1023 loop
                    clock_in <= '0';
                    input_data_in <= std_logic_vector(unsigned(input_data_in) + 1);
                    wait for 1 ns;
                    clock_in <= '1';
                    wait for 1 ns;
                    assert(output_data_out = input_data_in) report "Neispravan izlaz za dekadnu vrijednost " & integer'image(count) severity error;
                end loop;
                
                --ponovna provjera reseta sa nekog nenultog stanja registra
                clock_in <= '0';
                reset_in <= '1';
                wait for 1 ns;
                clock_in <= '1';
                wait for 1 ns;
                assert(output_data_out = "0000000000") report "Neispravan izlaz kada je aktivan reset" severity error;

                --provjera zadrzavanja prethodnog stanja kada je enable na niskom nivou
                clock_in <= '0';
                reset_in <= '0';
                enable_in <= '0';
                input_data_in <= "0000000001"; --na primjer pokusamo ovu vrijednost upisati u stacionarni registar
                wait for 1 ns;
                clock_in <= '1';
                wait for 1 ns;
                assert(output_data_out = "0000000000") report "Izlaz nije zadrzao prethodno stanje kada je enable na niskom nivou" severity error;

                --provjera upisa kada se enable vrati na visok nivo
                clock_in <= '0';
                enable_in <= '1';
                wait for 1 ns;
                clock_in <= '1';
                wait for 1 ns;
                assert(output_data_out = input_data_in) report "Neispravan izlaz za visok nivo enable signala" severity error;

            assert false report "Test zavrsen!" severity note;
            wait;
            end process parametri;
end architecture arh_Stac_registar_tb; 


