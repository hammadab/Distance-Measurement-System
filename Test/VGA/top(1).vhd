library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity TopModule is
    Port ( Clock : in STD_LOGIC;
           red : in STD_LOGIC_VECTOR ( 3 downto 0);
           green : in STD_LOGIC_VECTOR (3 downto 0);
           blue : in STD_LOGIC_VECTOR ( 3 downto 0);
           VGA_RED: out STD_LOGIC_VECTOR (3 downto 0);
           VGA_BLUE : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_GREEN : out STD_LOGIC_VECTOR (3 downto 0);
           H_sync : out STD_LOGIC;
           V_sync : out STD_LOGIC
          );
end TopModule;

architecture Behavioral of TopModule is
component VGAsync
    Generic (   Horizontal_FrameSize : natural;
                Vertical_FrameSize : natural
             );
    Port ( Clock : in STD_LOGIC;
           y_control : out STD_LOGIC_VECTOR (11 downto 0);
           x_control : out STD_LOGIC_VECTOR (11 downto 0);
           video_on : out STD_LOGIC;
           h_sync : out STD_LOGIC;
           v_sync : out STD_LOGIC
          );
end component ;

component VGA
    Generic (   Horizontal_FrameSize : natural;
                Vertical_FrameSize : natural
             );
    Port ( Clock : in STD_LOGIC;
           x_counter : in STD_LOGIC_VECTOR (11 downto 0);
           y_counter : in STD_LOGIC_VECTOR (11 downto 0);
           video : in STD_LOGIC;
           red : in STD_LOGIC_VECTOR ( 3 downto 0);
           green : in STD_LOGIC_VECTOR (3 downto 0);
           blue : in STD_LOGIC_VECTOR ( 3 downto 0);
           VGA_RED : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_GREEN : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_BLUE : out STD_LOGIC_VECTOR (3 downto 0)
          );
end component;

    SIGNAL x_count : STD_LOGIC_VECTOR (11 downto 0);
    SIGNAL Y_count : STD_LOGIC_VECTOR (11 downto 0);
    SIGNAL vodeo_on : STD_LOGIC;

begin
sync : VGAsync  Generic map ( 1280, 1024)
                port map( Clock  => Clock ,
                          y_control => Y_count ,
                          x_control => x_count ,
                          video_on => vodeo_on ,
                          h_sync => h_sync,
                          v_sync => v_sync 
                         );
                              
ImgGenMod: VGA GENERIC MAP ( 1280, 1024)
               port map ( Clock => Clock ,
                          VGA_RED => VGA_RED ,
                          VGA_GREEN => VGA_GREEN ,
                          VGA_BLUE => VGA_BLUE ,
                          y_counter => Y_count ,
                          x_counter => x_count ,
                          red => red,
                          green => green,
                          blue => blue,
                          video => vodeo_on
                         );
end Behavioral;