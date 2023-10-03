library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM128x8 is
    generic (
        ADDR_WIDTH : integer := 7;  -- Address width for 512 locations
        DATA_WIDTH : integer := 8   -- Data width is 8 bits
    );
    port (
        clk   : in std_logic;
        addr  : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        din   : in std_logic_vector(DATA_WIDTH-1 downto 0);
        wr_en : in std_logic;
        rd_en : in std_logic;
        dout  : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity RAM128x8;

architecture Behavioral of RAM128x8 is
    type ram_type is array(0 to 2**ADDR_WIDTH - 1) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal ram : ram_type := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if wr_en = '1' then
                ram(to_integer(unsigned(addr))) <= din;
            end if;
            if rd_en = '1' then
                dout <= ram(to_integer(unsigned(addr)));
            end if;
        end if;
    end process;
end architecture Behavioral;