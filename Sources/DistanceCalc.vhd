library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- CALCULATE PEAK TIME OF ECHO

entity DistanceCalc is
    Port (  --Trig : in STD_LOGIC; -- From TrigGen
            Echo : in STD_LOGIC; -- From Sensor, a switch for this module
            SyncM : in STD_LOGIC; -- 1 MHz Clock
--            T1, T2 : out STD_LOGIC_VECTOR (14 downto 0);
            Distance   : out STD_LOGIC_VECTOR (8 downto 0)); -- distance in binary (15-bit)
end DistanceCalc;

architecture Behavioral of DistanceCalc is

    SIGNAL Dist : STD_LOGIC_VECTOR (14 downto 0); -- distance in decimal
--    SIGNAL fasla : STD_LOGIC_VECTOR (14 downto 0); -- distance in binary (9-bit)

begin

    PROCESS ( Echo, SyncM)
    begin
        if ( SyncM'event and SyncM = '1') then
            if ( Echo = '1') then
                Dist <= Dist + 1;
            else
                Dist <= "000000000000000";
            end if;
            
            if ( Echo = '0') then
                if ( Dist = "000000000000000") then
                else
                    Distance <= std_logic_vector(to_unsigned(to_integer(unsigned( Dist ) / 58), 9)); -- divide total time by 58 to obtain distance in cm
                end if;
            end if;
        end if;
    end process;
    
    
    
end Behavioral;