library ieee;
use ieee.std_logic_1164.all;

-- dekadni brojac sa sihronim resetom, sa mogucnosti brojanja up-down 
-- ako je up_down vrijenosti jedan broji unaprijen, u slucaju da je nula onda je obrnuto


entity d_brojac is port
(
    CLK, CLR, up_down : in std_logic;
    data_out : out std_logic_vector( 3 downto 0)
);
end d_brojac;

architecture d_brojac_beh of d_brojac is 

    type  states is (s0, s1 ,s2 ,s3, s4, s5, s6,s7,s8,s9);
    signal pr_state, next_state : states;

begin
      -- sekvencijalni dio 
    seq_logic: process(CLK, CLR)
    begin

        if(rising_edge(CLK))then
            if(CLR = '1' and up_down = '1')then
                pr_state <= s0;

            elsif(CLR ='1' and up_down = '0')then
                pr_state <= s9;

            else 
                pr_state <= next_state;
            end if;
        end if;
    end process;

    -- kombinacioni dio 

    comb_logic: process(pr_state)
    begin

        case pr_state is

            when s0 => data_out <= "0000";

                 if (up_down = '1')then
                    next_state <= s1;
                 else 
                    next_state <= s9;
                 end if;

            when s1 => data_out <= "0001";

                 if (up_down = '1')then
                    next_state <= s2;
                 else 
                    next_state <= s0;
                 end if;

            when s2 => data_out <= "0010";

                 if (up_down = '1')then
                    next_state <= s3;
                 else 
                    next_state <= s1;
                 end if;          
            when s3 => data_out <= "0011";

                 if (up_down = '1')then
                    next_state <= s4;
                 else 
                    next_state <= s2;
                 end if;

            when s4 => data_out <= "0100";

                 if (up_down = '1')then
                    next_state <= s5;
                 else 
                    next_state <= s3;
                 end if;

            when s5 => data_out <= "0101";

                 if (up_down = '1')then
                    next_state <= s6;
                 else 
                    next_state <= s4;
                 end if;

            when s6 => data_out <= "0110";

                 if (up_down = '1')then
                    next_state <= s7;
                 else 
                    next_state <= s5;
                 end if;

            when s7 => data_out <= "0111";

                 if (up_down = '1')then
                    next_state <= s8;
                 else 
                    next_state <= s6;
                 end if;

            when s8 => data_out <= "1000";

                 if (up_down = '1')then
                    next_state <= s9;
                 else 
                    next_state <= s7;
                 end if;

            when s9 => data_out <= "1001";

                 if (up_down = '1')then
                    next_state <= s0;
                 else 
                    next_state <= s8;
                 end if;

        end case;
    end process;
end d_brojac_beh;