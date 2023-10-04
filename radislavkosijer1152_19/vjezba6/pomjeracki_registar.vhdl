library ieee;
use ieee.std_logic_1164.all;

entity pomjeracki_registar is
port(
    CLK, CLR, L_input, R_input: in std_logic;
    mode : in std_logic_vector(1 downto 0);
    parallel_input : in std_logic_vector(5 downto 0);
    parallel_output : out std_logic_vector(5 downto 0)
);
end entity pomjeracki_registar;

architecture pomjeracki_registar_beh of pomjeracki_registar is

    signal tmp_state : std_logic_vector(5 downto 0) := "000000";

begin
    parallel_output <= tmp_state;
    process(CLK, CLR)
    begin
        if (CLR = '0') then
            tmp_state <= "000000";
        elsif (rising_edge(CLK)) then
            case mode is
                when "00" =>
                --zadrzavanje
                    tmp_state <= tmp_state;
                when "01" =>
                --pomjeranje udeno
                    for i in 0 to 4 loop
                        tmp_state(i) <= tmp_state(i+1);
                    end loop;
                    tmp_state(5) <= R_input;
                    
                when "10" =>
                --pomjeranje ulijevo
                    for i in 5 downto 1 loop
                        tmp_state(i) <= tmp_state(i-1);
                    end loop;
                    tmp_state(0)<=L_input;
                when others =>
                    tmp_state <= parallel_input; 
                end case; 
        end if;
    end process;
end architecture pomjeracki_registar_beh; 