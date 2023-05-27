library ieee;
use ieee.std_logic_1164.all;

entity rs_ff is
port(r,s,clk : in std_logic;
     q,qnot : out std_logic
);
end rs_ff;

architecture beh_rs_ff of rs_ff is
    signal qm, qmnot, temp, tempnot : std_logic := '0';
    begin
        process(clk,s,r)
        begin
            if (clk = '1') then
                if (s = '1' and r = '0') then qm <= '1'; qmnot <= '0';
                elsif(s = '0' and r = '1') then qm <= '0'; qmnot <= '1';
                elsif(s = '0' and r = '0') then qm <= qm; qmnot <= qmnot;
                else qm <= '1'; qmnot <= '1';
                end if;
            elsif(clk'event and clk = '0') then
                if (qm = '1' and qmnot = '0') then temp <= '1'; 
                elsif (qm = '0' and qmnot = '1') then temp <= '0';
                elsif (qm = '1' and qmnot = '1') then qm <= '-'; qmnot <= '-'; temp <= '-'; tempnot <= '-';
                end if;
            end if;
        end process;

    q <= temp;
    qnot <= tempnot;

end beh_rs_ff;