library ieee;
use ieee.std_logic_1164.all;

entity tb_dekadni_brojac is
end tb_dekadni_brojac;

architecture beh_tb_dekadni_brojac of tb_dekadni_brojac is
    component dekadni_brojac is
    port(   clk, clr, cls, gd : in std_logic;
            data_out : out std_logic_vector(3 downto 0)
    ); end component;

    signal clk, clr, cls, gd : std_logic := '0';
    signal data_out : std_logic_vector(3 downto 0) := "0000";
begin
    hac : dekadni_brojac port map(
        clk => clk,
        clr => clr,
        cls => cls,
        gd => gd,
        data_out => data_out
    );

    process
    begin

        -- brojanje unapred 
        clk <= '1'; clr <= '1'; wait for 5 ns;
        assert(data_out = "0000") report "E0" severity error;
        clk <= '0'; clr <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0001") report "E1" severity error;
        clk <= '0'; wait for 5 ns;
        
        clk <= '1'; wait for 5 ns;
        assert(data_out = "0010") report "E2" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0011") report "E3" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0100") report "E4" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0101") report "E5" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0110") report "E6" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0111") report "E7" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "1000") report "E8" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "1001") report "E9" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0000") report "E10" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0001") report "E11" severity error;
        clk <= '0'; wait for 5 ns;

        -- brojanje unazad
        clk <= '1'; cls <= '1'; gd <= '1'; wait for 5 ns;
        assert(data_out = "1001") report "E9" severity error;
        clk <= '0'; cls <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "1000") report "E8" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0111") report "E7" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0110") report "E6" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0101") report "E5" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0100") report "E4" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0011") report "E3" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0010") report "E2" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0001") report "E1" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "0000") report "E0" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "1001") report "E9" severity error;
        clk <= '0'; wait for 5 ns;

        clk <= '1'; wait for 5 ns;
        assert(data_out = "1000") report "E8" severity error;
        clk <= '0'; wait for 5 ns;

        assert false report "Test DONE!" severity error;
        wait;
    end process;
end beh_tb_dekadni_brojac;