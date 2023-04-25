library ieee;
use ieee.std_logic_1164.all;

entity JK_FF_tb is
end JK_FF_tb;

architecture behavior of JK_FF_tb is
    component JK_FF is
        port(
            J, K, CP : in std_logic;
            Q, Qn : out std_logic
        );
    end component;

    signal J_in, K_in, CP_in: std_logic;
    signal Q_out : std_logic :='1';
    signal Qn_out : std_logic := '0';
begin
    DUT : JK_FF port map(J_in, K_in, CP_in, Q_out, Qn_out);
    process
    begin
        wait for 1 ns;
        CP_in <= '1';
        wait for 1 ns;
        assert (Q_out = Q_out and Qn_out = Qn_out) report "Neispravan izlaz u slucaju CP = 1. Q treba da zadrzi prethodno stanje!" severity error;

        wait for 1 ns;
        CP_in <= '1';
        J_in <= '0';
        K_in <= '1';
        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        assert ( Q_out = '0' and Qn_out = '1' ) report "Neispravan izlaz u slucaju CP = 1, J = 0, K = 1. Q treba da bude 0!" severity error;

        wait for 1 ns;
        CP_in <= '1';
        J_in <= '1';
        K_in <= '0';
        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        assert ( Q_out = '1' and Qn_out = '0' ) report "Neispravan izlaz u slucaju CP = 1, J = 1, K = 0. Q treba da bude 1!" severity error; 
        
        wait for 1 ns;
        CP_in <= '1';
        J_in <= '1';
        K_in <= '1';
        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        assert ( Q_out = '0' and Qn_out = '1' ) report "Neispravan izlaz u slucaju CP = 1, J = 1, K = 1. Q treba da bude Qn!" severity error;

        wait for 1 ns;
        CP_in <= '1';
        J_in <= 'X';
        K_in <= 'X';
        wait for 1 ns;
        CP_in <= '0';
        wait for 1 ns;
        assert ( Q_out = Q_out and Qn_out = Qn_out ) report "Neispravan izlaz u slucaju CP = 1, J = X, K = X. Q treba da zadrzi prethodno stanje!" severity error;

        wait for 1 ns;
        assert false report "Kraj testa!" severity note;
        wait;
    end process;
end behavior;