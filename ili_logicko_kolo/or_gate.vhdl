

library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
port(
    A : in std_logic;
    B : in std_logic;
    C : out std_logic
);
end or_gate;

architecture or_gate_functionality of or_gate is
begin
C <= A or B;
end or_gate_functionality;