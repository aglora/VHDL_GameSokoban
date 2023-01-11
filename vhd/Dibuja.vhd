library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dibuja is
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
end dibuja;

architecture Behavioral of dibuja is
signal eje_x_s,eje_y_s: unsigned(9 downto 0);
begin

dibuja: process(eje_x, eje_y,data,solucion)
 begin
    RED<="0000"; GRN<="0000"; BLU<="0000";
    if(unsigned(eje_x) >= 0 and unsigned(eje_x) < 256 and unsigned(eje_y) >= 0 and unsigned(eje_y) < 256) then -- TABLERO
        RED <= data (11 downto 8);
        GRN <= data (7 downto 4);
        BLU <= data (3 downto 0);
    elsif(unsigned(eje_x) >= 32 and unsigned(eje_x) < 192 and unsigned(eje_y) >= 288 and unsigned(eje_y) < 320) then --CONTADOR TIEMPO
        RED <= data (11 downto 8);
        GRN <= data (7 downto 4);
        BLU <= data (3 downto 0);
    elsif(unsigned(eje_x) >= 288 and unsigned(eje_x) < 480 and unsigned(eje_y) >= 32 and unsigned(eje_y) < 64) then --MODO DIFICULTAD
        RED <= data (11 downto 8);
        GRN <= data (7 downto 4);
        BLU <= data (3 downto 0);
    elsif(unsigned(eje_x) >= 288 and unsigned(eje_x) < 512 and unsigned(eje_y) >= 96 and unsigned(eje_y) < 128) then --CONTADOR MOVIMIENTOS
        RED <= data (11 downto 8);
        GRN <= data (7 downto 4);
        BLU <= data (3 downto 0);   
    elsif(solucion='1' and unsigned(eje_x) >= 288 and unsigned(eje_x) < 384 and unsigned(eje_y) >= 160 and unsigned(eje_y) < 192) then --MODO SOLUCION
        RED <= data (11 downto 8);
        GRN <= data (7 downto 4);
    end if;
end process;

addr_sprites <= data_pos & eje_y(4 downto 0) & eje_x(4 downto 0);
addr_pos <= eje_y(7 downto 5) & eje_x(7 downto 5);


end Behavioral;