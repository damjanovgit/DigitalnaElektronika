library ieee;
use ieee.std_logic_1164.all;

entity RS_FF_tb is
end RS_FF_tb;

architecture behavior of RS_FF_tb is
    component RS_FF is 
        port(
            S, R, CP: in std_logic;
            Q, Qn : out std_logic
        );
    end component;

    signal S_in, R_in, CP_in, Q_out, Qn_out : std_logic;

    begin 
        DUT : RS_FF port map(S_in, R_in, CP_in, Q_out, Qn_out);
        process
        begin
            wait for 1 ns;
            CP_in <='0';
            wait for 1 ns;
            assert(Q_out = Q_out and Qn_out = Q_out) report "Neispravan izlaz u slucaju CP = 0; Q treba da zadrzi prethodno stanje!" severity error;

            CP_in <= '0';
            wait for 1 ns;
            CP_in <= '1';
            R_in <= '0';
            S_in <= '0';
            wait for 1 ns;
            assert(Q_out = Q_out and Qn_out = Q_out) report "Neispravan izlaz u slucaju CP = 1, R = 0 i S = 0; Q treba da zadrzi prethodno stanje!" severity error;

            CP_in <= '0';
            wait for 1 ns;
            CP_in <= '1';
            R_in <= '0';
            S_in <= '1';
            wait for 1 ns;
            assert(Q_out = '1' and Qn_out = '0') report "Neispravan izlaz u slucaju CP = 1, R = 0 i S = 1; Q treba da bude 1!" severity error;
            
            CP_in <= '0';
            wait for 1 ns;
            CP_in <= '1';
            R_in <= '1';
            S_in <= '0';
            wait for 1 ns;
            assert(Q_out = '0' and Qn_out = '1') report "Neispravan izlaz u slucaju CP = 1, R = 1 i S = 0; Q treba da bude 0!" severity error;

            CP_in <= '0';
            wait for 1 ns;
            CP_in <= '1';
            R_in <= '1';
            S_in <= '1';
            wait for 1 ns;
            assert(Q_out = 'X' and Qn_out = 'X' ) report "Neispravan izlaz u slucaju CP = 1, R = 1 i S = 1; NEDOZVOLJENO stanje!" severity error;

            assert false report "Kraj testa!" severity note;
            wait;
        end process;
end behavior;