library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is

--COMPONENT Fonts
--  Port (    Char : in CHARACTER;
--            Char_bit_0, Char_bit_1, Char_bit_2, Char_bit_3, Char_bit_4, Char_bit_5, Char_bit_6, Char_bit_7, Char_bit_8, Char_bit_9, 
--            Char_bit_a, Char_bit_b, Char_bit_c, Char_bit_d, Char_bit_e, Char_bit_f : out STD_LOGIC_VECTOR ( 7 downto 0)
--        );
--END COMPONENT;

COMPONENT fontROM is
    Generic (   Address_Width: INTEGER := 11;
                Data_Width: INTEGER := 8
             );
    Port (  --Clock : in STD_LOGIC;
--            writeEnableA: in STD_LOGIC;
----            Address : in STD_LOGIC_VECTOR( Address_Width-1 downto 0);
--            dataInA: in STD_LOGIC_VECTOR( Data_Width-1 downto 0);
----            DataOut: out STD_LOGIC_VECTOR( 7 downto 0)
            Char : in CHARACTER;
            Char_0, Char_1, Char_2, Char_3, Char_4, Char_5, Char_6, Char_7, Char_8, Char_9, 
            Char_a, Char_b, Char_c, Char_d, Char_e, Char_f : out STD_LOGIC_VECTOR ( 7 downto 0)
          );
END COMPONENT;
    
    -- Inputs
--    SIGNAL Clock : STD_LOGIC := '0';
    
--    SIGNAL Char_bit_0, Char_bit_1, Char_bit_2, Char_bit_3, Char_bit_4, Char_bit_5, Char_bit_6, Char_bit_7, Char_bit_8, Char_bit_9, Char_bit_a, Char_bit_b, Char_bit_c, Char_bit_d, Char_bit_e, Char_bit_f : STD_LOGIC_VECTOR ( 7 downto 0);
    
--    SIGNAL Address : STD_LOGIC_VECTOR( 10 downto 0);
--    SIGNAL data : STD_LOGIC_VECTOR( 7 downto 0);
    SIGNAL char : character;
    SIGNAL Char_0, Char_1, Char_2, Char_3, Char_4, Char_5, Char_6, Char_7 : STD_LOGIC_VECTOR ( 7 downto 0);
    SIGNAL Char_8, Char_9, Char_a, Char_b, Char_c, Char_d, Char_e, Char_f : STD_LOGIC_VECTOR ( 7 downto 0);
    
begin
    
--    UUT : Fonts PORT MAP ('G', Char_bit_0, Char_bit_1, Char_bit_2, Char_bit_3, Char_bit_4, Char_bit_5, Char_bit_6, Char_bit_7, Char_bit_8, Char_bit_9, Char_bit_a, Char_bit_b, Char_bit_c, Char_bit_d, Char_bit_e, Char_bit_f);
    
    UUT : fontROM GENERIC MAP ( 11, 8)
                  PORT MAP ( --Clock,
--                             "00000010010",
--                             data
                             char,
                             Char_0, Char_1, Char_2, Char_3, Char_4, Char_5, Char_6, Char_7, Char_8, Char_9, 
                             Char_a, Char_b, Char_c, Char_d, Char_e, Char_f
                            );
    
--    uut1 : process
--    begin
--        Clock <= '1';
--        wait for 5 ns;
--        Clock <= '0';
--		wait for 5 ns;
--    end process;
    
    process
    begin
        char <= '0';
        wait for 100 ns;
        char <= '1';
        wait for 100 ns;
        char <= '2';
        wait for 100 ns;
        char <= '3';
        wait for 100 ns;
        char <= '4';
        wait for 100 ns;
        char <= '5';
        wait for 100 ns;
        char <= '6';
        wait for 100 ns;
        char <= '7';
        wait for 100 ns;
        char <= '8';
        wait for 100 ns;
        char <= '9';
        wait for 100 ns;
        char <= '=';
        wait for 100 ns;
        char <= 'A';
        wait for 100 ns;
        char <= 'B';
        wait for 100 ns;
        char <= 'C';
        wait for 100 ns;
        char <= 'D';
        wait for 100 ns;
        char <= 'E';
        wait for 100 ns;
        char <= 'F';
        wait for 100 ns;
        char <= 'G';
        wait for 100 ns;
        char <= 'H';
        wait for 100 ns;
        char <= 'I';
        wait for 100 ns;
        char <= 'J';
        wait for 100 ns;
        char <= 'K';
        wait for 100 ns;
        char <= 'L';
        wait for 100 ns;
        char <= 'M';
        wait for 100 ns;
        char <= 'N';
        wait for 100 ns;
        char <= 'O';
        wait for 100 ns;
        char <= 'P';
        wait for 100 ns;
        char <= 'Q';
        wait for 100 ns;
        char <= 'R';
        wait for 100 ns;
        char <= 'S';
        wait for 100 ns;
        char <= 'T';
        wait for 100 ns;
        char <= 'U';
        wait for 100 ns;
        char <= 'V';
        wait for 100 ns;
        char <= 'W';
        wait for 100 ns;
        char <= 'X';
        wait for 100 ns;
        char <= 'Y';
        wait for 100 ns;
        char <= 'Z';
        wait for 100 ns;
    end process;
    
end Behavioral;