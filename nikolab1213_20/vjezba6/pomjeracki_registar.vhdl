library ieee;
use ieee.std_logic_1164.all;

entity pomjeracki_registar is 
port(
    data_in : in std_logic_vector(5 downto 0);
    data_out : out std_logic_vector(5 downto 0);
    mode : in std_logic_vector(1 downto 0);
    clk, clr, rin, lin : in std_logic
);
end pomjeracki_registar;

architecture pomjeracki_registar_beh of pomjeracki_registar is
    signal stanje : std_logic_vector(5 downto 0) := "000000";
    signal staro_stanje : std_logic_vector(5 downto 0) := "000000";
begin
    process(clk, clr)
    variable i : integer;
    begin 
        staro_stanje <= stanje;
        if (clr = '0') then
            stanje <= "000000";
        else
            if (rising_edge(clk)) then
                case mode is
                    when "00" =>
                        stanje <= staro_stanje;
                    when "01" =>
                        stanje(5) <= rin;
                        for i in 0 to 4 loop
                            stanje(i) <= staro_stanje(i + 1);
                        end loop;
                    when "10" =>
                        stanje(0) <= lin;
                        for i in 1 to 5 loop
                            stanje(i) <= staro_stanje(i - 1);
                        end loop;
                    when "11" => 
                        stanje <= data_in;
                    when others =>
                        stanje <= staro_stanje;
                end case;
            end if;
        end if;
    end process;
    data_out <= stanje;
end pomjeracki_registar_beh;
