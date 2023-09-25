library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	
entity jk_flipflop is
	port
	(
		-- Input ports
		j	: in  std_logic;
		k	: in  std_logic;
		clk	: in  std_logic;
        reset : in std_logic;
		-- Output ports
		q	: out std_logic
	);
end jk_flipflop;

architecture jk_flipflop_arch of jk_flipflop is

signal qn : std_logic;

begin

process(clk,reset)
begin
if(reset='1') then 
    qn<='0';
elsif (rising_edge(clk)) then
	if (j='0' and k='0') then
		qn<=qn;
	elsif (j='0' and k='1') then
		qn<='0';
	elsif (j='1' and k='0') then
		qn<='1';
	else
		qn<=not qn;
	end if;
end if;

end process;

q<=qn;

end jk_flipflop_arch;