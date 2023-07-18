library ieee;
use ieee.std_logic_1164.all;

entity DFF_TB is
end DFF_TB;

architecture DFF_TB_beh of DFF_TB is

component DFF is
port(
    D, CLK : in std_logic;
    Q, NOTQ : out std_logic
);
end component;

signal D_in : std_logic := '0';
signal CLK_in : std_logic := '0';
signal Q_out : std_logic := '0';
signal NOTQ_out : std_logic;

begin

    DUT: DFF port map (
        D => D_in,
        CLK => CLK_in,
        Q => Q_out,
        NOTQ => NOTQ_out
    );

    process begin
        D_in <= '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed D=0, CLK=0" severity error;

        D_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed D=0, CLK=1" severity error;

        D_in <= '1';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed D=1, CLK=0" severity error;
        
        D_in <= '1';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '1') report "Failed D=1, CLK=1" severity error;

        D_in <=  '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert(q_out = '1') report "Failed D=0, CLK=0 " severity error;
        
        --Clear inputs
        D_in <= '0';
        CLK_in <= '0';

        assert false report "Test done." severity note;
        wait;
    end process;

end DFF_TB_beh;
