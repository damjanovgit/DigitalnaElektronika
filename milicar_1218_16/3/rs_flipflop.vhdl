library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	
entity rs_flipflop is
	port
	(
		-- Input ports
		r	: in  std_logic;
		s	: in  std_logic;
		clk	: in  std_logic;
        reset : in std_logic;
		-- Output ports
		q	: out std_logic
	);
end rs_flipflop;

architecture rs_flipflop_arch of rs_flipflop is

signal qn : std_logic;

begin

process(clk,reset)
begin
if(reset='1') then 
    qn<='0';
elsif (rising_edge(clk)) then
	if (r='0' and s='0') then
		qn<=qn;
	elsif (r='0' and s='1') then
		qn<='1';
	elsif (r='1' and s='0') then
		qn<='0';
	else
		qn <= 'X';
	end if;
end if;

end process;

q<=qn;

end rs_flipflop_arch;