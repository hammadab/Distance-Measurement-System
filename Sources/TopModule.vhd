library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopModule is
  Port ( Clock : in STD_LOGIC; -- 100 MHz
         Echo  : in STD_LOGIC; -- return signal from the sensor
         switch : in STD_LOGIC_VECTOR ( 1 downto 0);
--         samples : in STD_LOGIC_VECTOR ( 5 downto 0);
         Trig  : out STD_LOGIC; -- Trigger for the sensor
         led  : out STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
         seg : out STD_LOGIC_VECTOR ( 6 downto 0); -- SSD output
         an : out STD_LOGIC_VECTOR ( 3 downto 0); -- anode output
         H_sync : out STD_LOGIC; -- VGA Ports
         V_sync : out STD_LOGIC; -- VGA Ports
         VGA_RED: out STD_LOGIC_VECTOR (3 downto 0); -- VGA Ports
         VGA_BLUE : out STD_LOGIC_VECTOR (3 downto 0); -- VGA Ports
         VGA_GREEN : out STD_LOGIC_VECTOR (3 downto 0) -- VGA Ports
         );
end TopModule;

architecture Behavioral of TopModule is

COMPONENT ClockDivider
    Port ( Clock : in STD_LOGIC; -- 100 MHz
           SyncM, SyncK : out STD_LOGIC); -- 1 MHz Clock
end COMPONENT;

COMPONENT TrigGen
    Port ( SyncM  : in STD_LOGIC; -- 1 MHz Clock
           Echo : in STD_LOGIC; -- a switch to start trigger
           Trig  : out STD_LOGIC); -- To sensor
end COMPONENT;

COMPONENT DistanceCalc
    Port ( --Trig : in STD_LOGIC; -- From TrigGen
           Echo : in STD_LOGIC; -- From Sensor, a switch for this module
           SyncM : in STD_LOGIC; -- 1 MHz Clock
--           T1, T2 : out STD_LOGIC_VECTOR ( 14 downto 0);
           Distance : out STD_LOGIC_VECTOR ( 8 downto 0)); -- distance in binary (15-bit)
end COMPONENT;

COMPONENT Distance_Average is
  Port ( SyncK : in STD_LOGIC; -- 1 KHz Clock
         Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
         Peak : in STD_LOGIC_VECTOR ( 8 downto 0);
         Avg : out STD_LOGIC_VECTOR ( 8 downto 0) -- average distance in binary (9-bit)
         );
end COMPONENT;

COMPONENT Distance_Peak is
  Port ( SyncM : in STD_LOGIC; -- 1 MHz Clock
        Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
--        sampling : in STD_LOGIC_VECTOR ( 5 downto 0); -- sampling 10^(input)
        Peak : out STD_LOGIC_VECTOR ( 8 downto 0) -- peak distance in binary (9-bit)
         );
end COMPONENT;

COMPONENT SSD
    Port (  SyncK : in STD_LOGIC; -- 1 KHz Clock
            Number : in STD_LOGIC_VECTOR ( 8 downto 0); -- binary number input
            Segment : out STD_LOGIC_VECTOR ( 6 downto 0); -- SSD output
            an : out STD_LOGIC_VECTOR ( 3 downto 0) -- anode output
          );
end COMPONENT;

component VGAsync
    Generic (   Horizontal_FrameSize : natural;
                Vertical_FrameSize : natural
             );
    Port ( Clock : in STD_LOGIC;
           y_control : out STD_LOGIC_VECTOR (11 downto 0);
           x_control : out STD_LOGIC_VECTOR (11 downto 0);
           video_on : out STD_LOGIC;
           H_sync : out STD_LOGIC;
           V_sync : out STD_LOGIC
          );
end component ;

COMPONENT VGA
    Generic (   Horizontal_FrameSize : natural;
                Vertical_FrameSize : natural
             );
    Port ( Clock : in STD_LOGIC;
           x_counter : in STD_LOGIC_VECTOR (11 downto 0);
           y_counter : in STD_LOGIC_VECTOR (11 downto 0);
           video : in STD_LOGIC;
           Mode : in STD_LOGIC_VECTOR ( 1 downto 0);
           Distance : in STD_LOGIC_VECTOR ( 8 downto 0);
           Seconds, Minutes, Hours : in INTEGER;
--           red : in STD_LOGIC_VECTOR ( 3 downto 0);
--           green : in STD_LOGIC_VECTOR (3 downto 0);
--           blue : in STD_LOGIC_VECTOR ( 3 downto 0);
           VGA_RED : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_GREEN : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_BLUE : out STD_LOGIC_VECTOR (3 downto 0)
          );
