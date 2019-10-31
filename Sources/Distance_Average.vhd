library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Distance_Average is
  Port ( SyncK : in STD_LOGIC; -- 1 KHz Clock
         Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
         Peak : in STD_LOGIC_VECTOR ( 8 downto 0);
         Avg : out STD_LOGIC_VECTOR ( 8 downto 0) -- average distance in binary (9-bit)
         );
end Distance_Average;

architecture Behavioral of Distance_Average is
    
    SIGNAL Avg_temp : STD_LOGIC_VECTOR ( 8 downto 0);
    SHARED VARIABLE count : INTEGER := 0;
    SHARED VARIABLE times : INTEGER := 1;
    SHARED VARIABLE sum : INTEGER := 0;
    
begin
    Avg <= Avg_temp;

    process ( SyncK)
    begin
        if ( SyncK'event and SyncK = '1') then
            if ( times >= 1 and times <= 500) then
                if ( Distance >= (Peak - 5) and Distance <= (Peak + 5)) then 
                    sum := sum + to_integer(unsigned( Distance));
                    count := count + 1;
                end if;
                times := times + 1;
            else
                Avg_temp <= std_logic_vector(to_unsigned( (sum / count), 9)); -- divide sum by the number of values summed in it
                count := 0;
                times := 1;
                if ( count = 0) then
                    sum := 0;
                end if;
            end if;
        end if;
    end process;
end Behavioral;