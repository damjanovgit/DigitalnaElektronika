library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_counter_tb is
end entity;

architecture behavior of bcd_counter_tb is
    component bcd_counter is
        port(
            clk, clr, up_down : in std_logic;
            data_out : out std_logic_vector (3 downto 0)
        );
    end component bcd_counter;

    signal clock : std_logic :='0';
    signal clear : std_logic :='0';
    signal direction : std_logic :='0';
    signal datas : std_logic_vector (3 downto 0) := "0000";

begin
    DUT : bcd_counter port map (clock, clear, direction, datas);
    process
    begin
        wait for 10 ns;
        clock <='1';
        wait for 10 ns;
        clear <= '1';
        wait for 10 ns;
        direction <= '1';
        wait for 10 ns;
        assert (datas = "0000") report " Neispravan izlaz nakon reseta prilikom brojanja unaprijed" severity error;

        wait for 10 ns;
        clock <='1';
        wait for 10 ns;
        clear <= '1';
        wait for 10 ns;
        direction <= '0';
        wait for 10 ns;
        assert (datas = "1001") report " Neispravan izlaz nakon reseta prilikom brojanja unazad" severity error;
    
        clear <= '0';
            for i in 1 to 9 loop
                clock <= '0';
                wait for 10 ns;
                clock <= '1';
                wait for 10 ns;
                assert(datas = std_logic_vector(to_unsigned(i, 4))) report "Neispravan izlaz kada brojac broji unaprijed na" & integer'image(i) severity error;
            end loop;

        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert(datas = "0000") report "Neispravan izlaz kada brojac broji sa 9 na 0" severity error;
    
        clear <= '0';
            for n in 8 downto 0 loop
                clock <= '0';
                wait for 10 ns;
                clock <= '1';
                wait for 10 ns;
                assert(datas = std_logic_vector(to_unsigned(n, 4))) report "Neispravan izlaz kada brojac broji unazad na" & integer'image(n) severity error;
            end loop;

        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert(datas = "1001") report "Neispravan izlaz kada brojac broji sa 0 na 9" severity error;
    
        assert false report "Kraj testa" severity note;
        wait;
    end process;
end behavior;