library ieee;
use ieee.std_logic_1164.all;

entity bcd_counter is
port(
    clk, clr, up_down : in std_logic;
    data_out : out std_logic_vector (3 downto 0)
);
end entity;

architecture behavior of bcd_counter is
    type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
    signal current_state : states;
    signal next_state : states;
begin
    sekvencijalni_dio : process(clk, clr)
    begin
        if (rising_edge(clk)) then 
            if( clr = '1' and up_down = '1' ) then
                current_state <= s0;
            elsif( clr = '1' and up_down = '0' ) then
                current_state <= s9;
            else 
                current_state <= next_state;
            end if;
        end if;
    end process sekvencijalni_dio;

    kombionacioni_dio : process(current_state)
    begin
        case current_state is
            when s0 => data_out <= "0000";
            if(up_down='1') then
                next_state <= s1;
            elsif(up_down='0') then 
                next_state <= s9;
            end if;

            when s1 => data_out <= "0001";
            if(up_down='1') then
                next_state <= s2;
            elsif(up_down='0') then 
                next_state <= s0;
            end if;

            when s2 => data_out <= "0010";
            if(up_down='1') then
                next_state <= s3;
            elsif(up_down='0') then 
                next_state <= s1;
            end if;

            when s3 => data_out <= "0011";
            if(up_down='1') then
                next_state <= s4;
            elsif(up_down='0') then 
                next_state <= s2;
            end if;

            when s4 => data_out <= "0100";
            if(up_down='1') then
                next_state <= s5;
            elsif(up_down='0') then 
                next_state <= s3;
            end if;

            when s5 => data_out <= "0101";
            if(up_down='1') then
                next_state <= s6;
            elsif(up_down='0') then 
                next_state <= s4;
            end if;

            when s6 => data_out <= "0110";
            if(up_down='1') then
                next_state <= s7;
            elsif(up_down='0') then 
                next_state <= s5;
            end if;

            when s7 => data_out <= "0111";
            if(up_down='1') then
                next_state <= s8;
            elsif(up_down='0') then 
                next_state <= s6;
            end if;

            when s8 => data_out <= "1000";
            if(up_down='1') then
                next_state <= s9;
            elsif(up_down='0') then 
                next_state <= s7;
            end if;

            when s9 => data_out <= "1001";
            if(up_down='1') then
                next_state <= s0;
            elsif(up_down='0') then 
                next_state <= s8;
            end if;
        end case;
    end process kombionacioni_dio;
end behavior;