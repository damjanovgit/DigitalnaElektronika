library ieee;
use ieee.std_logic_1164.all;

entity D_flip_flop is
port(
    D, clk : in std_logic;
    Q, nQ : out std_logic
);
end D_flip_flop;

architecture D_flip_flop_beh of D_flip_flop is
signal outp : std_logic := '0';
begin
process(clk)
begin
if (clk = '1' and clk'event) then
    if (D = '1') then
        outp <= '1';
    else
        outp <= '0';
    end if;
end if;
Q <= outp;
nQ <= not(outp);
end process;
end D_flip_flop_beh;