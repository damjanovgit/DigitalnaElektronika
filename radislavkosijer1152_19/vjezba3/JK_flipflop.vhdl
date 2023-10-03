library ieee;

use ieee.std_logic_1164.all;

entity JK_flipflop is 
port(
    J, K, CLK : in std_logic;
    Q, nQ : out std_logic
);
end JK_flipflop;

architecture JK_flipflop_beh of JK_flipflop is
     signal temp: std_logic := '1';
begin
    JK_flipflop_proc: process(CLK)
    begin
        if falling_edge(CLK) then
            if( J = '0' and K = '1') then
                temp <= '0';
            elsif( J = '1' and K = '0') then
                temp <= '1';
            elsif( J = '1' and K = '1') then
                temp <= not temp;
            end if;
        end if;  
end process JK_flipflop_proc;
Q <= temp;
nQ <= not temp;
end JK_flipflop_beh; 