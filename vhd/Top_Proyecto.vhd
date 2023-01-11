library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_proyecto is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           up: in STD_LOGIC;
           down: in STD_LOGIC;
           left: in STD_LOGIC;
           right: in STD_LOGIC;
           switch: in STD_LOGIC;
           switch_2: in STD_LOGIC;
           HS : out STD_LOGIC;
           VS : out STD_LOGIC;
           RED : out STD_LOGIC_VECTOR (3 downto 0);
           GRN : out STD_LOGIC_VECTOR (3 downto 0);
           BLU : out STD_LOGIC_VECTOR (3 downto 0));
end Top_proyecto;

architecture Behavioral of Top_proyecto is
-- DECLARACIÓN DE COMPONENTES
component dibuja 
    Port ( eje_x : in STD_LOGIC_VECTOR (9 downto 0);
           eje_y : in STD_LOGIC_VECTOR (9 downto 0);
           solucion: in STD_LOGIC;
           data: in STD_LOGIC_VECTOR (11 downto 0);
           data_pos: in STD_LOGIC_VECTOR (4 downto 0);
           RED : out STD_LOGIC_VECTOR (3 downto 0);
           GRN : out STD_LOGIC_VECTOR (3 downto 0);
           BLU : out STD_LOGIC_VECTOR (3 downto 0);
           addr_sprites: out STD_LOGIC_VECTOR (14 downto 0);
           addr_pos: out STD_LOGIC_VECTOR (5 downto 0)
           );
end component;

component vga_driver 
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
           BLU : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

component Memoria_Sprites
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
end component;

component Memoria_Mensajes
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
end component;

component Memoria_Letras
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
end component;

component Memoria_Numeros IS
  PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
end component;

component Memoria_Tablero
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
  end component;
  
component Juego
    PORT (
        up : in STD_LOGIC;
        down : in STD_LOGIC;
        right : in STD_LOGIC;
        left : in STD_LOGIC;
        refresh: in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR (4 downto 0);
        data_sol : in STD_LOGIC_VECTOR (1 downto 0);
        switch: in STD_LOGIC;
        switch_2: in STD_LOGIC;
        modo: out STD_LOGIC;
        solucion: out STD_LOGIC;
        we : out STD_LOGIC_VECTOR (0 downto 0);
        cuenta_mov:out STD_LOGIC;
        addr_sol : out STD_LOGIC_VECTOR (7 downto 0);
        addr : out STD_LOGIC_VECTOR (5 downto 0);
        addr_fase : out STD_LOGIC_VECTOR (7 downto 0);
        lect_fase: out STD_LOGIC;
        fin_fase : out STD_LOGIC;
        fin_juego : out STD_LOGIC;
        select_mode: out STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (4 downto 0)
   );
end component;

component Memoria_Fases IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END component;

component Memoria_Soluciones IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END component;

component top_contador IS
  PORT ( clk : in STD_LOGIC;
           enable: in STD_LOGIC;
           mode: in STD_LOGIC;
           reset : in STD_LOGIC;
           Dec_min : out STD_LOGIC_VECTOR (3 downto 0);
           Uds_min : out STD_LOGIC_VECTOR (3 downto 0);
           Dec_seg : out STD_LOGIC_VECTOR (3 downto 0);
           Uds_seg : out STD_LOGIC_VECTOR (3 downto 0)
           );
END component;

component contador_movimientos IS
  PORT ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR (3 downto 0);
           sat : out STD_LOGIC
           );
END component;

