library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture tb of tb is
    component DekadniBrojac is
        port (
            ulaz, takt, reset : in std_logic;
            izlaz : out std_logic_vector(3 downto 0)
        );
    end component;

    signal ulaz_in, takt_in, reset_in : std_logic;
    signal izlaz_out : std_logic_vector(3 downto 0);
begin
    DUT: DekadniBrojac port map (ulaz_in, takt_in, reset_in, izlaz_out);

    process
    begin
        takt_in <= '0';
        reset_in <= '1';
        ulaz_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        reset_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        ulaz_in <= '1';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        reset_in <= '1';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        reset_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        takt_in <= '1';
        wait for 1 ns;

        takt_in <= '0';
        wait for 1 ns;

        wait;
    end process;
end tb;
