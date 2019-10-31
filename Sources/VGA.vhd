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
--            red, green, blue : in STD_LOGIC_VECTOR ( 3 downto 0);
            Mode : in STD_LOGIC_VECTOR ( 1 downto 0);
            Distance : in STD_LOGIC_VECTOR ( 8 downto 0);
            Seconds, Minutes, Hours : in INTEGER;
            VGA_RED, VGA_GREEN, VGA_BLUE : out STD_LOGIC_VECTOR ( 3 downto 0)
          );
end VGA;

architecture Behavioral of VGA is
COMPONENT Pixel_Status is
    Port (  Clock : in STD_LOGIC;
            X, Y : in STD_LOGIC_VECTOR ( 11 downto 0);
            Mode : in STD_LOGIC_VECTOR ( 1 downto 0);
            Distance : in STD_LOGIC_VECTOR ( 8 downto 0);
            Seconds, Minutes, Hours : in INTEGER;
            pixel : out STD_LOGIC
          );
END COMPONENT;
    
    SIGNAL X, Y : std_logic_vector ( 11 downto 0);
    SIGNAL Pixel, Box, Go : std_logic := '0';
    
    SIGNAL VGA_red_o : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_green_o : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_blue_o : std_logic_vector ( 3 downto 0);
    -- VGA R, G and B signals to connect output with the design
    SIGNAL VGA_red_comb : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_green_comb : std_logic_vector ( 3 downto 0);
    SIGNAL VGA_blue_comb : std_logic_vector ( 3 downto 0);
    SIGNAL Dist : INTEGER range 0 to 400;
    
begin
    Dist <= to_integer(unsigned( Distance));
    PS : Pixel_Status PORT MAP (    Clock,
                                    X_counter,
                                    Y_counter,
                                    Mode,
                                    Distance,
                                    Seconds, Minutes, Hours,
                                    pixel
                                );
    
    process ( Clock)
        begin
            if x > (( Dist * 4) - 20) and x < ( ( Dist * 4) + 20) and ( y > 980 and y < 1020) then
                box <= '1';
--            elsif ( x > (220+450) and x < (1080-(830-450)) and  y > 450 and y < (1080-(830-450))) then
--                box <= '1';
--            elsif ( x > (220+600) and x < (1080-(830-600)) and  y > 600 and y < (1080-(830-600))) then
--                box <= '1';
--            elsif ( x > (220+750) and x < (1080-(830-750)) and  y > 750 and y < (1080-(830-300))) then
--                box <= '1';
            else
                box <= '0';
            end if ;
    end process;
    
    Go <= pixel OR box;
    VGA_red_o <= "0100";--red;
    VGA_green_o <= "0110";--green;
    VGA_blue_o <= "1111";--blue;
    X <= X_counter;
    Y <= Y_counter;
    VGA_red_comb <= (Go & Go & Go & Go) and VGA_red_o;
    VGA_green_comb <= (Go & Go & Go & Go) and VGA_green_o;
    VGA_blue_comb <= (Go & Go & Go & Go) and VGA_blue_o;

    process ( Clock)
    begin
        if ( rising_edge( Clock) and Video = '1') then
            VGA_RED <= vga_red_comb;
            VGA_GREEN <= vga_green_comb;
            VGA_BLUE <= vga_blue_comb;
        end if;
    end process;
end Behavioral;