library ieee;
use ieee.std_logic_1164.all;

entity Shift_Register_TB is
end Shift_Register_TB;

architecture Shift_Register_TB_beh of Shift_Register_TB is
component Shift_Register is
port(
        CLK, clear, R_IN, L_IN : in std_logic;
		mode : in std_logic_vector(1 downto 0);
		input : in std_logic_vector(5 downto 0);
		output : out std_logic_vector(5 downto 0)
    );
end component Shift_Register;

    signal CLK_in, R_IN_in, L_IN_in : std_logic :='0';
    signal clear_in : std_logic :='1';
    signal mode_in : std_logic_vector(1 downto 0) := "00";
    signal input_in, output_out : std_logic_vector(5 downto 0) :="000000";

begin
    DUT: Shift_Register port map(CLK => CLK_in, clear => clear_in,R_IN => R_IN_in, L_IN => L_IN_in, mode => mode_in, input => input_in, output => output_out);
    Shift_Register_TB_proc:process 
	begin
       
        wait for 5 ns;
		input_in <= "111111";
		CLK_in <= '1';
		wait for 5 ns;
        assert (output_out = "000000") report "For mode '00' output should stay the same" severity error;
        CLK_in <= '0';
		wait for 5 ns;
        mode_in <= "11";
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "111111") report "For mode '11' output should follow the input" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        R_IN_in <= '0';
        mode_in <= "01";
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "011111") report "After right shift output should be '011111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "001111") report "After right shift output should be '001111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000111") report "After right shift output should be '000111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000011") report "After right shift output should be '000011'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000001") report "After right shift output should be '000001'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000000") report "After right shift output should be '000000'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        L_IN_in <= '1';
        mode_in <= "10";
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000001") report "After left shift output should be '000001'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000011") report "After left shift output should be '000011'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "000111") report "After left shift output should be '000111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "001111") report "After left shift output should be '001111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "011111") report "After left shift output should be '011111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert (output_out = "111111") report "After left shift output should be '111111'" severity error;
        CLK_in <= '0';
        wait for 5 ns;
        clear_in <= '0';
        wait for 5 ns;
        assert (output_out = "000000") report "For clear=0 output should be reset to '000000'" severity error;
        
        assert false report "Test done." severity note;
        wait;
    end process Shift_Register_TB_proc;
end architecture Shift_Register_TB_beh;