component mux_sprites IS
  PORT ( data_sprites : in STD_LOGIC_VECTOR (11 downto 0);
           data_sprites_letras : in STD_LOGIC_VECTOR (0 downto 0);
           fin_fase : in STD_LOGIC;
           data_tab : in STD_LOGIC_VECTOR (4 downto 0);
           data_letras : in STD_LOGIC_VECTOR (3 downto 0);
           eje_x : in STD_LOGIC_VECTOR (9 downto 0);
           eje_y : in STD_LOGIC_VECTOR (9 downto 0);
           data_numeros : in STD_LOGIC_VECTOR (0 downto 0);
           uds_seg : in STD_LOGIC_VECTOR (3 downto 0);
           dec_seg : in STD_LOGIC_VECTOR (3 downto 0);
           uds_min : in STD_LOGIC_VECTOR (3 downto 0);
           dec_min : in STD_LOGIC_VECTOR (3 downto 0);
           modo : in STD_LOGIC;
           select_mode : in STD_LOGIC;
           uds_mov : in STD_LOGIC_VECTOR (3 downto 0);
           dec_mov : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0);
           data_pos : out STD_LOGIC_VECTOR (4 downto 0)
           );
END component;

component logica_fin_tiempo IS
  PORT ( uds_seg : in STD_LOGIC_VECTOR (3 downto 0);
           dec_seg : in STD_LOGIC_VECTOR (3 downto 0);
           uds_min : in STD_LOGIC_VECTOR (3 downto 0);
           dec_min : in STD_LOGIC_VECTOR (3 downto 0);
           modo : in STD_LOGIC;
           fin_tiempo : out STD_LOGIC
           );
END component;

--SEÑALES
signal eje_x_s,eje_y_s: STD_LOGIC_VECTOR (9 downto 0);
signal refresh_s, fin_fase_s, fin_juego_s,lee_fase_s,select_mode_s,modo_s,solucion_s,enable_s,reset_s,reset_juego,reset_mov,fin_tiempo_s,cuenta_mov_s,sat_uds_s: STD_LOGIC;
signal RED_s,BLU_S,GRN_s,data_letras_s,uds_seg_s,dec_seg_s,uds_min_s,dec_min_s,dec_mov_s,uds_mov_s: STD_LOGIC_VECTOR (3 downto 0);
signal data_s,data_sprites_s: STD_LOGIC_VECTOR (11 downto 0);
signal data_sprites_letras_s,data_numeros_s,we_s: std_logic_vector(0 downto 0);
signal data_tab_s,data_tab_juego_s,data_pos_s,data_in_juego_s, data_out_juego_s,data_fase_s: STD_LOGIC_VECTOR (4 downto 0);
signal addr_sprites_s: STD_LOGIC_VECTOR (14 downto 0);
signal addr_letras_s,addr_fase_s,addr_sol_s: STD_LOGIC_VECTOR (7 downto 0);
signal addr_pos_s,addrjuego_s: STD_LOGIC_VECTOR (5 downto 0);
signal data_sol_s: STD_LOGIC_VECTOR(1 downto 0);

begin
--INSTANCIAS DE COMPONENTES
draw: dibuja
port map(
    eje_x => eje_x_s,
    eje_y =>eje_y_s,
    solucion => solucion_s,
    data => data_s,
    data_pos => data_pos_s,
    RED =>RED_s,
    GRN =>GRN_s,
    BLU =>BLU_s,
    addr_sprites => addr_sprites_s,
    addr_pos => addr_pos_s
);

driverVGA: vga_driver
port map(
    clk => clk,
    reset => reset,
    RED_in =>RED_s,
    GRN_in =>GRN_s,
    BLU_in =>BLU_s,
    eje_x =>eje_x_s,
    eje_y =>eje_y_s,
    refresh => refresh_s, 
    HS => HS, 
    VS => VS,
    RED =>RED,
    GRN =>GRN,
    BLU =>BLU
);

sprites: Memoria_Sprites
port map(
    clka => clk,
    addra => addr_sprites_s,
    douta => data_sprites_s
);

tablero: Memoria_Tablero
port map(
        clka => clk,
        wea => we_s,
        addra => addrjuego_s,
        dina => data_out_juego_s,
        douta => data_tab_juego_s,
        clkb => clk,
        addrb => addr_pos_s,
        dinb => "00000",
        web => "0",
        doutb => data_tab_s
);

