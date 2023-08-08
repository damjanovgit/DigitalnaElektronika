
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_registar_tb is 
end s_registar_tb;

architecture s_registar_tb_beh of s_registar_tb is
      

    component s_registar is port
    (
        CLR,CLK,E : in std_logic;
    data_in : in std_logic_vector(9 downto 0);
    data_out : out std_logic_vector(9 downto 0)
    );
    end component;


    
    signal clock, reset, enable : std_logic :='0';
    signal input_data, output_data: std_logic_vector(9 downto 0) := "0000000000";
   
begin

    hac:s_registar port map(CLK => clock, CLR => reset, E => enable, data_in => input_data, data_out => output_data);


    process
    begin
    
      -- provjera reseta
    clock <= '0';
    reset <= '1';
    enable <= '1';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = "0000000000") report "Neispravan izlaz, CLR = 1" severity error;

    -- najniza vrijednost

    clock <= '0';
    reset <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    assert(output_data = input_data) report "Neispravan izlaz za najnizu vrijednost ulaza" severity error; 

    -- provjera ostalih vrijednosti na ulazu
    for count in 1 to 1023 loop
       clock <= '0';
       input_data <= std_logic_vector(unsigned(input_data) + 1);
       wait for 10 ns;
       clock <= '1';
       wait for 10 ns;
       assert(output_data = input_data) report "Neispravan izlaz count = " & integer'image(count) severity error;
    
    end loop;
    
    clock <= '0';
    wait for 10 ns;
    enable <= '1';
    reset <= '1';
    clock <= '1';
    wait for 10 ns;
    assert (output_data = "0000000000") report "Neispravn ilzaz 1, CLR = 1" severity error;


    assert false report "Test zavrsen." severity note;
    wait;

    end process;

end s_registar_tb_beh;

