library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is
port(k,j,clk : in std_logic;
     q,qnot : out std_logic
);
end jk_ff;

architecture beh_jk_ff of jk_ff is
    signal qm, qmnot, temp, tempnot : std_logic := '0';
    begin
        process(clk,j,k)
        begin
            if (clk = '1') then
                if (j = '1' and k = '0') then qm <= '1'; qmnot <= '0';
                elsif(j = '0' and k = '1') then qm <= '0'; qmnot <= '1';
                elsif(j = '0' and k = '0') then qm <= qm; qmnot <= qmnot;
                else qm <= '1'; qmnot <= '1';
                end if;
            elsif(clk'event and clk = '0') then
                if (qm = '1' and qmnot = '0') then temp <= '1'; 
                elsif (qm = '0' and qmnot = '1') then temp <= '0';
                elsif (qm = '1' and qmnot = '1') then temp <= not(temp); tempnot <= not(tempnot);
                end if;
            end if;
        end process;

    q <= temp;
    qnot <= tempnot;

end beh_jk_ff;