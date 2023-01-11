library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity vga_driver is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           RED_in : in STD_LOGIC_VECTOR (3 downto 0);
           GRN_in : in STD_LOGIC_VECTOR (3 downto 0);
           BLU_in : in STD_LOGIC_VECTOR (3 downto 0);
           eje_x: out STD_LOGIC_VECTOR (9 downto 0);
           eje_y:out STD_LOGIC_VECTOR (9 downto 0);
           refresh : out STD_LOGIC;
           HS : out STD_LOGIC;
           VS : out STD_LOGIC;
           RED : out STD_LOGIC_VECTOR (3 downto 0);
           GRN : out STD_LOGIC_VECTOR (3 downto 0);
           BLU : out STD_LOGIC_VECTOR (3 downto 0));
end vga_driver;

architecture Behavioral of vga_driver is
--SEÑALES--
signal enable_conth,enable_contv,salida_frec_pixel: STD_LOGIC; --Señales necesarias para interconectar
signal salida_O1_H,salida_O3_H,salida_O1_V,salida_O3_V: STD_LOGIC;
signal Q_data_h,Q_data_V: STD_LOGIC_VECTOR (9 downto 0);
--COMPONENTES--
component frec_pixel 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_pixel : out STD_LOGIC);
end component;

component contador 
    Generic (Nbit: INTEGER := 8);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           resets : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (Nbit-1 downto 0));
end component;

component comparador
    Generic (Nbit: integer := 8;
        End_Of_Screen: integer :=10;
        Start_Of_Pulse: integer :=20;
        End_Of_Pulse: integer := 30;
        End_Of_Line: integer := 40);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (Nbit-1 downto 0);
           O1 : out STD_LOGIC;
           O2 : out STD_LOGIC;
           O3 : out STD_LOGIC);
end component;

component gen_color
    Port ( blank_h : in STD_LOGIC;
           blank_v : in STD_LOGIC;
           RED_in : in STD_LOGIC_VECTOR (3 downto 0);
           GRN_in : in STD_LOGIC_VECTOR (3 downto 0);
           BLU_in : in STD_LOGIC_VECTOR (3 downto 0);
           RED : out STD_LOGIC_VECTOR (3 downto 0);
           GRN : out STD_LOGIC_VECTOR (3 downto 0);
           BLU : out STD_LOGIC_VECTOR (3 downto 0));
end component;
------------------
begin
------INSTANCIAS------------
div_frec_pixel: frec_pixel
port map(
    clk => clk,
    reset => reset,
    clk_pixel => salida_frec_pixel
);

conth: contador
generic map(
    Nbit => 10
)
port map(
    clk => clk,
    reset => reset,
    enable =>  enable_conth,
    resets => enable_contv,
    Q => Q_data_H
);

contv: contador
generic map(
    Nbit => 10
)
port map(
    clk => clk,
    reset => reset,
    enable =>  enable_contv,
    resets => salida_O3_V,
    Q => Q_data_V
);

comph: comparador
generic map(
    Nbit => 10,
    End_Of_Screen => 639,
    Start_Of_Pulse => 655,
    End_Of_Pulse => 751,
    End_Of_Line => 799
)
port map(
    clk => clk,
    reset => reset,
    data => Q_data_H,
    O1 => salida_O1_H,
    O2 => HS,
    O3 => salida_O3_H
);

compv: comparador
generic map(
    Nbit => 10,
    End_Of_Screen => 479,
    Start_Of_Pulse => 489,
    End_Of_Pulse => 491,
    End_Of_Line => 520
)
port map(
    clk => clk,
    reset => reset,
    data => Q_data_V,
    O1 => salida_O1_V,
    O2 => VS,
    O3 => salida_O3_V
);

gen_colores: gen_color
port map( 
    blank_h  => salida_O1_H,
    blank_v => salida_O1_V,
    RED_in => RED_in,
    GRN_in => GRN_in,
    BLU_in => BLU_in,
    RED => RED,
    GRN => GRN,
    BLU => BLU
);
--------------------
enable_conth <= salida_frec_pixel;
enable_contv <= salida_frec_pixel and salida_O3_H;

eje_x <= Q_data_H;
eje_y <= Q_data_V;

refresh <= salida_O3_V;

end Behavioral;
