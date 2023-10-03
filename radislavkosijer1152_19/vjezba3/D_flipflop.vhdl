library IEEE;
use IEEE.std_logic_1164.all;

entity D_flipflop is 
port (
    D, CLK : in std_logic;
    Q, nQ : out std_logic
);
end D_flipflop;

architecture D_flipflop_beh  of D_flipflop is
signal output : std_logic := '0' ;
begin
process(CLK)
begin

if (CLK = '1' and CLK'event) then
    if(D= '1') then
        output <= '1';
    else 
        output <= '0';
    end if;
end if;
Q <= output;
nQ <= not(output);

end process;
end D_flipflop_beh;