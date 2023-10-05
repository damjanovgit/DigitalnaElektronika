library ieee;                   
use ieee.std_logic_1164.all;

entity T_flipflop is
port(T,CLK : in std_logic;
     Q,nQ : out std_logic
);
end T_flipflop;

architecture T_flipflop_beh of T_flipflop is
    signal temp : std_logic := '1';
    begin
        process(CLK) is
        begin
                if falling_edge(CLK) then 
                        if (T = '1') then temp <= not(temp);
                        elsif (T= '0') then temp <= temp;                                
                        end if;
                end if;                        
        end process;

        Q <= temp;
        nQ <= not(temp);

end T_flipflop_beh;