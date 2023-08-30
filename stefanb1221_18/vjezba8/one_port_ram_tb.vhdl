library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_port_ram_tb is
end one_port_ram_tb;

architecture behavior of one_port_ram_tb is
    signal clk_tb      : std_logic := '0';
    signal data_in_tb  : std_logic_vector(7 downto 0) := (others => '0');
    signal write_en_tb : std_logic := '0';
    signal address_tb  : std_logic_vector(6 downto 0) := (others => '0');
    signal data_out_tb : std_logic_vector(7 downto 0);

    component one_port_ram
        port ( 
            clk     : in std_logic;
            data_in : in std_logic_vector(7 downto 0);
            write_en: in std_logic;
            address : in std_logic_vector(6 downto 0);
            data_out: out std_logic_vector(7 downto 0));
    end component;

begin
    DUT: one_port_ram port map (clk => clk_tb,
                              data_in => data_in_tb,
                              write_en => write_en_tb,
                              address => address_tb,
                              data_out => data_out_tb);

    clk_process : process
    begin
        while now < 1000 ns loop
            clk_tb <= not clk_tb;
            wait for 10 ns;
        end loop;
        wait;
    end process;

    test_process : process
    begin
        wait for 20 ns;
        data_in_tb <= "10101010"; 
        write_en_tb <= '1';
        address_tb <= "0000001";
        wait for 10 ns;
        write_en_tb <= '0';
        wait for 10 ns;
        address_tb <= "0000001";
        wait for 10 ns;
        assert data_out_tb = data_in_tb
            report "Podaci ne odgovaraju upisanim podacima" severity error;
        wait;
    end process;
end behavior;
