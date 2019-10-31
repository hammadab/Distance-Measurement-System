library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity VGA is
    Generic (   Horizontal_FrameSize : natural;
                Vertical_FrameSize : natural
             );
    Port (  Clock : in STD_LOGIC;
            X_counter, Y_counter : in STD_LOGIC_VECTOR ( 11 downto 0);
            Video : in STD_LOGIC;
            red, green, blue : in STD_LOGIC_VECTOR ( 3 downto 0);
            VGA_RED, VGA_GREEN, VGA_BLUE : out STD_LOGIC_VECTOR ( 3 downto 0)
          );
end VGA;

architecture Behavioral of VGA is
COMPONENT Pixel_Status is
    Port (  Clock : in STD_LOGIC;
            X, Y : in STD_LOGIC_VECTOR ( 11 downto 0);
            pixel : out STD_LOGIC
          );
END COMPONENT;
    
    SIGNAL X, Y : std_logic_vector ( 11 downto 0);
    SIGNAL Pixel : std_logic := '0';
    
    SIGNAL VGA_red_o : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_green_o : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_blue_o : std_logic_vector ( 3 downto 0);
    -- VGA R, G and B signals to connect output with the design
    SIGNAL VGA_red_comb : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_green_comb : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_blue_comb : std_logic_vector ( 3 downto 0);
    
begin
    PS : Pixel_Status PORT MAP (    Clock,
                                    X_counter,
                                    Y_counter,
                                    pixel
                                );
    
--    process ( X, Y)
--        begin
--            if ( x > (220) and x < (1080-(830)) and ( y > 0 and y < 1080-(830))) then
--                wall_on <= '1';
--            elsif ( x > 300 and x < 302  and  y > 100 and y < 200) then
--                wall_on <= '1';
--            elsif ( x > 300 and x < 310  and  y > 100 and y < 102) then
--                wall_on <= '1';
--            elsif ( x > (220+450) and x < (1080-(830-450)) and  y > 450 and y < (1080-(830-450))) then
--                wall_on <= '1';
--            elsif ( x > (220+600) and x < (1080-(830-600)) and  y > 600 and y < (1080-(830-600))) then
--                wall_on <= '1';
--            elsif ( x > (220+750) and x < (1080-(830-750)) and  y > 750 and y < (1080-(830-300))) then
--                wall_on <= '1';
--            else
--                wall_on <= '0';
--            end if ;
--    end process;
    
    VGA_red_o <= red;--"0100";
    VGA_green_o <= green;--"0110";
    VGA_blue_o <= blue;--"1111";
    X <= X_counter;
    Y <= Y_counter;
--    Pixel <= wall_on;
    VGA_red_comb <= (Pixel & Pixel & Pixel & Pixel) and VGA_red_o;
    VGA_green_comb <= (Pixel & Pixel & Pixel & Pixel) and VGA_green_o;
    VGA_blue_comb <= (Pixel & Pixel & Pixel & Pixel) and VGA_blue_o;

    process ( Clock)
    begin
        if ( rising_edge( Clock) and Video = '1') then
            VGA_RED <= vga_red_comb;
            VGA_GREEN <= vga_green_comb;
            VGA_BLUE <= vga_blue_comb;
        end if;
    end process;
end Behavioral;