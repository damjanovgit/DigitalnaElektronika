library ieee;
use ieee.std_logic_1164.all;

entity dekadni_brojac is
port(
    clk, reset, up_down : in std_logic;
    count : out std_logic_vector(3 downto 0)
);
end entity dekadni_brojac;

architecture dekadni_brojac_beh of Dekadni_brojac is
    type stanje is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    signal current_state : stanje := s0;
    signal next_state : stanje := s1;
begin

    --sekvencijalni dio

    process(clk, reset)
    begin
        if (rising_edge(clk)) then
            if (reset = '1' and up_down = '1') then
                current_state <= s0;
            elsif (reset = '1' and up_down = '0') then
                current_state <= s9;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    --kombinacioni dio

    process(current_state)
    begin
        case current_state is
        when s0 =>
        count <= "0000";
            if (up_down = '1') then
                next_state <= s1;
            else
                next_state <= s9;
            end if;
        when s1 =>
        count <= "0001";
            if (up_down = '1') then
                next_state <= s2;
            else
                next_state <= s0;
            end if;
         when s2 =>
         count <= "0010";
            if (up_down = '1') then
                next_state <= s3;
            else
                next_state <= s1;
            end if;
        when s3 =>
        count <= "0011";
            if (up_down = '1') then
                next_state <= s4;
            else
                next_state <= s2;
            end if;
        when s4 =>
        count <= "0100";
            if (up_down = '1') then
                next_state <= s5;
            else
                next_state <= s3;
            end if;
        when s5 =>
        count <= "0101";
            if (up_down = '1') then
                next_state <= s6;
            else
                next_state <= s4;
            end if;
        when s6 =>
        count <= "0110";
            if (up_down = '1') then
                next_state <= s7;
            else
                next_state <= s5;
            end if;
        when s7 =>
        count <= "0111";
            if (up_down = '1') then
                next_state <= s8;
            else
                next_state <= s6;
            end if;
        when s8 =>
        count <= "1000";
            if (up_down = '1') then
                next_state <= s9;
            else
                next_state <= s7;
            end if;
        when s9 =>
        count <= "1001";
            if (up_down = '1') then
                next_state <= s0;
            else
                next_state <= s8;
            end if;
        end case;
    end process;
end architecture dekadni_brojac_beh;
        