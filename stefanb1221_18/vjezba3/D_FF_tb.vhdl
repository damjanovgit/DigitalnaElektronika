library ieee;
use ieee.std_logic_1164.all;

entity D_FF_tb is
end D_FF_tb;

architecture behavior of D_FF_tb is
    component D_FF is
        port(
            D, CP : in std_logic;
            Q, Qn : out std_logic
        );
    end component;

    signal D_in, CP_in, Q_out, Qn_out : std_logic;

begin

    DUT : D_FF port map ( D_in, CP_in, Q_out, Qn_out );
    process
    begin
        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        assert(Q_out = Q_out and Qn_out = Qn_out) report "Neispravan izlaz u slucaju CP = 0. Q treba da zadrzi prethodno stanje!" severity error;

        CP_in <= '0';
        wait for 1 ns;
        CP_in <= '1';
        D_in <= '0';
        wait for 1 ns;
        assert (Q_out = '0' and Qn_out = '1' ) report "Neispravan izlaz u slucaju CP = 1, D = 0. Q treba da bude u stanju 0!" severity error;

        CP_in <= '0';
        wait for 1 ns;
        CP_in <= '1';
        D_in <= '1';
        wait for 1 ns;
        assert (Q_out = '1' and Qn_out = '0' ) report "Neispravan izlaz u slucaju CP = 1, D = 1. Q treba da bude u stanju 1!" severity error;

        assert false report "Kraj testa" severity note;
        wait;
    end process;
end behavior ;