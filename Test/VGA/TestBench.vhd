library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is
    COMPONENT TopModule
            Port ( Clock : in STD_LOGIC;
                   red : in STD_LOGIC_VECTOR ( 3 downto 0);
                   green : in STD_LOGIC_VECTOR (3 downto 0);
                   blue : in STD_LOGIC_VECTOR ( 3 downto 0);
                   VGA_RED: out STD_LOGIC_VECTOR (3 downto 0);
                   VGA_BLUE : out STD_LOGIC_VECTOR (3 downto 0);
                   VGA_GREEN : out STD_LOGIC_VECTOR (3 downto 0);
                   H_sync : out STD_LOGIC;
                   V_sync : out STD_LOGIC
                  );
    end COMPONENT;

--    COMPONENT VGA
--            Generic (   Horizontal_FrameSize : natural;
--                        Vertical_FrameSize : natural
--                     );
--            Port (  Clock       : in STD_LOGIC;
--                    X_counter   : in STD_LOGIC_VECTOR ( 11 downto 0);
--                    Y_counter   : in STD_LOGIC_VECTOR ( 11 downto 0);
--                    Video       : in STD_LOGIC;
--                    red         : in STD_LOGIC_VECTOR ( 3 downto 0);
--                    green       : in STD_LOGIC_VECTOR (3 downto 0);
--                    blue        : in STD_LOGIC_VECTOR ( 3 downto 0);
--                    VGA_RED     : out STD_LOGIC_VECTOR ( 3 downto 0);
--                    VGA_GREEN   : out STD_LOGIC_VECTOR (3 downto 0);
--                    VGA_BLUE    : out STD_LOGIC_VECTOR ( 3 downto 0)
--                  );
--    end COMPONENT;

--    COMPONENT Lines is
--            Generic ( Horizontal_FrameSize : natural
--                     );
--            Port ( X            : in STD_LOGIC_VECTOR ( 11 downto 0);
--                   X_Location   : in INTEGER;
--                   Y            : in STD_LOGIC_VECTOR ( 11 downto 0);
--                   Chars        : in STRING ( 159 downto 0);
--                   Go           : out STD_LOGIC
--                  );
--    end COMPONENT;

--    COMPONENT Fonts
--          Port (    Char : in CHARACTER;
--                    Char_0, Char_1, Char_2, Char_3, Char_4, Char_5, Char_6, Char_7, Char_8, Char_9,
--                    Char_a, Char_b, Char_c, Char_d, Char_e, Char_f : out STD_LOGIC_VECTOR ( 7 downto 0)
--                );
--    end COMPONENT;

    
    -- Inputs
    SIGNAL Clock : STD_LOGIC := '1';
    
    -- Outputs
    SIGNAL h_sync    : STD_LOGIC; -- VGA Ports
    SIGNAL v_sync    : STD_LOGIC; -- VGA Ports
    SIGNAL VGA_RED   : STD_LOGIC_VECTOR (3 downto 0); -- VGA Ports
    SIGNAL VGA_BLUE  : STD_LOGIC_VECTOR (3 downto 0); -- VGA Ports
    SIGNAL VGA_GREEN : STD_LOGIC_VECTOR (3 downto 0); -- VGA Ports
    
--    SIGNAL X_counter   : STD_LOGIC_VECTOR ( 11 downto 0) := "000000001101";
--    SIGNAL Y_counter   : STD_LOGIC_VECTOR ( 11 downto 0) := "000000000001";
--    SIGNAL VGA_RED     : STD_LOGIC_VECTOR ( 3 downto 0);
--    SIGNAL VGA_GREEN   : STD_LOGIC_VECTOR (3 downto 0);
--    SIGNAL VGA_BLUE    : STD_LOGIC_VECTOR ( 3 downto 0);
    
--    SIGNAL Go         : STD_LOGIC;
    
--    SIGNAL Char_0, Char_1, Char_2, Char_3, Char_4, Char_5, Char_6, Char_7 : STD_LOGIC_VECTOR ( 7 downto 0);
--    SIGNAL Char_8, Char_9, Char_a, Char_b, Char_c, Char_d, Char_e, Char_f : STD_LOGIC_VECTOR ( 7 downto 0);
    
begin
    UUT1 : TopModule port map ( Clock,
                                "1111",
                                "1111",
                                "1111",
                                VGA_RED ,
                                VGA_BLUE,
                                VGA_GREEN,
                                h_sync,
                                v_sync
                               );

--    UUT2 : VGA GENERIC MAP ( 1280, 1024) PORT MAP ( Clock,
--                                                    X_counter,
--                                                    Y_counter,
--                                                    '1',
--                                                    "1111",
--                                                    "1111",
--                                                    "1111",
--                                                    VGA_RED,
--                                                    VGA_GREEN,
--                                                    VGA_BLUE
--                                                   );
    
--    UUT3 : Lines GENERIC MAP ( 1280) PORT MAP ( X_counter,
--                                                1,
--                                                Y_counter,
--                                                "WHGEDFAHSVMCSVDCJAWDYFUTWUTOQWEUFTPOWIFUTSUDTFCGASKDYCGLASDHCGASFDGCFZHGVCBNVMZBVXCBVZKMJHFGF FGTQOURTFOEWUTFGSDHZXNGCVNXZMGVAJSWDFGYAKSJUFYTGHDHDHDHDHDHDHDHDHD",
--                                                Go
--                                               );
    
--    UUT4 : Fonts PORT MAP ( 'B',
--                            Char_0,
--                            Char_1,
--                            Char_2,
--                            Char_3,
--                            Char_4,
--                            Char_5,
--                            Char_6,
--                            Char_7,
--                            Char_8,
--                            Char_9,
--                            Char_a,
--                            Char_b,
--                            Char_c,
--                            Char_d,
--                            Char_e,
--                            Char_f
--                           );

    clk : process
    begin
        Clock <= '1';
        wait for 5 ns;
        Clock <= '0';
		wait for 5 ns;
    end process;
end;
