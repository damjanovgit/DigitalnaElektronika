library ieee;
use ieee.std_logic_1164.all;

entity Decimal_Counter is
port(
      CLK, clear, Up_Down : in std_logic;
      output : out std_logic_vector(3 downto 0)
    );
end entity Decimal_Counter;

architecture Decimal_Counter_beh of Decimal_Counter is

type state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
signal current_state, next_state : state := S1;

begin
 
    Decimal_Counter_first_proc:process(CLK,clear)
    begin
        if(rising_edge(CLK)) then
            if (clear = '1' and Up_Down = '1') then current_state <= S0; -- Counting Up (Starting position)
            
            elsif (clear = '1' and Up_Down = '0') then current_state <= S9; -- Counting Down (Starting position)
                 
            else  current_state <= next_state;  -- Next State(Up or Down)
            end if;
        end if;
    end process Decimal_Counter_first_proc;
	

    
    
    Decimal_Counter_second_proc:process(current_state)
    begin
        case current_state is
        when S0 =>
            if (Up_Down = '1') then
                next_state <= S1;
            else
                next_state <= S9;
            end if;
            output <= "0000";
        when S1 =>
            if (Up_Down = '1') then
                next_state <= S2;
            else
                next_state <= S0;
            end if;
            output <= "0001";
        when S2 =>
            if (Up_Down = '1') then
                next_state <= S3;
            else
                next_state <= S1;
            end if;
            output <= "0010";
        when S3 =>
            if (Up_Down = '1') then
                next_state <= S4;
            else
                next_state <= S2;
            end if;
            output <= "0011";
        when S4 =>
            if (Up_Down = '1') then
                next_state <= S5;
            else
                next_state <= S3;
            end if;
            output <= "0100";
        when S5 =>
            if (Up_Down = '1') then
                next_state <= S6;
            else
                next_state <= S4;
            end if;
            output <= "0101";
        when S6 =>
            if (Up_Down = '1') then
                next_state <= S7;
            else
                next_state <= S5;
            end if;
            output <= "0110";
        when S7 =>
            if (Up_Down = '1') then
                next_state <= S8;
            else
                next_state <= S6;
            end if;
            output <= "0111";
        when S8 =>
            if (Up_Down = '1') then
                next_state <= S9;
            else
                next_state <= S7;
            end if;
            output <= "1000";
        when S9 =>
            if (Up_Down = '1') then
                next_state <= S0;
            else
                next_state <= S8;
            end if;
            output <= "1001";
        end case;
    end process Decimal_Counter_second_proc;
end architecture Decimal_Counter_beh;