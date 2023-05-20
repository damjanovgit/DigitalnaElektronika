library ieee;
use ieee.std_logic_1164.all;

entity JKFF_TB is
end JKFF_TB;

architecture JKFF_TB_beh of JKFF_TB is

component JKFF is
port(
    J, K, CLK : in std_logic;
    Q, NOTQ : out std_logic
);
end component;

signal J_in : std_logic := '0';
signal K_in : std_logic := '0';
signal CLK_in : std_logic := '0';
signal Q_out : std_logic := '0';
signal NOTQ_out : std_logic;

begin

    DUT: JKFF port map (
        J => J_in,
        K => K_in,
        CLK => CLK_in,
        Q => Q_out,
        NOTQ => NOTQ_out
    );

    process begin
        J_in <= '0';
        K_in <= '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed J=0, K=0, CLK=0" severity error;

        J_in <= '0';
        K_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed J=0, K=0, CLK=1" severity error;

        J_in <= '0';
        K_in <= '1';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed J=0, K=1, CLK=1" severity error;

        J_in <= '0';
        K_in <= '1';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed J=0, K=1, CLK=0" severity error;

        J_in <= '1';
        K_in <= '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed J=1, K=0, CLK=0" severity error;

        J_in <= '1';
        K_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '1') report "Failed J=1, K=0, CLK=1" severity error;

        J_in <= '1';
        K_in <= '1';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '1') report "Failed J=1, K=1, CLK=0" severity error;

        J_in <= '1';
        K_in <= '1';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed J=1, K=1, CLK=1" severity error;

        
        --Clear inputs
        J_in <= '0';
        K_in <= '0';
        CLK_in <= '0';

        assert false report "Test done." severity note;
        wait;
    end process;

end JKFF_TB_beh;
