library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture SHIFT_tb of testbench is 

component SHIFT_REG is port (

    CLK, RST : in std_logic;
    SEL : in std_logic_vector(1 downto 0);
    DATA_IN : in std_logic_vector(5 downto 0);
    DATA_OUT : out std_logic_vector(5 downto 0)

);

end component;

signal CLK_V, RST_V : std_logic;
signal SEL_V : std_logic_vector(1 downto 0);
signal DATA_IN_V : std_logic_vector(5 downto 0);
signal DATA_OUT_V : std_logic_vector(5 downto 0);

begin

DUT: SHIFT_REG port map 
(CLK_V, RST_V, SEL_V, DATA_IN_V, DATA_OUT_V);

CLK_V_process: process
begin
CLK_V <= '0';
wait for 5 ns;
CLK_V <='1';
wait for 5 ns;
end process;

process
begin

-- paralelan upis

DATA_IN_V <=  b"100001"; 
RST_V <= '1';
SEL_V <= "11";
wait for 20 ns;


-- udesno
-- sa pomjerajem, podatak prelazi u b110000, tj. x30
SEL_V <= "10";
wait for 10 ns;

-- ulijevo
SEL_V <= "01";
wait for 20 ns; 

-- nepromijenjeno stanje 
SEL_V <= "00";
wait for 20 ns;

RST_V <= '0';
wait;

end process;
end SHIFT_tb;









