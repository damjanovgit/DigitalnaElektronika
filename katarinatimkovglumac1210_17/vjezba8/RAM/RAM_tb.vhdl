library ieee;
use ieee.std_logic_1164.all;

entity RAM128x8_tb is
end entity RAM128x8_tb;

architecture Behavioral of RAM128x8_tb is
    constant ADDR_WIDTH : integer := 7;
    constant DATA_WIDTH : integer := 8;

    signal clk   : std_logic := '0';
    signal addr  : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
    signal din   : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal wr_en : std_logic := '0';
    signal rd_en : std_logic := '0';
    signal dout  : std_logic_vector(DATA_WIDTH-1 downto 0);

    component RAM128x8
        generic (
            ADDR_WIDTH : integer := 7;
            DATA_WIDTH : integer := 8
        );
        port (
            clk   : in std_logic;
            addr  : in std_logic_vector(ADDR_WIDTH-1 downto 0);
            din   : in std_logic_vector(DATA_WIDTH-1 downto 0);
            wr_en : in std_logic;
            rd_en : in std_logic;
            dout  : out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
    end component;

begin
    uut : RAM128x8
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            clk   => clk,
            addr  => addr,
            din   => din,
            wr_en => wr_en,
            rd_en => rd_en,
            dout  => dout
        );

    process
    begin
        -- Initialize clock
        wait for 5 ns;
        
        -- Write enable test
        wr_en <= '1';
        din <= "10101010"; -- Example data
        addr <= "0110110"; -- Example address
        wait for 10 ns;
        wr_en <= '0';
        wait for 10 ns;

        -- Write enable test
        wr_en <= '1';
        din <= "00101010"; -- Example data
        addr <= "0100110"; -- Example address
        wait for 10 ns;
        wr_en <= '0';
        wait for 10 ns;

        -- Read enable test
        rd_en <= '1';
        addr <= "0110110"; -- Same address as before
        wait for 10 ns;
        rd_en <= '0';
        wait for 10 ns;

        -- Read enable test
        rd_en <= '1';
        addr <= "0100110"; -- Same address as before
        wait for 10 ns;
        rd_en <= '0';
        wait for 10 ns;

        -- Read enable test
        rd_en <= '1';
        addr <= "0100110"; -- Same address as before
        wait for 10 ns;
        rd_en <= '0';
        wait for 10 ns;

        -- Write enable test
        wr_en <= '1';
        din <= "10001010"; -- Example data
        addr <= "0000110"; -- Example address
        wait for 10 ns;
        wr_en <= '0';
        wait for 10 ns;

        -- Read enable test
        rd_en <= '1';
        addr <= "0000110"; -- Same address as before
        wait for 10 ns;
        rd_en <= '0';
        wait for 10 ns;

        -- Stop simulation
        wait;
    end process;

    process
    begin
        -- Clock generation
        while now < 1000 ns loop
            clk <= not clk after 5 ns;
            wait for 2.5 ns;
        end loop;
        wait;
    end process;
end architecture Behavioral;
