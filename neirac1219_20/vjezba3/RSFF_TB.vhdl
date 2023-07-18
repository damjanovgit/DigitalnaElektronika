library ieee;
use ieee.std_logic_1164.all;

entity RSFF_TB is
end RSFF_TB;

architecture RSFF_TB_beh of RSFF_TB is

component RSFF is
port(
    R, S, CLK : in std_logic;
    Q: out std_logic
);
end component;

signal R_in : std_logic := '0';
signal S_in : std_logic := '0';
signal CLK_in : std_logic := '0';
signal Q_out : std_logic := '0';

begin

    DUT: RSFF port map (
        R => R_in,
        S => S_in,
        CLK => CLK_in,
        Q => Q_out
    );

    process begin
        R_in <= '0';
        S_in <= '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed R=0, S=0, CLK=0" severity error;

        R_in <= '0';
        S_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed R=0, S=0, CLK=1" severity error;

        R_in <= '0';
        S_in <= '1';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed R=0, S=1, CLK=0" severity error;

        R_in <= '0';
        S_in <= '1';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '1') report "Failed R=0, S=1, CLK=1" severity error;

        R_in <= '1';
        S_in <= '0';
        CLK_in <= '0';
        wait for 1 ns;
        assert (Q_out = '1') report "Failed R=1, S=0, CLK=0" severity error;

        R_in <= '1';
        S_in <= '0';
        CLK_in <= '1';
        wait for 1 ns;
        assert (Q_out = '0') report "Failed R=1, S=0, CLK=1" severity error;

       

     

        
        --Clear inputs
        R_in <= '0';
        S_in <= '0';
        CLK_in <= '0';

        assert false report "Test done." severity note;
        wait;
    end process;

end RSFF_TB_beh;