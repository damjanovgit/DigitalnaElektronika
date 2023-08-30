
library ieee;
use ieee.std_logic_1164.all;

entity p_registar is port
(
    data_in: in std_logic_vector(5 downto 0);
    data_out: out std_logic_vector(5 downto 0);
    CLK, CLR, LIN, RIN :in  std_logic;
    mode : in std_logic_vector(1 downto 0)
);
end p_registar;

architecture p_registar_beh of p_registar is 

    signal state : std_logic_vector(5 downto 0) :="000000";
begin
    data_out <= state;
    process(CLK, CLR)
    begin

    if (CLR = '0')then 
        state <= "000000";    -- asinhrono restovanje
    else

        if(rising_edge(CLK) and mode = "00")then
            state <= state;  --zadrzavanje starog stanja 

        elsif(rising_edge(CLK) and mode = "01")then
             for i in 0 to 4 loop       -- pomjeranje udesno 
                state(i) <= state(i+1);
             end loop;
             state(5) <= RIN;

        elsif(rising_edge(CLK) and mode = "10")then     
            for i in 5 downto 1 loop     -- pomijeranje ulijevo 
                state(i) <= state(i-1);
            end loop;
            state(0) <= LIN;  

        elsif(rising_edge(CLK) and mode = "11")then  
            state <= data_in;     -- paralelno upisivanje 

        end if;
    end if;

    end process; 
       
end p_registar_beh;

