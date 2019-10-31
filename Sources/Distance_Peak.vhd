library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Distance_Peak is
  Port ( SyncM : in STD_LOGIC; -- 1 MHz Clock
         Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
--         sampling : in STD_LOGIC_VECTOR ( 5 downto 0); -- sampling 10^(input)
         Peak : out STD_LOGIC_VECTOR ( 8 downto 0) -- peak distance in binary (9-bit)
         );
end Distance_Peak;

architecture Behavioral of Distance_Peak is

    SIGNAL Peak_temp : STD_LOGIC_VECTOR ( 8 downto 0) := "000000000";
    SHARED VARIABLE count : INTEGER := 999999999;
--    SHARED VARIABLE samples : INTEGER := 1;
    
begin

    process ( SyncM)
    begin
        if ( SyncM'event and SyncM = '1') then
--            if ( sampling = "000001") then
--                samples := 10000;
--            elsif ( sampling = "000010") then
--                samples := 20000;
--            elsif ( sampling = "000100") then
--                samples := 40000;
--            elsif ( sampling = "001000") then
--                samples := 80000;
--            elsif ( sampling = "010000") then
--                samples := 100000;
--            elsif ( sampling = "100000") then
--                samples := 200000;
--            else
--                samples := 80000;
--            end if;
            
            if ( count >= 0 and count <= 80000) then
                count := count + 1;
                if ( Distance > Peak_temp) then -- if the current value of Distance is larger then the previous Peak
                    Peak_temp <= Distance; -- then update Peak_temp
                end if;
            else
                count := 0; -- reset counter to 0
                Peak <= Peak_temp; -- after 4000 values output Peak_temp
                if ( count = 0) then
                    Peak_temp <= "000000000"; -- after 4000 values reset Peak_temp
                end if;
            end if;
        end if;
    end process;
    
end Behavioral;