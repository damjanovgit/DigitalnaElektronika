library ieee;
use ieee.std_logic_1164.all;

entity T_flip_flop is
port(
    T, clk : in std_logic;
    Q, nQ : out std_logic
);
end T_flip_flop;

architecture T_flip_flop_beh of T_flip_flop is
signal outp : std_logic := '0';
begin
process(clk)
begin
if (clk = '1' and clk'event) then
    if (T = '1') then
        outp <= not(outp);
    end if;
end if;
Q <= outp;
nQ <= not(outp);
end process;
end T_flip_flop_beh;