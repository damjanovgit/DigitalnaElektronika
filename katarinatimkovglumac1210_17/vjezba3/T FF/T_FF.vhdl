library IEEE;
use IEEE.std_logic_1164.all;

entity T_FF is 
port ( 
    T, CLK : in std_logic;
    reset : in std_logic;
    Q, Q_cp : out std_logic
);
end T_FF;

architecture T_FF_beh of T_FF is
signal stanje : std_logic:= '1';

begin
process(CLK)
begin
        if falling_edge(CLK) then
            if (T = '1') then
                stanje <= not(stanje);
            elsif (T = '0') then
                stanje <= stanje;
            end if;
        end if;  
    end process;
Q <= stanje;
Q_cp <= not(stanje);
end T_FF_beh;




