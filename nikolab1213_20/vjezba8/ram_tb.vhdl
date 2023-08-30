library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_testbench is
end ram_testbench;

architecture ram_tb of ram_testbench is
    component ram is
        port(
            clk, we, oe : in std_logic;
            data_in : in std_logic_vector(7 downto 0);
            address : in std_logic_vector(6 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    signal clk1, we1, oe1 : std_logic;
    signal data_in1 : std_logic_vector(7 downto 0);
    signal address1 : std_logic_vector(6 downto 0);
    signal data_out1 :  std_logic_vector(7 downto 0);

begin
    DUT: ram port map(
        clk => clk1,
        we => we1,
        oe => oe1,
        data_in => data_in1,
        address => address1,
        data_out => data_out1
    );

    process begin

        clk1 <= '0';
        we1 <= '1';
        wait for 1 ns;
        for i in 0 to 127 loop
            address1 <= std_logic_vector(to_unsigned(i, address1'length));
            data_in1 <= std_logic_vector(to_unsigned(i, data_in1'length));
            clk1 <= '1';
            wait for 1 ns;
            clk1 <= '0';
            wait for 1 ns;
        end loop;
        we1 <= '0';
        oe1 <= '1';
        for i in 0 to 127 loop
            address1 <= std_logic_vector(to_unsigned(i, address1'length));
            clk1 <= '1';
            wait for 1 ns;
            assert(i = to_integer(unsigned(data_out1))) report "Greska - i = " & integer'image(i) severity error;
            clk1 <= '0';
            wait for 1 ns;
        end loop;
        assert false report "Test finished" severity note;
        wait;

end process;
end ram_tb;

