LIBRARY ieee;  
 USE ieee.std_logic_1164.ALL; 
 USE ieee.numeric_std.ALL;

entity UPDOWN_COUNTER is
    Port ( 
        clk: in std_logic; -- clock input
        reset: in std_logic; -- reset input 
        up_down: in std_logic; -- up or down
        counter: out std_logic_vector(3 downto 0) -- output 4-bit counter
    );
end UPDOWN_COUNTER;

architecture Behavioral of UPDOWN_COUNTER is
    signal counter_updown: std_logic_vector(3 downto 0) := "0000"; 
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                counter_updown <= "0000"; 
            elsif(up_down = '1') then
                if(counter_updown > "0000") then
                    counter_updown <= std_logic_vector(unsigned(counter_updown) - x"1"); 
                end if;
            else 
                if(counter_updown < "1001") then
                    counter_updown <= std_logic_vector(unsigned(counter_updown) + x"1"); 
                end if;
            end if;
        end if;
    end process;
    counter <= counter_updown;
end Behavioral;

