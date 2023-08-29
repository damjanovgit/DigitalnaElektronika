library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port(
        clk, rst, l_in, r_in : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        p_in : in std_logic_vector(5 downto 0);
        p_out : out std_logic_vector(5 downto 0)
    );
end entity;

architecture behavior of shift_register is
    signal tmp : std_logic_vector(5 downto 0) := "000000";
begin
    p_out <= tmp;
    process(clk, rst)
    begin
        if(rst='0') then
            tmp <= tmp;
        elsif (rising_edge(clk)) then
            if(mode = "00") then 
                tmp<=tmp(4 downto 0) & l_in;
            elsif(mode = "01") then 
                tmp<= r_in & tmp(5 downto 1);
            elsif(mode = "10") then
                tmp <= p_in;
            end if;
        end if;
    end process;
end behavior;