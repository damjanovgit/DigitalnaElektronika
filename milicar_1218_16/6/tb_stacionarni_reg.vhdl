library IEEE;
use IEEE.std_logic_1164.all;

entity tb_stacionarni_reg is
end tb_stacionarni_reg;

architecture tb of tb_stacionarni_reg is
  component stacionarni_reg is
    port (
      clk, clr, ld: in std_logic;
      data_in: in std_logic_vector(9 downto 0);
      data_out: out std_logic_vector(9 downto 0)
    );
  end component;
  
  signal clk_in, clr_in, ld_in: std_logic;
  signal dat_in, dat_out: std_logic_vector(9 downto 0);

begin
  DUT: stacionarni_reg port map(clk_in, clr_in, ld_in, dat_in, dat_out);
  
  process
  begin
    dat_in <= "0000000000";
    clk_in <= '0';
    clr_in <= '1';
    ld_in <= '0';
    wait for 1 ns;

    clr_in <= '0';
    clk_in <= '1';
    wait for 100 ps;
    ld_in <= '1';
    wait for 900 ps;

    dat_in <= "0000000001";
    clk_in <= '0';
    wait for 100 ps;
    ld_in <= '0';
    wait for 100 ps;
    ld_in <= '1';
    wait for 800 ps;

    dat_in <= "0000000100";
    clk_in <= '1';
    wait for 100 ps;
    ld_in <= '0';
    wait for 100 ps;
    ld_in <= '1';
    wait for 800 ps;

    dat_in <= "0010010010";
    clk_in <= '0';
    wait for 100 ps;
    ld_in <= '0';
    wait for 100 ps;
    ld_in <= '1';
    wait for 800 ps;

    dat_in <= "0101001010";
    clk_in <= '1';
    wait for 100 ps;
    ld_in <= '0';
    wait for 100 ps;
    ld_in <= '1';
    wait for 800 ps;

    clr_in <= '1';
    dat_in <= "1010101001";
    ld_in <= '0';
    clk_in <= '0';

    wait;
  end process;
end tb;
