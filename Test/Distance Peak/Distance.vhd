library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Distance is
  Port ( SyncM : in STD_LOGIC; -- 1 MHz Clock
         Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
         Peak, Peak_temp, counter : out STD_LOGIC_VECTOR ( 8 downto 0) -- average distance in binary (9-bit)
         );
end Distance;

architecture Behavioral of Distance is

    SIGNAL Peak_temporary : STD_LOGIC_VECTOR ( 8 downto 0) := "000000000";
    SHARED VARIABLE count : INTEGER := 999999999;
    
begin

    process ( SyncM)
    begin
        if ( SyncM'event and SyncM = '1') then
            if ( count >= 0 and count <= 7) then
                count := count + 1;
                counter <= std_logic_vector(to_unsigned( count, 9));
                if ( Distance > Peak_temporary) then -- if the current value of Distance is larger then the previous Peak
                    Peak_temporary <= Distance; -- then update Peak_temp
                    Peak_temp <= Distance;
                end if;
            else
                count := 0; -- reset counter to 0
                counter <= std_logic_vector(to_unsigned( count, 9));
                Peak <= Peak_temporary; -- after 4000 values output Peak_temp
                if ( count = 0) then
                    Peak_temporary <= "000000000"; -- after 4000 values reset Peak_temp
                    Peak_temp <= Peak_temporary;
                end if;
            end if;
        end if;
    end process;
    
end Behavioral;