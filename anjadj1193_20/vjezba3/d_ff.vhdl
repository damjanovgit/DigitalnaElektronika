library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
port( d, clk : in std_logic;
      q, qnot : out std_logic
);
end d_ff;

architecture beh_d_ff of d_ff is
    signal qm, temp : std_logic :='0';
    begin

        process(clk,d)
        begin
                if (clk = '1') then qm <= d ; temp <= temp;
                elsif(clk = '0') then qm <= qm;   temp <= qm;
                end if;
        end process;

        q <= temp;
        qnot <= not(temp);

end beh_d_ff;