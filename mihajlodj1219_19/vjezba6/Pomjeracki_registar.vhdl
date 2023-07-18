library ieee;
use ieee.std_logic_1164.all;

entity Pomjeracki_registar is
port(
    clk, rst, L_input, R_input: in std_logic;
    mode : in std_logic_vector(1 downto 0);
    parallel_input : in std_logic_vector(5 downto 0);
    parallel_output : out std_logic_vector(5 downto 0)
);
end entity Pomjeracki_registar;

architecture arh_Pomjeracki_registar of Pomjeracki_registar is

    signal pom : std_logic_vector(5 downto 0) := "000000";

begin
    parallel_output <= pom;
    process(clk, rst)
    begin
        if (rst = '0') then
            pom <= "000000";
        elsif (rising_edge(clk)) then
            if (mode = "00") then
                pom <= pom(4 downto 0) & L_input; --pomjeranje ulijevo
            elsif (mode = "01") then
                pom <= R_input & pom(5 downto 1); --pomjeranje udesno
            elsif (mode = "10") then
                pom <= parallel_input; --paralelni upis
            end if; --zadrzavanje prethodne vrijednosti ne zahtjeva nikakve pormjene pa je taj slucaj prosto izostavljen
        end if;
    end process;
end architecture arh_Pomjeracki_registar; 
                