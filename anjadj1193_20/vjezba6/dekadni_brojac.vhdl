library ieee;
use ieee.std_logic_1164.all;

entity dekadni_brojac is
port(   clk, clr, cls, gd : in std_logic;
        data_out : out std_logic_vector(3 downto 0)
); end dekadni_brojac;

architecture beh_dekadni_brojac of dekadni_brojac is
    type states is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
    signal present_state, next_state : states;
begin

    -- sekvencijalni dio
    process(clk)
    begin
        if    (rising_edge(clk) and clr='1') then present_state <= S0;
        elsif (rising_edge(clk) and cls='1') then present_state <= S9;
        elsif (rising_edge(clk) and cls = '0' and clr = '0') then present_state <= next_state;
        end if;
    end process;

    -- kombinacioni dio
    process(present_state)
    begin
        case present_state is 
                                when S0 =>  data_out <= "0000"; 
                                            if (gd = '0') then next_state <= S1;
                                            else next_state <= S9;
                                            end if;

                                when S1 =>  data_out <= "0001";
                                            if (gd = '0') then next_state <= S2;
                                            else next_state <= S0;
                                            end if;

                                when S2 =>  data_out <= "0010";
                                            if (gd = '0') then next_state <= S3;
                                            else next_state <= S1;
                                            end if;

                                when S3 =>  data_out <= "0011"; 
                                            if (gd = '0') then next_state <= S4;
                                            else next_state <= S2;
                                            end if;

                                when S4 =>  data_out <= "0100";
                                            if (gd = '0') then next_state <= S5;
                                            else next_state <= S3;
                                            end if;

                                when S5 =>  data_out <= "0101";
                                            if (gd = '0') then next_state <= S6;
                                            else next_state <= S4;
                                            end if;

                                when S6 =>  data_out <= "0110"; 
                                            if (gd = '0') then next_state <= S7;
                                            else next_state <= S5;
                                            end if;

                                when S7 =>  data_out <= "0111";
                                            if (gd = '0') then next_state <= S8;
                                            else next_state <= S6;
                                            end if;

                                when S8 =>  data_out <= "1000";
                                            if (gd = '0') then next_state <= S9;
                                            else next_state <= S7;
                                            end if;

                                when S9 =>  data_out <= "1001";
                                            if (gd = '0') then next_state <= S0;
                                            else next_state <= S8; 
                                            end if;
        end case;
    end process;
    
end beh_dekadni_brojac;