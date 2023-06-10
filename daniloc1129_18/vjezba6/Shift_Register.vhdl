library ieee;
use ieee.std_logic_1164.all;

entity Shift_Register is
port(
      CLK, clear, R_IN, L_IN : in std_logic;
	  mode : in std_logic_vector(1 downto 0);
      input : in std_logic_vector(5 downto 0);
	  output : out std_logic_vector(5 downto 0)
    );
end entity Shift_Register;

architecture Shift_Register_beh of Shift_Register is
    
signal temp : std_logic_vector(5 downto 0) := "000000";

begin
    
     Shift_Register_proc:process(CLK, clear) 
	 begin
        if(clear = '0') then temp <= "000000";
        elsif(rising_edge(CLK)) then
           if(mode = "00") then temp <= temp;
		
		   elsif(mode = "01") then temp <= R_IN & temp(5 downto 1);  ---Right shift
               
           elsif(mode = "10") then temp <= temp(4 downto 0) & L_IN;   --Left shift
              
           elsif (mode = "11") then  temp <= input;
               
           end if;
        end if;
     end process Shift_Register_proc;
	output <= temp;
end architecture Shift_Register_beh;