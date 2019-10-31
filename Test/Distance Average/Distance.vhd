library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Distance is
  Port ( SyncM : in STD_LOGIC; -- 1 MHz
         Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
         Avg : out STD_LOGIC_VECTOR ( 8 downto 0) -- average distance in binary (9-bit)
--         counts : out STD_LOGIC_VECTOR ( 8 downto 0);
--         timing : out STD_LOGIC_VECTOR ( 5 downto 0);
--         sumed : out STD_LOGIC_VECTOR ( 8 downto 0)
         );
end Distance;

architecture Behavioral of Distance is
    
    SIGNAL Avg_temp : STD_LOGIC_VECTOR ( 8 downto 0);
    SHARED VARIABLE count : INTEGER := 0;
    SHARED VARIABLE times : INTEGER := 1;
    SHARED VARIABLE sum : INTEGER := 0;
    
begin






    Avg <= Avg_temp;

    process ( SyncM)
    begin
        if ( SyncM'event and SyncM = '1') then
            if ( times >= 1 and times < 10) then
                sum := sum + to_integer(unsigned( Distance));
--                sumed <= std_logic_vector(to_unsigned( sum, 9));
                count := count + 1;
--                counts <= std_logic_vector(to_unsigned( count, 9));
                times := times + 1;
--                timing <= std_logic_vector(to_unsigned( times, 6));
            else
                Avg_temp <= std_logic_vector(to_unsigned( (sum / count), 9)); -- divide sum by the number of values summed in it
                count := 0;
--                counts <= std_logic_vector(to_unsigned( count, 9));
                times := 1;
--                timing <= std_logic_vector(to_unsigned( times, 6));
                if ( count = 0) then
                    sum := 0;
--                    sumed <= std_logic_vector(to_unsigned( sum, 9));
                end if;
            end if;
        end if;
    end process;
end Behavioral;