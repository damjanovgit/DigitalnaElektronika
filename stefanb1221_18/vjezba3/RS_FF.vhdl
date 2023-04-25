library ieee;
use ieee.std_logic_1164.all;

entity RS_FF is 
port(
    R, S, CP : in std_logic;
    Q, Qn : out std_logic
);
end RS_FF;

architecture behavior of RS_FF is 
signal tmp : std_logic;
begin
    process(CP)
    begin
        if(rising_edge(CP)) then
            if(R='1' and S='0') then
                tmp<='0';
            elsif (R='0' and S='1') then
                tmp<='1';
            elsif (R='1' and S='1') then
                tmp<='X';
            end if;
        end if;
    end process;
Q<=tmp;
Qn<=not tmp;
end behavior;