end COMPONENT;

COMPONENT Clock_Display
    Port ( Clock : in STD_LOGIC; -- 100 MHz
           Seconds, Minutes, Hours : out INTEGER
           );
END COMPONENT;

    SIGNAL SyncM, SyncK : STD_LOGIC; -- 1 MHz Clock
    SIGNAL Trigger : STD_LOGIC ;--:= '0'; -- From TrigGen
    SIGNAL Dist, Dist_temp, Dist_Avg, Dist_Peak : STD_LOGIC_VECTOR ( 8 downto 0) := "000000000"; --, Dist_temp, Dist_Avg, Dist_Peak
    SIGNAL X_count : STD_LOGIC_VECTOR (11 downto 0);
    SIGNAL Y_count : STD_LOGIC_VECTOR (11 downto 0);
    SIGNAL Vodeo_on : STD_LOGIC;
    SIGNAL Seconds, Minutes, Hours : INTEGER;
    
begin
    process ( switch, Dist_Avg, Dist_Peak, Dist_temp)
    begin
        if ( switch = "01") then
            Dist <= Dist_Avg;
        elsif ( switch = "10") then
            Dist <= Dist_Peak;
        else
            Dist <= Dist_temp;
        end if;
    end process;
    LED <= Dist;

    M1 : ClockDivider PORT MAP ( Clock => Clock, -- 100 MHz
                                 SyncM => SyncM, -- 1 MHz Clock
                                 SyncK => SyncK); -- 1 KHz Clock

    M2 : TrigGen PORT MAP ( SyncM => SyncM, -- 1 MHz Clock
                            Echo => Echo, -- a switch to start trigger
                            Trig => Trigger); -- To sensor

    Trig <= Trigger; -- from internal signal to output
    
    M4 : DistanceCalc PORT MAP (    Echo => Echo, -- From Sensor, a switch for this module
                                    SyncM => SyncM, -- 1 MHz Clock
                                    Distance => Dist_temp); -- distance in binary (9-bit)
                               
    M5 : Distance_Average PORT MAP ( SyncK => SyncK,  -- 1 KHz Clock
                                     Distance => Dist_temp, -- distance in binary (9-bit)
                                     Peak => Dist_Peak,
                                     Avg => Dist_Avg); -- average distance in binary (9-bit)
    
    M6 : Distance_Peak PORT MAP (   SyncM => SyncM, -- 1 MHz Clock
                                    Distance => Dist_temp, -- distance in binary (9-bit)
--                                    sampling => samples,
                                    Peak => Dist_Peak); -- Peak distance in binary (9-bit)
    
    M9 : SSD PORT MAP ( SyncK => SyncK, -- 1 KHz Clock
                        Number => Dist,
                        Segment => seg,
                        an => an);
    
    M10 : VGAsync  Generic map ( 1280, 1024)
                    port map( Clock  => Clock ,
                              y_control => Y_count ,
                              x_control => x_count ,
                              video_on => vodeo_on ,
                              H_sync => H_sync,
                              V_sync => V_sync 
                             );
                                                      
    M11 : VGA GENERIC MAP ( 1280, 1024)
                   port map ( Clock => Clock ,
                              x_counter => x_count ,
                              y_counter => Y_count ,
                              video => vodeo_on,
                              Mode => switch,
                              Distance => Dist,
                              Seconds => Seconds,
                              Minutes => Minutes,
                              Hours => Hours,
--                              red => red,
--                              green => green,
--                              blue => blue ,
                              VGA_RED => VGA_RED ,
                              VGA_GREEN => VGA_GREEN ,
                              VGA_BLUE => VGA_BLUE
                             );

    M12 : Clock_Display PORT MAP ( Clock => Clock, -- 100 MHz
                                   Seconds => Seconds,
                                   Minutes => Minutes,
                                   Hours => Hours
                                  );

end Behavioral;