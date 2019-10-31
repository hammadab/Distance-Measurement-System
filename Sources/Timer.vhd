--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.numeric_std.all;

---- CALCULATE TIME BETWEEN FALL TRIG AND RISE ECHO

--entity Timer is
--    Port ( 	Trig : in STD_LOGIC; -- From TrigGen
--            Echo : in STD_LOGIC; -- From Sensor, a switch for this module
--            Sync : in STD_LOGIC; -- 1 MHz Clock
--            Distance   : out STD_LOGIC_VECTOR (14 downto 0)); -- distance in binary (15-bit)
--end Timer;

--architecture Behavioral of Timer is

--    SIGNAL TempTime, SaveTime : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
--    SIGNAL TotalTime : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
--    SIGNAL start : STD_LOGIC := '0';
    
--begin
--    process (Trig, Echo, Sync)
--    begin

--        if ( Trig = '1') then
--            start <= '0';
--            TotalTime <= TempTime;
--        elsif (Trig = '0' and start = '0') then -- falling edge of trig
--            start <= '1';
--            TempTime <= "000000000000000";
--        end if;

--        if ( Echo = '1') then
--            start <= '0';
--            TotalTime <= TempTime;
--        end if;
        
--        if ( Sync'event and Sync = '1' and start = '1') then
--			TempTime <= TempTime + 1;
--        end if;
        
--    end process;

--    process ( TotalTime, Sync)
--    begin
--        if (TotalTime < "000000000111010") then
----            Distance <= "000000000000001";
--        else
----            if ( Sync'event and Sync = '1') then
--                Distance <= std_logic_vector(to_unsigned(to_integer(unsigned( TotalTime ) / 58), 15)); -- divide total time by 58 to obtain distance in cm
----            end if;
--        end if;
--    end process;
--end Behavioral;
