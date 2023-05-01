library ieee;
use ieee.std_logic_1164.all;

entity JK_flip_flop is 
port(
    J, K, clk : in std_logic;
    Q, nQ : out std_logic
);
end JK_flip_flop;

architecture JK_flip_flop_beh of JK_flip_flop is
signal outp : std_logic := '0';
begin
process(clk)
begin
if(clk = '1' and clk'event) then
    if (J = '1' and K = '1') then
        outp <= not(outp);
    elsif (J = '1' and K = '0') then
        outp <= '1';
    elsif (J = '0' and K = '1') then
        outp <= '0';
    elsif (J = '0' and K = '0') then
        outp <= outp;
    end if;
end if;
Q <= outp;
nQ <= not(outp);
end process;
end JK_flip_flop_beh;