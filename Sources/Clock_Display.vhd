library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Display is
    Port ( Clock : in STD_LOGIC; -- 100 MHz
           Seconds, Minutes, Hours : out INTEGER
           );
end Clock_Display;

architecture Behavioral of Clock_Display is
    
    SIGNAL Sync : STD_LOGIC := '1';
    SIGNAL int, sec, min, hour : INTEGER := 0;
    
begin

    process ( Clock)
    begin
        --frequency = 1 MHz
        if ( rising_edge(Clock)) then
            if ( int < 49999999) then
                int <= int + 1;
            else
                int <= 0;
                Sync <= NOT Sync;
            end if;
        end if;
    end process;
    
    process ( Sync)
    begin
        if ( rising_edge(Sync)) then
--            if ( Sync = '1') then
                
                if ( sec < 60) then
                    sec <= sec + 1;
                else
                    sec <= 0;
                    if ( min < 60) then
                        min <= min + 1;
                    else
                        min <= 0;
                        if ( hour < 24) then
                            hour <= hour + 1;
                        else
                            hour <= 0;
                        end if;
                    end if;
                end if;
                

--            end if;
        end if;
    end process;
    
    Seconds <= sec;
    Minutes <= min;
    Hours <= hour;
end Behavioral;