library IEEE;
use IEEE.std_logic_1164.all;

entity JK_FF is port(
    J, K, CLK, RST : in std_logic;
    Q, Q_cp : out std_logic
);
end JK_FF;

architecture JK_FF_tb of JK_FF is

signal ulaz : std_logic_vector (1 downto 0);
signal stanje : std_logic;
begin
ulaz <= J & K;

 process(CLK, RST)

 
 begin
 if (RST = '0') then stanje <= '0';
 elsif (CLK'event and CLK='1') then
    if(J='0' and K='0') then
        stanje <= stanje;
    elsif(J='0' and K='1') then
        stanje <= '0';
    elsif(J='1' and K='0') then
        stanje <= '1';
    elsif(J='1' and K='1') then
        stanje <= not stanje;
    else
        null;
    end if;
else
    null;
end if;

Q <= stanje;
Q_cp <= not stanje;

end process;
end JK_FF_tb;