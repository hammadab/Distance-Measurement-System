library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockDivider is
    Port ( Clock : in STD_LOGIC; -- 100 MHz
           SyncM, SyncK  : out STD_LOGIC -- 1 MHz Clock, 1KHz
           );
end ClockDivider;

architecture Behavioral of ClockDivider is

    SIGNAL sync_tempM, sync_tempK : STD_LOGIC := '1';
    SIGNAL int1, int2 : INTEGER := 0;

begin

    process ( Clock)
    begin
        --frequency = 1 MHz
        if ( rising_edge( Clock)) then
            if ( int1 < 49) then
                int1 <= int1 + 1;
            else
                int1 <= 0;
                sync_tempM <= NOT sync_tempM;
            end if;
        end if;
        
        if ( rising_edge( Clock)) then
            if ( int2 < 49999) then
                int2 <= int2 + 1;
            else
                int2 <= 0;
                sync_tempK <= NOT sync_tempK;
            end if;
        end if;
        
    end process;
    SyncM <= sync_tempM;
    SyncK <= sync_tempK;
end Behavioral;