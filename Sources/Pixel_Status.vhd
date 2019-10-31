library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Pixel_Status is
    Port (  Clock : in STD_LOGIC;
            X, Y : in STD_LOGIC_VECTOR ( 11 downto 0);
            Mode : in STD_LOGIC_VECTOR ( 1 downto 0);
            Distance : in STD_LOGIC_VECTOR ( 8 downto 0);
            Seconds, Minutes, Hours : in INTEGER;
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
    SIGNAL Numb, First_Digit, Second_Digit, Third_Digit : INTEGER;
    SIGNAL Char_temp : String ( 9 downto 0) := "9876543210";
    
begin
    process ( Clock)
    begin
        X_Box <= to_integer(unsigned( X)) / 8;
        Y_Box <= to_integer(unsigned( Y)) / 16;
    end process;
    
    index <= character'pos( Strings( Y_Box)( 160 - X_Box)) * 16;
    
    FontsROM : FontROM PORT MAP (   Clock,
                                    index,
                                    X,
                                    Y,
                                    pixel
                                  );
    process ( Clock)
    begin
        numb <= to_integer(unsigned( Distance));
        First_Digit <= numb mod 10;
        Second_Digit <= ( numb / 10) mod 10;
        Third_Digit <= numb / 100;
        
        Strings(11) <= "              Distance =                                                                                                                                       ";
        Strings(11)( 159 - 27) <= Char_temp( First_Digit);
        Strings(11)( 159 - 26) <= Char_temp( Second_Digit);
        Strings(11)( 159 - 25) <= Char_temp( Third_Digit);
    end process;
    
    Strings(1) <= "abcdefghiklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789 !'^+%&/()=?_-*#${[]}\,;.:<>                                                                     ";
    Strings(12) <= "                                                                                                                                                               ";
    
    process ( Clock)
    begin
        if ( Mode = "01" ) then
            Strings(13) <= "              Mode = Average                                                                                                                                   ";
        elsif ( Mode = "10" ) then
            Strings(13) <= "              Mode = Peak                                                                                                                                      ";
        else
            Strings(13) <= "              Mode = Direct                                                                                                                                    ";
        end if;
    end process;
    
    process ( Clock)
    begin
        Strings(14) <= "              Hours   :                                                                                                                                        ";
        Strings(14)( 159 - 25) <= Char_temp( Hours mod 10);
        Strings(14)( 159 - 24) <= Char_temp( Hours / 10);
        Strings(15) <= "              Minutes :                                                                                                                                        ";
        Strings(15)( 159 - 25) <= Char_temp( Minutes mod 10);
        Strings(15)( 159 - 24) <= Char_temp( Minutes / 10);
        Strings(16) <= "              Seconds :                                                                                                                                        ";
        Strings(16)( 159 - 25) <= Char_temp( Seconds mod 10);
        Strings(16)( 159 - 24) <= Char_temp( Seconds / 10);
    end process;
    
end Behavioral;