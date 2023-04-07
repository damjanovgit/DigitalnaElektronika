library ieee;                   
use ieee.std_logic_1164.all;

entity t_ff is
port(t,clk : in std_logic;
     q,qnot : out std_logic
);
end t_ff;

architecture beh_t_ff of t_ff is
    signal temp : std_logic := '0';
    begin
        process(clk) is
        begin
                if (clk'event and clk = '0') then 
                        if (t = '1') then temp <= not(temp);
                        else temp <= temp;                                
                        end if;
                end if;                        
        end process;

        q <= temp;
        qnot <= not(temp);

end beh_t_ff;