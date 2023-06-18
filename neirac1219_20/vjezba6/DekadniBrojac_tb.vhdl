library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DekadniBrojac_tb is
end DekadniBrojac_tb;

architecture DekadniBrojac_tb_beh of DekadniBrojac_tb is

    component DekadniBrojac is
        port(   
            RST, CLK, nacin : in std_logic;
            izlaz : out std_logic_vector(3 downto 0)
        );
    end component;

    signal RST_in, CLK_in : std_logic :='0';
    signal nacin_in : std_logic;
    signal izlaz_out : std_logic_vector(3 downto 0);

begin
    DUT: DekadniBrojac port map(RST => RST_in, CLK => CLK_in, nacin => nacin_in, izlaz => izlaz_out);
    
    process begin

        nacin_in <= '1';
        RST_in <= '1';
        CLK_in <= '0';

        wait for 1 ns;

        CLK_in <= '1';

        wait for 1 ns;
        assert(izlaz_out = "0000") report "Neispravan izlaz pri resetovanju na nulu." severity error;
     
        CLK_in <= '0';
        RST_in <= '0';
        wait for 1 ns;

        for i in 1 to 9 loop

            CLK_in <= '1';
            wait for 1 ns;
            assert(i = to_integer(unsigned(izlaz_out))) report "Greska pri brojanju unaprijed, i = " & integer'image(i) severity error;
            CLK_in <= '0';
            wait for 1 ns;
        end loop;

        RST_in <= '1';
        CLK_in <= '0';
        wait for 1 ns;
        CLK_in <= '1';
        wait for 1 ns;
    
        assert(izlaz_out = "0000") report "Neispravan izlaz pri resetovanju na nulu." severity error;
        CLK_in <= '0';
        wait for 1 ns;
        nacin_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        
        assert(izlaz_out = "1001") report "Neispravan izlaz pri resetovanju na devet." severity error;
        RST_in <= '0';
        for i in 8 downto 0 loop
            CLK_in <= '0';
            wait for 1 ns;
            CLK_in <= '1';
            wait for 1 ns;
            assert(i = to_integer(unsigned(izlaz_out))) report "Neispravan izlaz pri brojanju unazad, i = " & integer'image(i) severity error;
        end loop;

        assert false report "Test zavrsen." severity note;
        wait;
    end process;
end DekadniBrojac_tb_beh ; 