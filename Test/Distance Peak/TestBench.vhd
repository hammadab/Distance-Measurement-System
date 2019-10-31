library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is

COMPONENT Distance 
  Port ( SyncM : in STD_LOGIC; -- 1 MHz Clock
       Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
       Peak, Peak_temp, counter : out STD_LOGIC_VECTOR ( 8 downto 0) -- average distance in binary (9-bit)
       );
END COMPONENT;

SIGNAL Sync : STD_LOGIC := '0';
SIGNAL Distanc : STD_LOGIC_VECTOR ( 8 downto 0) := "000000000";


SIGNAL Pea, Peak_tem, counte : STD_LOGIC_VECTOR ( 8 downto 0);

begin


    UUT1 : Distance  PORT MAP ( Sync, Distanc, Pea, Peak_tem, counte); --, count, times, sum);


    uut2 : process
    begin
        Sync <= '1';
        wait for 2000 us;
        Sync <= '0';
		wait for 2000 us;
    end process;
    
    uut3 : process
    begin
        Distanc <= "000000001";
        wait for 4 ms;
        Distanc <= "000000010";
        wait for 4 ms;
        Distanc <= "000000100";
        wait for 4 ms;
        Distanc <= "100000000";
        wait for 4 ms;
        Distanc <= "000010000";
        wait for 4 ms;
        Distanc <= "000100000";
        wait for 4 ms;
        Distanc <= "001000000";
        wait for 4 ms;
        Distanc <= "010000000";
        wait for 4 ms;
        Distanc <= "000001000";
        wait for 4 ms;
        Distanc <= "100000000";
        wait for 4 ms;
        Distanc <= "100000001";
        wait for 4 ms;
        Distanc <= "100000010";
        wait for 4 ms;
        Distanc <= "100000100";
        wait for 4 ms;
        Distanc <= "100001000";
        wait for 4 ms;
        Distanc <= "100010000";
        wait for 4 ms;
    end process;
end Behavioral;
