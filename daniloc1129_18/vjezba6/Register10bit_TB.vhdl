library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register10bit_TB is
end Register10bit_TB;

architecture Register10bit_TB_beh of Register10bit_TB is
component Register10bit is
port(
		CLK, clear, enable : in std_logic;
		input : in std_logic_vector(9 downto 0);
		output : out std_logic_vector(9 downto 0)
	);
end component Register10bit;

    signal CLK_in, clear_in, enable_in : std_logic :='0';
    signal input_in, output_out : std_logic_vector(9 downto 0) := "0000000000";
begin
    DUT: Register10bit port map(CLK => CLK_in, clear => clear_in, enable => enable_in, input => input_in, output => output_out);
    Register10bit_TB_proc:process begin
	
       
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "0000000000") report "No change on enable or input(both 0), output state should be 0" severity error;
		
		input_in <="0000000111";
		CLK_in <= '0';
		wait for 5 ns;
		CLK_in <= '1';
		wait for 5 ns;
		assert (output_out = "0000000000") report "No change on enable (still 0), output state should be 0" severity error;
		
		enable_in <= '1';
		
        for i in 1 to 1023 loop
           CLK_in <= '0';
           wait for 5 ns;
           input_in <= std_logic_vector(to_unsigned(i, input_in'length));
           CLK_in <= '1';
           wait for 5 ns;
           assert (input_in = output_out) report "Wrong output value for input i = " & integer'image(i) severity error;
        end loop;
		
        CLK_in <= '0';
		clear_in <= '1';
        
		
        wait for 5 ns;
		CLK_in <= '1';
        enable_in <= '0';
        wait for 5 ns;
        assert (output_out = "0000000000") report "Output should have been reset (0)" severity error;
        
        assert false report "Test done." severity note;
        wait;
    end process Register10bit_TB_proc;
end architecture Register10bit_TB_beh ; 