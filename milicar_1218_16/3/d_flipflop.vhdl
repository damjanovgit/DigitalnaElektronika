library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_flipflop is
    port(
        clk : in std_logic;
        d: in std_logic;
        reset : in std_logic;
        q : out std_logic

    );
    end d_flipflop;

    architecture d_flipflop_arch of d_flipflop is
    begin
    process(clk,reset)
     begin
    if(reset='1') then 
    q <= '0';
    elsif(rising_edge(clk)) then
     q <= d;
     end if;

    end process;

     end d_flipflop_arch;