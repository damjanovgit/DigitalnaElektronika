

library ieee;
use ieee.std_logic_1164.all;

entity p_registar_tb is 
end p_registar_tb;

architecture p_registar_tb_beh of p_registar_tb is 

    component p_registar is port
    (
        data_in: in std_logic_vector(5 downto 0);
        data_out: out std_logic_vector(5 downto 0);
        CLK, CLR, LIN, RIN :in  std_logic;
        mode : in std_logic_vector(1 downto 0)
    );
    end component;

    signal clock,lin,rin : std_logic :='0';
    signal reset : std_logic :='1';
    signal m_in : std_logic_vector(1 downto 0) := "00";
    signal input_data, output_data : std_logic_vector( 5 downto 0) :="000000";

begin 

    hac: p_registar port map
    (
        CLK => clock,
        CLR => reset,
        RIN => rin,
        LIN => lin,
        mode => m_in,
        data_in => input_data,
        data_out => output_data
    );

    process
    begin

    clock <= '0';
    wait for 10 ns;
    assert(output_data = "000000") report "Neispravan izlaz,  ulaz je 000000 ." severity error;

    input_data <= "100010";
    m_in <= "11";
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "100010") report "Neispravan izlaz, pri paralelnom upisu" severity error;
    
    
    clock <= '0';
    wait for 10 ns;
    rin <= '0';
    m_in <= "01";
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "010001") report "Neispravan izlaz, pri pomjeranju u desno" severity error;
    
     
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "001000") report "Neispravan izlaz, pri pomjeranju u desno" severity error;
    
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "000100") report "Neispravan izlaz, pri pomjeranju u desno" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "000010") report "Neispravan izlaz, pri pomjeranju u desno" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "000001") report "Neispravan izlaz, pri pomjeranju u desno" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "000000") report "Neispravan izlaz, pri pomjeranju u desno" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    lin <= '1';
    m_in <="10";
    wait for 10 ns;
    assert(output_data = "000001") report "Neispravan izlaz, pri pomjeranju u lijevo" severity error;
    
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "000011") report "Neispravan izlaz, pri pomjeranju u lijevo" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "000111") report "Neispravan izlaz, pri pomjeranju u lijevo" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "001111") report "Neispravan izlaz, pri pomjeranju u lijevo" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "011111") report "Neispravan izlaz, pri pomjeranju u lijevo" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "111111") report "Neispravan izlaz, pri pomjeranju u lijevo" severity error;

    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    m_in <= "00";
    wait for 10 ns;
    assert(output_data = "111111") report "Neispravan izlaz, pri zadrzavanju prethodnog stanja" severity error;

    clock <= '0';
    wait for 10 ns;
    reset <= '0';
    wait for 10 ns;
    assert(output_data = "000000") report "Neispravan izlaz, pri resertovanju " severity error;

    assert false report "Test je zavrsen." severity note;
    wait;
    end process;

end p_registar_tb_beh;
