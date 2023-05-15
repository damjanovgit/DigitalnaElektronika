library ieee;
use ieee.std_logic_1164.all;

entity pom_reg_6 is
port(   data_in  : in  std_logic_vector(5 downto 0);
        data_out : out std_logic_vector(5 downto 0);
        s_mode   : in  std_logic_vector(1 downto 0);
        R_in, L_in, clk, clr : in std_logic
); end pom_reg_6;

architecture beh_pom_reg_6 of pom_reg_6 is
   signal output_prev, output_next : std_logic_vector(5 downto 0) :=  "000000";
begin
process(clk, clr)
begin
    if (clr = '0') then 
                                                         
                                                        output_next <= "000000";                        -- asinhroni reset
                                                        
    else
        if (rising_edge(clk) and s_mode = "11") then                                                     
                                                        output_next <= data_in;                         -- paralelan upis
                                                        
                                                        
        elsif (rising_edge(clk) and s_mode = "10") then 
                                                        for i in 0 to 4 loop
                                                            output_next(i+1) <= output_prev(i);          -- pomeranje ulevo
                                                        end loop;
                                                            output_next(0) <= L_in;
                                                        
        elsif (rising_edge(clk) and s_mode = "01") then 
                                                        for i in 1 to 5 loop
                                                            output_next(i-1) <= output_prev(i);         -- pomeranje udesno
                                                        end loop;
                                                            output_next(5) <= R_in;
                                                        
        elsif (rising_edge(clk) and s_mode = "00") then  
                                                        output_next <= output_next;                     -- zadrzavanje stare vredosti
                                                          
        end if;
    end if;                 
end process;
    output_prev <= output_next;
    data_out <= output_next;
end beh_pom_reg_6;