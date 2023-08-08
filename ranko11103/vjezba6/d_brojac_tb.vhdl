

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_brojac_tb is 
end d_brojac_tb;

architecture d_brojac_tb_beh of d_brojac_tb is

    component d_brojac is port
    (
        CLK, CLR, up_down : in std_logic;
        data_out : out std_logic_vector( 3 downto 0)
    );
    end component;

    signal clock, reset, u_d : std_logic := '0';
    signal output_data : std_logic_vector(3 downto 0) := "0000";

begin

    hac: d_brojac port map
    (
        CLK => clock,
        CLR => reset,
        up_down => u_d,
        data_out => output_data
    );

    process
    begin

    reset <= '1';
    u_d <= '1';
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data= "0000") report "Neispravan izlaz, brojac resertovan da broji unaprijed" severity error;

    clock <= '0';
    u_d <='0';
    reset <= '1';
    wait for 10 ns;
    clock <='1';
    wait for 10 ns;
    assert(output_data = "1001") report "Neispravan izlaz, brojac resertovan da broji unazad" severity error;

    reset <= '0';
    clock <='0';
    wait for 10 ns;
    for m in 8 downto 0 loop
        clock <= '1';
        wait for 10 ns;
        assert(output_data = std_logic_vector(to_unsigned(m, 4))) report "Neispravan izlaz,brojac broji  unazad na " & integer'image(m) severity error;
        clock <='0';
        wait for 10 ns;
    end loop;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "1001") report "Neispravan izlaz, brojac prelazi sa 0  na 9" severity error;

    reset <= '1';
    u_d <= '1';
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data= "0000") report "Neispravan izlaz, brojac resertovan da broji unaprijed" severity error;

    reset <= '0';
    clock <= '0';
    wait for 10 ns;
    for i in 1 to 9 loop
        clock <= '1';
        wait for 10 ns;
        assert(output_data = std_logic_vector(to_unsigned(i, 4))) report "Neispravan izlaz, brojac broji  unaprijed na " & integer'image(i) severity error;
        clock <= '0';
        wait for 10 ns;         
    end loop;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "0000") report "Neispravan izlaz, pri  prelasku sa 9  na 0" severity error;

    assert false report "Test je zavrsen." severity note;
    wait;

    end process;

end d_brojac_tb_beh;    


