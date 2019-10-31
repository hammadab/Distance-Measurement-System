library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is

COMPONENT Distance 
--    Generic ( n : INTEGER);
    Port (  SyncM : in STD_LOGIC; -- 1 MHz
            Distance : in STD_LOGIC_VECTOR ( 8 downto 0); -- distance in binary (9-bit)
            Avg : out STD_LOGIC_VECTOR ( 8 downto 0) -- average distance in binary (9-bit)
--            counts : out STD_LOGIC_VECTOR ( 8 downto 0);
--            timing : out STD_LOGIC_VECTOR ( 5 downto 0);
--            sumed : out STD_LOGIC_VECTOR ( 8 downto 0)
          );
END COMPONENT;

SIGNAL Sync : STD_LOGIC := '0';
SIGNAL Distanc : STD_LOGIC_VECTOR ( 8 downto 0) := "000000000";

SIGNAL Av : STD_LOGIC_VECTOR ( 8 downto 0);
--SIGNAL count : STD_LOGIC_VECTOR ( 8 downto 0);
--SIGNAL times : STD_LOGIC_VECTOR ( 5 downto 0);
--SIGNAL sum  : STD_LOGIC_VECTOR ( 8 downto 0);

begin


    UUT1 : Distance  PORT MAP ( Sync, Distanc, Av); --, count, times, sum);


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
        Distanc <= "000001000";
        wait for 4 ms;
        Distanc <= "000010000";
        wait for 4 ms;
        Distanc <= "000100000";
        wait for 4 ms;
        Distanc <= "001000000";
        wait for 4 ms;
        Distanc <= "010000000";
        wait for 4 ms;
        Distanc <= "100000000";
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
