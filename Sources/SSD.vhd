library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all ;
use IEEE.numeric_std.all;

entity SSD is
    Port (  SyncK : in STD_LOGIC; -- 1 KHz Clock
            Number : in STD_LOGIC_VECTOR ( 8 downto 0); -- binary number input
            Segment : out STD_LOGIC_VECTOR ( 6 downto 0); -- SSD output
            an : out STD_LOGIC_VECTOR ( 3 downto 0) -- anode output
          );
end SSD;

architecture Behavioral of SSD is
    
    SIGNAL numb : INTEGER;
    SIGNAL First_Digit, Second_Digit, Third_Digit :STD_LOGIC_VECTOR ( 3 downto 0);
    SHARED VARIABLE int : INTEGER := 0;
    SIGNAL temp : STD_LOGIC_VECTOR ( 3 downto 0) := "0000";
    SIGNAL anode : STD_LOGIC_VECTOR ( 3 downto 0) := "1110";
    
begin
    
    numb <= to_integer(unsigned( Number));
    First_Digit <= std_logic_vector(to_unsigned( (numb mod 10), 4));
    Second_Digit <= std_logic_vector(to_unsigned( ((numb/10) mod 10), 4));
    Third_Digit <= std_logic_vector(to_unsigned( (numb/100), 4));
    
    PROCESS (SyncK)
    BEGIN
        if ( SyncK'event and SyncK = '1') then
            if ( int = 2) then
                temp <= Third_Digit;
                an <= "1011";
                int := 0;
            elsif ( int = 1) then
                temp <= Second_Digit;
                an <= "1101";
                int := int + 1;
            elsif ( int = 0) then
                temp <= First_Digit;
                an <= "1110";
                int := int + 1;
            end if;
        end if;
    END PROCESS;
    
    PROCESS ( temp)
    BEGIN
        if ( temp = "0000") then
--            Segment <=  "1111110"; -- 0 -- 126
            Segment <=  "1000000"; -- 0 -- 
        elsif  ( temp = "0001") then
--            Segment <=  "0110000"; -- 1 -- 48
            Segment <=  "1111001"; -- 1 -- 
        elsif  ( temp = "0010") then
--            Segment <=  "1101101"; -- 2 -- 109
            Segment <=  "0100100"; -- 2 -- 
        elsif  ( temp = "0011") then
--            Segment <=  "1111001"; -- 3 -- 121
            Segment <=  "0110000"; -- 3 -- 
        elsif  ( temp = "0100") then
--            Segment <=  "0110011"; -- 4 -- 51
            Segment <=  "0011001"; -- 4 -- 
        elsif  ( temp = "0101") then
--            Segment <=  "1011011"; -- 5 -- 91
            Segment <=  "0010010"; -- 5 -- 
        elsif  ( temp = "0110") then
--            Segment <=  "1011111"; -- 6 -- 95
            Segment <=  "0000010"; -- 6 -- 
        elsif  ( temp = "0111") then
--            Segment <=  "1110000"; -- 7 -- 112
            Segment <=  "1111000"; -- 7 -- 
        elsif  ( temp = "1000") then
--            Segment <=  "1111111"; -- 8 -- 127
            Segment <=  "0000000"; -- 8 -- 
        elsif  ( temp = "1001") then
--            Segment <=  "1111011"; -- 9 -- 123
            Segment <=  "0010000"; -- 9 -- 
        end if;
    END PROCESS;
    
end Behavioral;