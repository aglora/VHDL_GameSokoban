library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_sprites is
    Port ( data_sprites : in STD_LOGIC_VECTOR (11 downto 0);
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
           data_pos : out STD_LOGIC_VECTOR (4 downto 0));
end mux_sprites;

architecture Behavioral of mux_sprites is

begin

multiplexor_sprites: process(data_sprites , data_sprites_letras ,fin_fase ,data_tab ,data_letras ,eje_x ,eje_y ,data_numeros ,uds_seg ,dec_seg ,uds_min ,dec_min ,modo ,select_mode ,uds_mov ,dec_mov )
begin
if(unsigned(eje_y ) >= 288 and unsigned(eje_y ) < 320) then --CONTADOR DE TIEMPO
    data  <= data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros ;
    if(unsigned(eje_x ) >= 160)then
        data_pos  <= '0' & uds_seg ;  
    elsif(unsigned(eje_x ) >= 128)then
        data_pos  <= '0' & dec_seg ;
    elsif(unsigned(eje_x ) >= 96)then
        data_pos  <= "01010";
    elsif(unsigned(eje_x ) >= 64)then
        data_pos  <= '0' & uds_min ;         
    else data_pos  <= '0' & dec_min ;      
    end if;

elsif(unsigned(eje_x ) >= 288 and unsigned(eje_x ) < 416) then --Frases a la derecha del tablero
  data  <= data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras ;
  if(unsigned(eje_y ) < 64) then --MODE
    if(unsigned(eje_x ) < 320) then
        data_pos  <= '0' & "1001"; --M
    elsif(unsigned(eje_x ) < 352) then
        data_pos  <= '0' & "1010"; --O
    elsif(unsigned(eje_x ) < 384) then
        data_pos  <= '0' & "0011"; --D
    else data_pos  <= '0' & "0100"; --E
    end if;
  elsif(unsigned(eje_y ) < 128) then --STEP 
    if(unsigned(eje_x ) < 320) then
        data_pos  <= '0' & "1100"; --S
    elsif(unsigned(eje_x ) < 352) then
        data_pos  <= '0' & "1101"; --T
    elsif(unsigned(eje_x ) < 384) then
        data_pos  <= '0' & "0100"; --E
    else data_pos  <= '0' & "1011"; --P
    end if;
  else --SOL
    if(unsigned(eje_x ) < 320) then
        data_pos  <= '0' & "1100"; --S
    elsif(unsigned(eje_x ) < 352) then
        data_pos  <= '0' & "1010"; --O
    else data_pos  <= '0' & "1000"; --L
    end if;
  end if;
  
  
elsif (unsigned(eje_x ) >= 416 and unsigned(eje_x ) < 512) then     
    data  <= data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros  & data_numeros ;
    if(unsigned(eje_x ) < 448) then
        data_pos  <= '0' & "1010"; -- :
    else 
        if(unsigned(eje_y ) < 64) then
            data_pos  <= "0000" & modo ; -- 0 --> Normal mode | 1 --> Hard mode
        else 
            if(unsigned(eje_x ) < 480) then
                data_pos  <= '0' & dec_mov ;
            else data_pos  <= '0' & uds_mov ;   
            end if;
        end if;
    end if;

elsif(fin_fase ='1' or select_mode  = '1') then
    data  <= data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras  & data_sprites_letras ;
    data_pos  <= '0' & data_letras ;
else 
    data  <= data_sprites ;
    data_pos  <= data_tab ;
end if;
end process;


end Behavioral;
