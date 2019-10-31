library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Pixel_Status is
    Port (  Clock : in STD_LOGIC;
            X, Y : in STD_LOGIC_VECTOR ( 11 downto 0);
            pixel : out STD_LOGIC
          );
end Pixel_Status;

architecture Behavioral of Pixel_Status is
COMPONENT FontROM
    Port (  Clock : in STD_LOGIC;
            index : in INTEGER range 0 to 2047;
            X,Y : in STD_LOGIC_VECTOR ( 11 downto 0);
            pixel : out STD_LOGIC
          );
END COMPONENT;
    SIGNAL X_Box, Y_Box, index : INTEGER; -- X_int, Y_int, 
    TYPE String_Array is array ( 1 to 63) of STRING ( 159 downto 1); -- (Vertical_FrameSize / 16)      (Horizontal_FrameSize / 8)
    SIGNAL Strings : String_Array;
    TYPE Char_Code_Array is array ( 1 to 16) of STD_LOGIC_VECTOR ( 8 downto 1);
    SIGNAL Char_Code : Char_Code_Array;
    
begin
    process ( Clock)
    begin
--        X_int <= to_integer(unsigned( X));
--        Y_int <= to_integer(unsigned( Y));
        X_Box <= to_integer(unsigned( X)) / 8;
        Y_Box <= to_integer(unsigned( Y)) / 16;
    end process;
    
--    Pixel <= Char_Code( Y_int - (Y_Box * 16) + 1)( X_int - (X_Box * 8) + 1);
    index <= character'pos( Strings( Y_Box)( 160 - X_Box)) * 16;
    
    FontsROM : FontROM PORT MAP (   Clock,
                                    index,
                                    X,
                                    Y,
                                    pixel
                                  );
    
    Strings(11) <= "LINE = 11                                                                                                                                                      ";
    Strings(12) <= "LINE = 12                                                                                                                                                      ";
    Strings(13) <= "LINE = 13                                                                                                                                                      ";
    Strings(14) <= "LINE = 14                                                                                                                                                      ";
    Strings(15) <= "LINE = 15                                                                                                                                                      ";
    Strings(30) <= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890*-!'^+%&/()=?_.:,;<>#${[]}\                                                                     ";
    
end Behavioral;