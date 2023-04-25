library ieee;
use ieee.std_logic_1164.all;

entity T_FF_tb is
end T_FF_tb;

architecture behavior of T_FF_tb is
    component T_FF is
        port(
            T, CP : in std_logic;
            Q, Qn : out std_logic
        );
    end component;

    signal T_in, CP_in : std_logic;
    signal Q_out : std_logic :='1';
    signal Qn_out : std_logic :='0';

begin
    DUT : T_FF port map(T_in, CP_in, Q_out, Qn_out);
    process
    begin
        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        assert ( Q_out = Q_out and Qn_out = Qn_out) report "Neispravan izlaz u slucaju CP = 0. Q treba da zadrzi prethodno stanje!" severity error;

        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        CP_in <= '1';
        T_in <= '0';
        wait for 1 ns;
        assert ( Q_out = '0' and Qn_out = '1') report "Neispravan izlaz u slucaju CP = 1, T = 0. Q treba da bude u stanju 0!" severity error;

        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        CP_in <= '1';
        T_in <= '1';
        wait for 1 ns;
        assert ( Q_out = '1' and Qn_out = '0') report "Neispravan izlaz u slucaju CP = 1, T = 1. Q treba da bude u stanju 1!" severity error;

        assert false report "Kraj testa!" severity note;
        wait;
    end process; 
end behavior;