fases: Memoria_Fases
port map(
        clka => clk,
        addra => addr_fase_s,
        douta => data_fase_s
);

soluciones: Memoria_Soluciones
port map(
        clka => clk,
        addra => addr_sol_s,
        douta => data_sol_s
);

mensajes: Memoria_Mensajes
port map(
        clka => clk,
        addra => addr_letras_s,
        douta => data_letras_s
);

letras: Memoria_Letras
port map(
        clka => clk,
        addra => addr_sprites_s(13 downto 0),
        douta => data_sprites_letras_s
);

numeros: Memoria_Numeros
port map(
        clka => clk,
        addra => addr_sprites_s(13 downto 0),
        douta => data_numeros_s 
);

contador_tiempos: top_contador
port map(
        clk => clk,
        enable => enable_s,
        mode => modo_s,
        reset => reset_s,
        Dec_min => dec_min_s,
        Uds_min => uds_min_s,
        Dec_seg => dec_seg_s,
        Uds_seg=> uds_seg_s
);

cont_mov_uds: contador_movimientos
port map(
        clk => clk,
        enable => cuenta_mov_s,
        sat => sat_uds_s,
        reset => reset_mov,
        cuenta => uds_mov_s
);

cont_mov_dec: contador_movimientos
port map(
        clk => clk,
        enable => sat_uds_s,
        sat => OPEN,
        reset => reset_mov,
        cuenta => dec_mov_s
);

Gestor_juego: Juego
port map(
        up => up,
        down => down,
        right => right,
        left => left,
        refresh => refresh_s,
        clk => clk,
        reset => reset_juego,
        data_in => data_in_juego_s,
        data_sol => data_sol_s,
        we => we_s,
        switch => switch,
        switch_2 => switch_2,
        modo => modo_s,
        solucion => solucion_s,
        addr => addrjuego_s,
        addr_sol => addr_sol_s,
        addr_fase => addr_fase_s,
        lect_fase => lee_fase_s,
        cuenta_mov => cuenta_mov_s,
        fin_fase => fin_fase_s,
        fin_juego => fin_juego_s,
        select_mode => select_mode_s,
        data_out => data_out_juego_s
);

Gestor_sprites: mux_sprites
port map(
           data_sprites => data_sprites_s,
           data_sprites_letras => data_sprites_letras_s,
           fin_fase => fin_fase_s,
           data_tab => data_tab_s,
           data_letras => data_letras_s,
           eje_x => eje_x_s,
           eje_y => eje_y_s,
           data_numeros => data_numeros_s,
           uds_seg => uds_seg_s,
           dec_seg => dec_seg_s,
           uds_min => uds_min_s,
           dec_min => dec_min_s,
           modo => modo_s,
           select_mode => select_mode_s,
           uds_mov => uds_mov_s,
           dec_mov => dec_mov_s,
           data => data_s,
           data_pos => data_pos_s 
);

Gestor_fin_tiempo: logica_fin_tiempo
port map(
           uds_seg => uds_seg_s,
           dec_seg => dec_seg_s,
           uds_min => uds_min_s,
           dec_min => dec_min_s,
           modo => modo_s,
           fin_tiempo => fin_tiempo_s
);


multiplexor_juego: process(lee_fase_s, data_fase_s, data_tab_juego_s)
begin
if(lee_fase_s='1') then
    data_in_juego_s <= data_fase_s;
else data_in_juego_s <= data_tab_juego_s;
end if;
end process;

enable_s <= fin_fase_s or select_mode_s;
reset_s <= fin_juego_s or select_mode_s or fin_tiempo_s;
reset_juego <= reset or fin_tiempo_s;
reset_mov <= reset or fin_fase_s or reset_s;
addr_letras_s <= select_mode_s & fin_juego_s & addr_pos_s;

end Behavioral;


