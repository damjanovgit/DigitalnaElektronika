library ieee;
use ieee.std_logic_1164.all;

entity TFF_TB is
end TFF_TB;

architecture TFF_TB_beh of TFF_TB is

component TFF is
port(
    T, CLK : in std_logic;
    Q, NOTQ : out std_logic
);
end component;

signal T_in : std_logic := '0';
signal CLK_in : std_logic := '0';
signal Q_out : std_logic := '0';
signal NOTQ_out : std_logic;

begin

    DUT: TFF port map (
        T => T_in,
        CLK => CLK_in,
        Q => Q_out,
        NOTQ => NOTQ_out
    );

    process begin
        T_in <= '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed T=0, CLK=0" severity error;

        T_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed T=0, CLK=1" severity error;

        T_in <= '1';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed T=1, CLK=0" severity error;
        
        T_in <= '1';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '1') report "Failed T=1, CLK=1" severity error;

        T_in <=  '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert(q_out = '1') report "Failed T=0, CLK=0 " severity error;
        
        --Clear inputs
        T_in <= '0';
        CLK_in <= '0';

        assert false report "Test done." severity note;
        wait;
    end process;

end TFF_TB_beh;
