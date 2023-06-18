library ieee;

use ieee.std_logic_1164.all;

entity DekadniBrojac is
    port(
        RST, CLK, nacin : in std_logic;
        izlaz : out std_logic_vector(3 downto 0)
    );
end DekadniBrojac;

architecture DekadniBrojac_beh of DekadniBrojac is
type stanje is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
signal pr_stanje, slj_stanje : stanje := S1;

begin
    -- sekvencijalni dio
    process(CLK,RST)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                if (nacin = '1') then
                    -- brojanje unaprijed
                    pr_stanje <= S0;
                else
                    -- brojanje unazad
                    pr_stanje <= S9;
                end if;
            else
                pr_stanje <= slj_stanje;
            end if;
        end if;
    end process;
    
    -- kombinacioni dio
    process(pr_stanje)
    begin
        case pr_stanje is
        when S0 =>
            if (nacin = '1') then
                slj_stanje <= S1;
            else
                slj_stanje <= S9;
            end if;
            izlaz <= "0000";
        when S1 =>
            if (nacin = '1') then
                slj_stanje <= S2;
            else
                slj_stanje <= S0;
            end if;
            izlaz <= "0001";
        when S2 =>
            if (nacin = '1') then
                slj_stanje <= S3;
            else
                slj_stanje <= S1;
            end if;
            izlaz <= "0010";
        when S3 =>
            if (nacin = '1') then
                slj_stanje <= S4;
            else
                slj_stanje <= S2;
            end if;
            izlaz <= "0011";
        when S4 =>
            if (nacin = '1') then
                slj_stanje <= S5;
            else
                slj_stanje <= S3;
            end if;
            izlaz <= "0100";
        when S5 =>
            if (nacin = '1') then
                slj_stanje <= S6;
            else
                slj_stanje <= S4;
            end if;
            izlaz <= "0101";
        when S6 =>
            if (nacin = '1') then
                slj_stanje <= S7;
            else
                slj_stanje <= S5;
            end if;
            izlaz <= "0110";
        when S7 =>
            if (nacin = '1') then
                slj_stanje <= S8;
            else
                slj_stanje <= S6;
            end if;
            izlaz <= "0111";
        when S8 =>
            if (nacin = '1') then
                slj_stanje <= S9;
            else
                slj_stanje <= S7;
            end if;
            izlaz <= "1000";
        when S9 =>
            if (nacin = '1') then
                slj_stanje <= S0;
            else
                slj_stanje <= S8;
            end if;
            izlaz <= "1001";
        end case;
    end process;
end DekadniBrojac_beh;