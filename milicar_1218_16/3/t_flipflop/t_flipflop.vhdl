library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t_flipflop is
    port 
    (
        clk : in std_logic;
        t : in std_logic;
        reset : in std_logic;
        q : out std_logic
    );
end t_flipflop;

architecture t_flipflop_arch of t_flipflop is
    signal t_sig : std_logic;  
begin 
process(clk,reset)
begin
if(reset = '1') then 
    t_sig <= '0';
elsif (rising_edge(clk)) then
    if (t='1') then
        t_sig <= not t_sig;
    else
        t_sig <= t_sig;
    end if;
end if;      
end process;

q<=t_sig;

end t_flipflop_arch;