library IEEE;
use IEEE.std_logic_1164.all;

entity RS_FF is
port (
    S, R, CLK : in std_logic;
    Q, Q_cp : out std_logic
);
end RS_FF;

architecture rs_ff_beh of RS_FF is
begin
 process(R,S,CLK) 
 begin
if (CLK='1' and CLK'event) then
-- S i R se razlikuju
    if (S /= R) then 
        Q <= S;
        Q_cp <= R;
    elsif(S='1' and R='1') then
        Q <= 'Z';
        Q_cp <= 'Z';
    end if;
end if;
end process;
end  architecture rs_ff_beh;


