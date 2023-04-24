library ieee;
use ieee.std_logic_1164.all;

entity JK_FF is
    port(
        J, K, CP : in std_logic;
        Q, Qn : out std_logic
    );
end JK_FF;

architecture behavior of JK_FF is
signal tmp : std_logic;
begin
    process (CP)
    begin
        if (falling_edge(CP)) then
            if ( J = '1' and K = '0' ) then
                tmp <= '1';
            elsif ( J <= '0' and K = '1' ) then
                tmp <= '0';
            elsif ( J = '1' and K = '1' ) then
                tmp <= not tmp;
            elsif ( J = 'X' and K = 'X' ) then
                tmp <= tmp;
            end if;
        end if;
    end process;
Q <= tmp;
Qn <= not tmp;
end behavior ;