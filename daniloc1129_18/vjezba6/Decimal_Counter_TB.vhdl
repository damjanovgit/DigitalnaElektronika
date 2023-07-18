library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Decimal_Counter_TB is
end entity Decimal_Counter_TB;

architecture Decimal_Counter_TB_beh of Decimal_Counter_TB is
component Decimal_Counter is
port(   
      CLK, clear, Up_Down : in std_logic;
	  output : out std_logic_vector(3 downto 0)
    );
end component Decimal_Counter;

    signal CLK_in : std_logic :='0';
	signal clear_in : std_logic :='1';
    signal Up_Down_in : std_logic;
    signal output_out : std_logic_vector(3 downto 0);

begin
    DUT: Decimal_Counter port map(clear => clear_in, CLK => CLK_in, Up_Down => Up_Down_in, output => output_out);
    Decimal_Counter_TB_proc:process 
	begin
        Up_Down_in <= '1';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns;
        assert(output_out = "0000") report "For forward counting and active clear ,Output should be '0000'." severity error;
        
        clear_in <= '0';
        for i in 1 to 9 loop
            CLK_in <= '0';
            wait for 5 ns; 
			CLK_in <= '1';
			wait for 5 ns;
            assert(i = to_integer(unsigned(output_out))) report "For forward counting without active clear ,Output should be = " & integer'image(i) severity error;
        end loop;
		
		CLK_in <= '0';
        clear_in <= '1';
        wait for 5 ns;
        CLK_in <= '1';
        wait for 5 ns; 
        assert(output_out = "0000") report "For forward counting and active clear ,Output should be '0000'." severity error;
		
        CLK_in <= '0';
        wait for 5 ns;
        Up_Down_in <= '0';
        CLK_in <= '1';
        wait for 5 ns;
        assert(output_out = "1001") report "For backward counting and active clear ,Output should be '1001'." severity error;
		
        clear_in <= '0';
        for j in 8 downto 0 loop
            CLK_in <= '0';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
            assert(j = to_integer(unsigned(output_out))) report "For backward counting without active clear ,Output should be = " & integer'image(j) severity error;
        end loop;

        assert false report "Test done." severity note;
        wait;
    end process Decimal_Counter_TB_proc;
end architecture Decimal_Counter_TB_beh ; 