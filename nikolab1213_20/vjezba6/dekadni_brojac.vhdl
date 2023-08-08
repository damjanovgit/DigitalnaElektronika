library ieee;
use ieee.std_logic_1164.all;

entity dekadni_brojac is 
port(
    data_out : out std_logic_vector(3 downto 0);
    clk, rst, mode : in std_logic
);
end dekadni_brojac;

architecture dekadni_brojac_beh of dekadni_brojac is
    type dekadno_stanje is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    signal proslo_stanje : dekadno_stanje := s0;
    signal sljedece_stanje : dekadno_stanje;
begin
    process(clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                proslo_stanje <= S0;
            else
                proslo_stanje <= sljedece_stanje;
            end if;
        end if;
    end process;
    process(proslo_stanje, mode)
    begin
        case proslo_stanje is
            when s0 =>
                if (mode = '0') then
                    sljedece_stanje <= s1;
                elsif (mode = '1') then
                    sljedece_stanje <= s9;
                end if;
                data_out <= "0000";
            when s1 =>
                if (mode = '0') then
                    sljedece_stanje <= s2;
                elsif (mode = '1') then
                    sljedece_stanje <= s0;
                end if;
                data_out <= "0001";
            when s2 =>
                if (mode = '0') then
                    sljedece_stanje <= s3;
                elsif (mode = '1') then
                    sljedece_stanje <= s1;
                end if;
                data_out <= "0010";
            when s3 =>
                if (mode = '0') then
                    sljedece_stanje <= s4;
                elsif (mode = '1') then
                    sljedece_stanje <= s2;
                end if;
                data_out <= "0011";
            when s4 =>
                if (mode = '0') then
                    sljedece_stanje <= s5;
                elsif (mode = '1') then
                    sljedece_stanje <= s3;
                end if;
                data_out <= "0100";
            when s5 =>
                if (mode = '0') then
                    sljedece_stanje <= s6;
                elsif (mode = '1') then
                    sljedece_stanje <= s4;
                end if;
                data_out <= "0101";
            when s6 =>
                if (mode = '0') then
                    sljedece_stanje <= s7;
                elsif (mode = '1') then
                    sljedece_stanje <= s5;
                end if;
                data_out <= "0110";
            when s7 =>
                if (mode = '0') then
                    sljedece_stanje <= s8;
                elsif (mode = '1') then
                    sljedece_stanje <= s6;
                end if;
                data_out <= "0111";
            when s8 =>
                if (mode = '0') then
                    sljedece_stanje <= s9;
                elsif (mode = '1') then
                    sljedece_stanje <= s7;
                end if;
                data_out <= "1000";
            when s9 =>
                if (mode = '0') then
                    sljedece_stanje <= s0;
                elsif (mode = '1') then
                    sljedece_stanje <= s8;
                end if;
                data_out <= "1001";
        end case;
end process;
end dekadni_brojac_beh;