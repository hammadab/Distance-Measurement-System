library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TrigGen is
    Port ( SyncM  : in STD_LOGIC; -- 1 MHz Clock
           Echo  : in STD_LOGIC; -- a switch to start trigger
           Trig  : out STD_LOGIC); -- To sensor
end TrigGen;

architecture Behavioral of TrigGen is

    SIGNAL Start : STD_LOGIC := '1';
    
begin
    process (Echo, SyncM)
        VARIABLE int : INTEGER := 0;
    begin
        
        if ( SyncM'event and SyncM = '1' and Echo = '0') then
            if (int = 12 ) then
                start <= '0';
                int := 0;
                Trig <= '0';
            elsif (int < 12 and start = '1') then
                int := int + 1;
                Trig <= '1';
            end if;
        end if; -- elsif
        if ( Echo = '1') then -- elsif
            int := 0;
            Trig <= '0';
            start <= '1';
        end if;
        
    end process;
    
end Behavioral;