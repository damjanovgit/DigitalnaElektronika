library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram_tb is 
end ram_tb;

architecture ram_tb_beh of ram_tb is

    component ram is 
    generic
    (
        memory_size : integer := 128;
        word_size : integer :=8;
        address_size : integer := 7
    );
    port
    (
        CLK, read_write : in std_logic;  
        address : in std_logic_vector(address_size-1 downto 0);
        data_in : in std_logic_vector(word_size-1 downto 0);
        data_out : out std_logic_vector(word_size-1 downto 0)
    );
    end component;

    constant m_size : integer := 128;
    constant w_size : integer := 8;
    constant a_size : integer := 7;

    signal clock, r_w : std_logic; 
    signal addr : std_logic_vector(a_size-1 downto 0) := "0000000";
    signal input_data, output_data : std_logic_vector(w_size-1 downto 0);

begin

    hac: ram generic map
        (
            memory_size => m_size,
            word_size => w_size,
            address_size => a_size
        )
        port map
        (
            CLK => clock,
            read_write => r_w,
            address => addr,
            data_in => input_data,
            data_out => output_data
        );

        process
        begin

            r_w <= '1';
            clock <= '0';
            wait for 10 ns;
            for i in 0 to m_size-1 loop
                addr <= std_logic_vector(to_unsigned(i, addr'length));
                input_data <= std_logic_vector(to_unsigned(i, input_data'length));
                clock <= '1';
                wait for 10 ns;
                clock <= '0';
                wait for 10 ns;
            end loop;

            r_w <= '0';
    
            for k in 0 to m_size-1 loop  
                addr <= std_logic_vector(to_unsigned(k, addr'length));
                clock <= '1';
                wait for 10 ns;
                assert( k = to_integer(unsigned(output_data))) report "Neispravan izlaz, adraesa: k = " & integer'image(k) severity error;
                clock <= '0';
                wait for 10 ns;
            end loop;

            assert false report "Test je zavrsen." severity note;
            wait;

        end process;
end ram_tb_beh;   