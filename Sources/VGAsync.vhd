-- Out sourced

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity VGAsync is
    Generic (   Horizontal_FrameSize : natural;
                Vertical_FrameSize : natural
             );
    Port ( Clock : in STD_LOGIC;
           Y_control : out STD_LOGIC_VECTOR ( 11 downto 0);
           X_control : out STD_LOGIC_VECTOR ( 11 downto 0);
           Video_on : out STD_LOGIC;
           H_sync : out STD_LOGIC;
           V_sync : out STD_LOGIC
          );
end VGAsync;

architecture Behavioral of VGAsync is
--1280x1024@60Hz--
    CONSTANT FRAME_WIDTH : natural := Horizontal_FrameSize;
    CONSTANT FRAME_HEIGHT : natural := Vertical_FrameSize;
    
    CONSTANT H_FP : natural := 48; --H front porch width (pixels)
    CONSTANT H_PW : natural := 112; --H sync pulse width (pixels)
    CONSTANT H_MAX : natural := 1688; --H total period (pixels)
    
    CONSTANT V_FP : natural := 1; --V front porch width (lines)
    CONSTANT V_PW : natural := 3; --V sync pulse width (lines)
    CONSTANT V_MAX : natural := 1066; --V total period (lines)
    
    CONSTANT H_POL : std_logic := '1';
    CONSTANT V_POL : std_logic := '1';
    
    SIGNAL Active  : std_logic;
    
    -- Horizontal and Vertical counters
    SIGNAL X_cntr_reg : std_logic_vector ( 11 downto 0) := ( others =>'0');
    SIGNAL Y_cntr_reg : std_logic_vector ( 11 downto 0) := ( others =>'0');
    
    -- Horizontal and Vertical Sync
    SIGNAL H_sync_reg : std_logic := NOT H_POL;
    SIGNAL V_sync_reg : std_logic := NOT V_POL;

begin

-- Generate Horizontal, Vertical counters and the Sync signals
    ---------------------------------------------------------------
    -- Horizontal counter
    process ( Clock)
    begin
        if ( rising_edge( Clock)) then
            if ( X_cntr_reg = (H_MAX - 1)) then
                X_cntr_reg <= (others =>'0');
            else
                X_cntr_reg <= X_cntr_reg + 1;
            end if;
        end if;
    end process;
    
    -- Vertical counter
    process ( Clock)
    begin
        if ( rising_edge( Clock)) then
            if ( (X_cntr_reg = (H_MAX - 1)) and (Y_cntr_reg = (V_MAX - 1))) then
                Y_cntr_reg <= (others =>'0');
            elsif (X_cntr_reg = (H_MAX - 1)) then
                Y_cntr_reg <= Y_cntr_reg + 1;
            end if;
        end if;
    end process;
    
    --Horizontal sync
    process ( Clock)
    begin
        if ( rising_edge( Clock)) then
            if ( X_cntr_reg >= (H_FP + FRAME_WIDTH - 1)) and (X_cntr_reg < (H_FP + FRAME_WIDTH + H_PW - 1)) then
                H_sync_reg <= H_POL;
            else
                H_sync_reg <= not(H_POL);
            end if;
        end if;
    end process;
    
    -- Vertical sync
    process ( Clock)
    begin
        if ( rising_edge( Clock)) then
            if ( Y_cntr_reg >= (V_FP + FRAME_HEIGHT - 1)) and (Y_cntr_reg < (V_FP + FRAME_HEIGHT + V_PW - 1)) then
                V_sync_reg <= V_POL;
            else
                V_sync_reg <= not(V_POL);
            end if;
        end if;
    end process;
    
    -- active signal
    Active <= '1'   when ( X_cntr_reg < FRAME_WIDTH and Y_cntr_reg < (FRAME_HEIGHT))
                    else '0';
                            
    Y_control <= Y_cntr_reg ;
    X_control <= X_cntr_reg ;
    Video_on <= Active ;
    H_sync <= H_sync_reg ;
    V_sync <= V_sync_reg ;

end Behavioral;