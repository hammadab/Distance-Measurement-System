--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all ;
--use IEEE.numeric_std.all;

--entity To_BCD is
--  Port (Number : in STD_LOGIC_VECTOR ( 8 downto 0); -- binary number input
--        First_Digit : out STD_LOGIC_VECTOR ( 3 downto 0);
--        Second_Digit : out STD_LOGIC_VECTOR ( 3 downto 0);
--        Third_Digit : out STD_LOGIC_VECTOR ( 3 downto 0)
--        );
--end To_BCD;

--architecture Behavioral of To_BCD is
    
--    SIGNAL numb : INTEGER;
    
--begin
    
--    numb <= to_integer(unsigned( Number));
--    First_Digit <= std_logic_vector(to_unsigned( (numb mod 10), 4));
--    Second_Digit <= std_logic_vector(to_unsigned( ((numb/10) mod 10), 4));
--    Third_Digit <= std_logic_vector(to_unsigned( (numb/100), 4));
    
--end Behavioral;