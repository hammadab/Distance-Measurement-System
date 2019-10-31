---- Block dimension = 8 x 16

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.numeric_std.all;

--entity Lines is
--    Generic ( Horizontal_FrameSize : natural
--             );
--    Port ( X : in STD_LOGIC_VECTOR ( 11 downto 0);
--           Y_Location : in INTEGER;
--           Y : in STD_LOGIC_VECTOR ( 11 downto 0);
--           Chars : in STRING ( 160 downto 1); -- (Horizontal_FrameSize / 8)
--           Go : out STD_LOGIC
--          );
--end Lines;

--architecture Behavioral of Lines is
--COMPONENT FontROM
--  Port (    Char : in CHARACTER;
--            Char_0, Char_1, Char_2, Char_3, Char_4, Char_5, Char_6, Char_7, Char_8, Char_9, 
--            Char_a, Char_b, Char_c, Char_d, Char_e, Char_f : out STD_LOGIC_VECTOR ( 7 downto 0)
--        );
--END COMPONENT;
    
----    TYPE Char_Code is array ( 0 to 15) of STD_LOGIC_VECTOR ( 7 downto 0);
--    TYPE Char_Code is array ( 1 to 16) of STD_LOGIC_VECTOR ( 8 downto 1);
----    TYPE Characters is array ( 0 to ((Horizontal_FrameSize / 8) - 1)) of Char_Code;
--    TYPE Characters is array ( 1 to 1280) of Char_Code;
--    SIGNAL Codes : Characters;
--    SHARED VARIABLE X_int, Y_int : INTEGER := 0;
    
--begin
--    process ( X, Y)
--    begin
--        X_int := to_integer(unsigned( X));
--        Y_int := to_integer(unsigned( Y));
--    end process;
    
----    Font_Maps : for i in 0 to ((Horizontal_FrameSize / 8) - 1) generate
--    Font_Maps : for i in 1 to 160 generate -- (Horizontal_FrameSize / 8)
--        FontX : FontROM PORT MAP ( Chars(i), Codes(i)(1), Codes(i)(2), Codes(i)(3), Codes(i)(4), Codes(i)(5), Codes(i)(6), 
--                                 Codes(i)(7), Codes(i)(8), Codes(i)(9), Codes(i)(10), Codes(i)(11), Codes(i)(12), Codes(i)(13), Codes(i)(14), Codes(i)(15), Codes(i)(16));
--    end generate Font_Maps;
    
--    process ( Y_Location, Codes, X, Y)
--    begin
--        if ( Y_int >= Y_Location and Y_int <= (Y_Location + 16)) then
--            Go <= Codes(X_int / 8)(Y_int)(X_int);
--        else
--            Go <= '0';
--        end if;
--    end process;
--end Behavioral;