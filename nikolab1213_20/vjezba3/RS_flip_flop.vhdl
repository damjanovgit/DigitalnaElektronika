library ieee;
use ieee.std_logic_1164.all;

entity RS_flip_flop is
port(
    R, S : in std_logic;
    Q, nQ : out std_logic
);
end RS_flip_flop;

architecture RS_flip_flop_beh of RS_flip_flop is 
signal A, B : std_logic;
begin
B <= S nor A;
A <= B nor R;
nQ <= B;
Q <= A;
end RS_flip_flop_beh;