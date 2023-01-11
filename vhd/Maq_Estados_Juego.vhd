library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Juego is
     Port ( up : in STD_LOGIC;
           down : in STD_LOGIC;
           right : in STD_LOGIC;
           left : in STD_LOGIC;
           refresh: in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           switch: in STD_LOGIC;
           switch_2: in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (4 downto 0);
           data_sol : in STD_LOGIC_VECTOR (1 downto 0);
           modo: out STD_LOGIC;
           solucion: out STD_LOGIC;
           we : out STD_LOGIC_VECTOR (0 downto 0);
           addr_fase : out STD_LOGIC_VECTOR (7 downto 0);
           addr_sol : out STD_LOGIC_VECTOR (7 downto 0);
           addr : out STD_LOGIC_VECTOR (5 downto 0);
           lect_fase: out STD_LOGIC;
		   fin_fase : out STD_LOGIC;
		   fin_juego : out STD_LOGIC;
		   cuenta_mov: out STD_LOGIC;
		   select_mode: out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (4 downto 0));
end Juego;

architecture Behavioral of Juego is

type tipo_estado is (start,espera_boton_start,lee_fase,espera_copia, copia_fase, reposo, espera_boton, lee_mov_sol, lee_destino, espera_lectura_sig, validar_mov,escribir_actual,
escribir_hueco_caja, lee_destino_caja,escribir_player,escribir_caja,espera_lectura_sig_caja,validar_mov_caja,inicializar_addr_teleport,inicializar_addr,
comprobar_fin,busca_teleport,espera_incr_teleport_1,espera_incr_teleport_2, inc_addr,inc_addr_teleport,fin);
type tipo_mov is (arriba,abajo,derecha,izquierda);

signal estado,p_estado: tipo_estado:=start;
signal mov, p_mov: tipo_mov;
signal pos_x,pos_y,p_pos_x,p_pos_y: unsigned (2 downto 0);
signal addr_s,p_addr_s,addr_copia: unsigned (5 downto 0):="000000";
--Utilizamos señales como flag para decidir hacia qué estados avanzar en función de los eventos ocurridos
signal flag_0,flag_1,flag_2,flag_3,flag_4,flag_5,flag_6,flag_7,flag_8,p_flag_0,p_flag_1,p_flag_2,p_flag_3,p_flag_4,p_flag_5,p_flag_6,p_flag_7,p_flag_8: boolean :=false;
signal fase,p_fase: unsigned(1 downto 0):="00";
signal cont, p_cont: unsigned(27 downto 0);
signal mode,p_mode,solution_mode,p_solution_mode: boolean := false; --True -> Hard mode | False -> Normal mode
signal cont_mov_sol, p_cont_mov_sol: unsigned(5 downto 0);

begin
 
    sinc:process(clk)
    begin
        if(rising_edge(clk)) then
            estado <= p_estado;
            pos_x <= p_pos_x;
            pos_y <= p_pos_y;
            fase <= p_fase;
            mov <= p_mov;
            flag_0 <= p_flag_0;
            flag_1 <= p_flag_1;
            flag_2 <= p_flag_2;
            flag_3 <= p_flag_3;
            flag_4 <= p_flag_4;
            flag_5 <= p_flag_5;
            flag_6 <= p_flag_6;
            flag_7 <= p_flag_7;
            flag_8 <= p_flag_8;
            addr_copia <= p_addr_s;
            cont <= p_cont;
            cont_mov_sol <= p_cont_mov_sol;
            mode <= p_mode;
            solution_mode <= p_solution_mode;
            
        end if;
    end process;
    
    comb:process(estado,reset, up, down, right, left, refresh, data_in, data_sol, fase, mov, pos_x, pos_y,flag_0,flag_1,flag_2,flag_3,flag_4,flag_5,flag_6,flag_7,flag_8,
    addr_copia,addr_s,cont,mode,switch, switch_2, solution_mode,cont_mov_sol,cont)
    
    begin
    
    if(reset='1') then
            if(mode) then --MODO DIFÍCIL
                p_fase <= "00"; --Comenzar por la fase inicial
                p_solution_mode <= false;
            else --MODO FÁCIL
                if(switch_2 = '1') then --MODO SOLUCIÓN
                    p_solution_mode <= true;
                else p_solution_mode <= false;
                end if;
                p_fase <= fase; --Continuar por la misma fase               
            end if;
            
            if(estado=start or estado=espera_boton_start) then --Si está en la pantalla de start, permanece en ella; si no, comienza de nuevo la fase
                p_estado <= estado;
            else p_estado <= lee_fase;
            end if;      
            
            p_addr_s <= "000000";
            p_pos_x <= "000";
            p_pos_y <= "000";
            p_mov <= mov;
            p_flag_0 <= false;
            p_flag_1 <= false;
            p_flag_2 <= false;
            p_flag_3 <= false;
            p_flag_4 <= false;
            p_flag_5 <= false;
            p_flag_6 <= false;
            p_flag_7 <= false;
            p_flag_8 <= false;
            we <= "0";
            addr <= "000000";
            addr_s <= "000000";
            addr_fase <= "00000000";
            data_out <= "00000";
            lect_fase <='0';
            fin_fase <= '0';
		    fin_juego <= '0';
		    p_cont <= (others=>'0');
		    p_cont_mov_sol <= (others=>'0');
		    p_mode <= mode;
		    select_mode <= '0';
		    cuenta_mov <= '0';
		    addr_sol <= "00000000";
		    
    else --Damos valores por defecto a las salidas y señales para no tener que hacerlo en todos los estados
        p_estado <= estado;
        p_addr_s <= addr_copia;
        p_pos_x <= pos_x;
        p_pos_y <= pos_y;
        p_fase <= fase;
        p_mov <= mov;
        p_flag_0 <= flag_0;
        p_flag_1 <= flag_1;
        p_flag_2 <= flag_2;
        p_flag_3 <= flag_3;
        p_flag_4 <= flag_4;
        p_flag_5 <= flag_5;
        p_flag_6 <= flag_6;
        p_flag_7 <= flag_7;
        p_flag_8 <= flag_8;
        we <= "0";
        addr <= std_logic_vector(addr_s);
        addr_s <= pos_y & pos_x;
        addr_fase <= "00000000";
        data_out <= "00100";
        lect_fase <='0';
        fin_fase <= '0';
        fin_juego <= '0';
        p_cont <= (others=>'0');
        p_cont_mov_sol <= cont_mov_sol;
        p_mode <= mode;
        p_solution_mode <= solution_mode;
        select_mode <= '0';
        cuenta_mov <= '0';
        addr_sol <= "00000000";
        
        case estado is
            when start => --Pantalla de start
                select_mode <= '1';
                if(switch='1') then
                    p_mode <= true;
                else p_mode <= false;
                end if;
                if((up='1' or down='1' or left='1' or right='1')and refresh='1') then
                    p_estado <= espera_boton_start;    
                end if;
            
            when espera_boton_start => --Espera a que suelte el botón
                select_mode <= '1';
                if(up='0' and down='0' and left='0' and right='0' and refresh='1') then
                    p_estado <= lee_fase;
                    if(switch='1') then --Seguimos leyendo el switch por si se cambia el modo mientras que el botón está pulsado
                        p_mode <= true;
                    else p_mode <= false;
                    end if;
                end if;   
                
            when lee_fase => --Lectura de la memoria de fases
                lect_fase <='1';
                addr_fase <= STD_LOGIC_VECTOR(fase) & STD_LOGIC_VECTOR(addr_copia);
                p_estado <= espera_copia;

            when espera_copia => --Espera un ciclo de reloj para que el valor leído se actualice
                lect_fase <='1';
                p_estado <= copia_fase;
                addr_fase <= STD_LOGIC_VECTOR(fase) & STD_LOGIC_VECTOR(addr_copia);
            
            when copia_fase => --Copia el valor leído de la memoria de fases en el tablero, e incrementa la dirección cuyos datos se desean copiar
                lect_fase <='1';
                we <= "1";
                addr <= STD_LOGIC_VECTOR(addr_copia);
                data_out <= data_in;
                if (data_in="00000") then --Si el dato leído es el jugador, guarda esa dirección en las variables de posición
                    p_pos_x <= addr_copia(2 downto 0);
                    p_pos_y <= addr_copia(5 downto 3);
                end if;
                p_addr_s <= addr_copia+1;
                if (addr_copia=63) then --Cuando se termine de recorrer el tablero, se pasa a reposo
                    p_estado <= reposo;
                else p_estado <= lee_fase;
                end if;
                                
            when reposo => --Espera a que se pulse algún botón
              if(solution_mode) then --Si está en modo solución, espera medio segundo y lee de la memoria de soluciones
                addr_sol <= STD_LOGIC_VECTOR(fase) & STD_LOGIC_VECTOR(cont_mov_sol);
                p_cont <= cont+1;
                if(cont = 50000000) then
                    p_estado <= lee_mov_sol;
                end if;
              else --Si no está en modo solución espera a que se pulse un botón y se de un 'refresh'
                if(refresh='1' and (up='1' or down='1' or right='1' or left='1') ) then
                    p_estado <= espera_boton;
                end if;
              end if;
                    
            when espera_boton => --Espera a que se suelte el botón pulsado, además de esperar otro 'refresh', y actualiza el próximo movimiento según el botón pulsado
              if(refresh='1') then
                if(up='1') then
                    p_mov <= arriba;
                elsif(down='1') then
                    p_mov <= abajo;
                elsif(right='1') then
                    p_mov <= derecha;
                elsif(left='1') then
                    p_mov <= izquierda;
                else p_estado <= lee_destino;
                end if;
              end if;
             
            when lee_mov_sol => --Actualiza el próximo movimiento según el dato leído de la memoria de soluciones
                if(data_sol = "00") then
                    p_mov <= arriba;
                elsif(data_sol = "01") then
                    p_mov <= derecha;
                elsif(data_sol = "10") then
                    p_mov <= abajo;
                else p_mov <= izquierda;
                end if;
                p_estado <= lee_destino;
                p_cont_mov_sol  <= cont_mov_sol +1;
                
            when lee_destino => --Lee lo que hay en la dirección de destino del jugador
                case mov is
                    when arriba =>
                        addr_s <= (pos_y-1) & pos_x;
                    when abajo =>
                        addr_s <= (pos_y+1) & pos_x;
                    when derecha =>
                        addr_s <= pos_y & (pos_x+1);
                    when izquierda =>
                        addr_s <= pos_y & (pos_x-1);
                end case;
                p_estado <= espera_lectura_sig;
                
            when espera_lectura_sig => --Espera un ciclo de reloj a que se actualice el valor leído
                p_estado <= validar_mov;
                
            when validar_mov => --Compruebo lo que hay en la casilla de destino
                if(data_in="00111") then --MURO
                    p_estado <= reposo;
                
                elsif(data_in="00100") then --FONDO
                    p_estado <= escribir_actual;
                
                elsif(data_in="00101") then --CASILLA OBJETIVO
                    p_estado <= escribir_actual;
                    p_flag_0 <= true;
                
                elsif(data_in="01001") then --HUECO VACÍO
                    p_estado <= reposo;
                
                elsif(data_in="01010") then --HUECO CON CAJA
                    p_flag_4 <= true;
                    p_estado <= escribir_actual;
                
                elsif(data_in="01011") then --CAJA SOBRE HUECO CON CAJA
                    p_estado <= lee_destino_caja;
                    p_flag_7 <= true;
                    
                elsif(data_in="00110") then --CAJA 
                    p_estado <= lee_destino_caja;
                
                elsif(data_in="01000") then --CAJA SOBRE OBJETIVO 
                    p_estado <= lee_destino_caja;
                    p_flag_3 <= true; 
                    
                elsif(data_in="10000") then --TELEPORT
                    p_estado <= escribir_actual;
                    p_flag_8 <= true;
                end if;
                
            when escribir_actual => --Borra el jugador de su posición actual, y escribe lo que corresponda
                we <= "1";
                if(data_in="01101" or data_in="01100" or data_in="01110" or data_in="01111") then --Si el jugador estaba sobre un hueco con caja
                    data_out <= "01010";
                elsif(data_in="10001" or data_in="10010" or data_in="10011" or data_in="10100") then --Si el jugador estaba sobre una casilla objetivo
                    data_out <="00101";
                elsif(data_in="10101") then --Si el jugador está sobre un teletransporte
                    data_out <="10000";
                else data_out <= "00100";
                end if;
                
                case mov is --Actualizar la posición del jugador
                    when arriba =>
                        p_pos_y <= pos_y-1;
                    when abajo =>
                        p_pos_y <= pos_y+1;
                    when derecha =>
                        p_pos_x <= pos_x+1;
                    when izquierda =>
                        p_pos_x <= pos_x-1;                                                                                       
                end case;
                if(flag_8) then --Si el jugador se dirigía a un teletransporte
                    p_estado <= inicializar_addr_teleport;
                else
                 p_estado <= escribir_player;
                end if;
           
           when inicializar_addr_teleport => --Incializa la dirección para buscar el teletransporte en el tablero
                p_addr_s <= (others=>'0');
                p_estado <= busca_teleport;
                addr <= std_logic_vector(addr_copia);
                
            when busca_teleport => --Recorremos la memoria y buscamos casillas de teleport
                addr <= std_logic_vector(addr_copia);
                   if(data_in = "10000") then --Si encuentra una casilla de teleport, y además esta no está en la posición del jugador, pasa a escribir el jugador en esa posición; si no, sigue buscando
                       if(addr_copia /= (pos_y & pos_x)) then
                            p_pos_x <= addr_copia(2 downto 0);
                            p_pos_y <= addr_copia(5 downto 3);
                            p_estado <= escribir_player;
                       else p_estado <= inc_addr_teleport;
                       end if;
                   else p_estado <= inc_addr_teleport;
                   end if; 
            
            when inc_addr_teleport => --Incrementa la dirección de lectura del tablero para buscar la casilla de teleport
                addr <= std_logic_vector(addr_copia);
                p_addr_s <= addr_copia+1;
                p_estado <= espera_incr_teleport_1;
                
                
            when espera_incr_teleport_1 => --Espera un ciclo de reloj para la lectura del tablero
                p_estado <= espera_incr_teleport_2;
                addr <= std_logic_vector(addr_copia);
                
            when espera_incr_teleport_2 => --Espera un ciclo de reloj para la lectura del tablero
                p_estado <= busca_teleport;
                addr <= std_logic_vector(addr_copia);
                       
            when escribir_player => --Escribe el jugador en su nueva posición
                cuenta_mov <= '1';
                we <= "1";
                if(flag_4 or flag_7) then --Si el jugador se va a colocar sobre un hueco con caja
                    p_flag_7 <= false;
                    p_flag_4 <= false;
                    case mov is
                        when arriba =>
                            data_out <= "01101";
                        when abajo =>
                            data_out <= "01100";
                        when derecha =>
                            data_out <= "01110";
                        when izquierda =>
                            data_out <= "01111";                                                                                       
                    end case;
                
                elsif(flag_0 or flag_3) then --Si el jugador se va a colocar sobre la casilla objetivo
                    p_flag_3 <=false;
                    p_flag_0 <=false;
                    case mov is
                        when arriba =>
                            data_out <= "10010";
                        when abajo =>
                            data_out <= "10001";
                        when derecha =>
                            data_out <= "10011";
                        when izquierda =>
                            data_out <= "10100";                                                                                       
                    end case;
                
                elsif(flag_8) then --Si debo codificar el jugador sobre el teleport
                    data_out <= "10101";
                    p_flag_8 <=false;
                    
                else --Si el jugador se dirige a una casilla vacía normal
                    case mov is
                        when arriba =>
                            data_out <= "00001";
                        when abajo =>
                            data_out <= "00000";
                        when derecha =>
                            data_out <= "00010";
                        when izquierda =>
                            data_out <= "00011";                                                                                       
                    end case;
                end if;
                
                if(flag_1) then --Si se ha movido una caja
                    p_estado <= escribir_caja;
                else p_estado <= reposo;
                end if;
            
            when lee_destino_caja => --Lee la posición de destino de la caja que se pretende mover
                case mov is
                when arriba =>
                    addr_s <= (pos_y-2) & pos_x;
                when abajo =>
                    addr_s <= (pos_y+2) & pos_x;
                when derecha =>
                    addr_s <= pos_y & (pos_x+2);
                when izquierda =>
                    addr_s <= pos_y & (pos_x-2);
                end case;
                p_estado <= espera_lectura_sig_caja;
                
            when espera_lectura_sig_caja => --Espera un ciclo de reloj para la lectura del tablero
                p_estado <= validar_mov_caja;
            
            when validar_mov_caja => --Compruebo lo que hay en la casilla de destino de la caja (dos posiciones más allá del jugador)
                if(data_in="00111") then --MURO
                    p_estado <= reposo;
                    p_flag_3 <= false;
                    
                elsif(data_in="00100") then --FONDO
                    p_flag_1 <= true;
                    if(flag_4) then --Si el jugador está sobre un hueco con caja
                        p_estado <= escribir_hueco_caja;
                    elsif(flag_0) then  --Si el jugador está sobre la casilla objetivo
                        p_estado <= escribir_actual;
                    else p_estado <= escribir_actual; --Si el jugador está sobre una casilla de fondo (vacía)
                    end if;
                    
                elsif(data_in="00101") then --CASILLA OBJETIVO
                    p_flag_1 <= true;
                    p_flag_2 <= true;
                    if(flag_4) then --Si el jugador está sobre un hueco con caja
                        p_estado <= escribir_hueco_caja;
                    else p_estado <= escribir_actual; --Si el jugador está sobre una casilla de fondo (vacía)
                    end if;
                    
                elsif(data_in="01001") then --HUECO VACIO
                    p_flag_1 <= true;
                    p_flag_5 <= true;
                    if(flag_4) then --Si el jugador estaba sobre un hueco con caja
                        p_estado <= escribir_hueco_caja;
                    elsif(flag_0) then  --Si el jugador estaba sobre la casilla objetivo
                        p_estado <= escribir_actual;
                    else p_estado <= escribir_actual;
                    end if;
                    
                elsif(data_in="01010") then --HUECO CON CAJA
                    p_flag_1 <=true;
                    p_flag_6 <=true;
                     
                    if(flag_4) then --Si el jugador está en un hueco con caja
                        p_estado <= escribir_hueco_caja;
                    elsif(flag_0) then  --Si el jugador está sobre la casilla objetivo
                        p_estado <= escribir_actual;
                    else p_estado <= escribir_actual;
                    end if;
                
                elsif(data_in="00110" or data_in="01000" or data_in="01011") then --CAJA, CAJA SOBRE OBJETIVO O CAJA SOBRE HUECO CON CAJA
                    p_estado <= reposo;
                    p_flag_4 <= false;
                    p_flag_3 <= false;
                    
                elsif(data_in="10000") then --TELEPORT
                    p_estado <= reposo;
                    p_flag_3 <= false;
                    
                end if;
            
            when escribir_caja => --Escribe la caja en la casilla correspondiente
                we <= "1";
                p_flag_1 <= false;
                case mov is
                    when arriba =>
                        addr_s <= (pos_y-1) & pos_x;
                    when abajo =>
                        addr_s <= (pos_y+1) & pos_x;
                    when derecha =>
                        addr_s <= pos_y & (pos_x+1);
                    when izquierda =>
                        addr_s <= pos_y & (pos_x-1);
                end case;
                if(flag_2) then --Si se va a colocar la caja sobre el objetivo
                    data_out <= "01000";
                    p_flag_2 <= false;
                elsif(flag_5) then --Si se va a colocar la caja sobre un hueco vacío
                    data_out <= "01010";
                    p_flag_5 <= false;
                elsif(flag_6) then --Si se va a colocar la caja sobre un hueco con caja
                    data_out <= "01011";
                    p_flag_6 <= false;
                else data_out <= "00110"; --Caja sobre casilla vacía (fondo)
                end if;
                p_estado <= inicializar_addr;
                
            when escribir_hueco_caja => --Dibuja un hueco con caja donde antes estaba el jugador
                we <= "1";
                data_out <= "01010";
                p_flag_4 <= false;
                case mov is --Actualiza la posición del jugador para el siguiente estado
                    when arriba =>
                        p_pos_y <= pos_y-1;
                    when abajo =>
                        p_pos_y <= pos_y+1;
                    when derecha =>
                        p_pos_x <= pos_x+1;
                    when izquierda =>
                        p_pos_x <= pos_x-1;                                                                                       
                end case;
                p_estado <= escribir_player;
            
            when inicializar_addr => --Inicializa la dirección para recorrer el tablero después de mover una caja
                p_addr_s <= (others=>'0');
                p_estado <= comprobar_fin;
                addr <= std_logic_vector(addr_copia);
                
            when comprobar_fin => --Comprueba si quedan casillas objetivo en el tablero
                addr <= std_logic_vector(addr_copia);
                if(flag_0) then --Si el jugador está sobre una casilla objetivo, aún no hemos terminado la fase
                    p_estado <= reposo;
                else --Recorremos la memoria y si no hay ninguna casilla objetivo, se ha terminado la fase
                   if(data_in = "00101") then
                       p_estado <= reposo;
                   elsif(addr_copia = "111111") then
                       p_estado <= fin;
                   else p_estado <= inc_addr;
                   end if; 
                end if;
            
            when inc_addr => --Incrementa la dirección de lectura del tablero para comprobar si quedan casillas objetivo
                addr <= std_logic_vector(addr_copia);
                p_addr_s <= addr_copia+1;
                p_estado <= comprobar_fin;
            
            when fin => --Se ha terminado la fase
			 fin_fase <= '1';
			 p_cont_mov_sol <= (others=>'0');
			 if (fase= "11") then 
				fin_juego <= '1';
			 end if;
			 p_cont <= cont+1;
			 if (cont=268435455) then --Espera 2.68 segundos
			     if(NOT solution_mode) then --Si no estamos en modo solución, pasamos de fase; si estamos en modo solución, empezamos de nuevo la fase y quitamos el modo solución
               		p_fase <= fase+1;
               		   if(fase="11") then --Si hemos terminado la última fase, y por tanto, el juego, volvemos a la pantalla de start
               		       p_estado <= start;
               		   else p_estado <= lee_fase;
               		   end if;
                 else 
                        p_solution_mode <= false;
                        p_estado <= lee_fase;
               	 end if;
                 p_addr_s <= (others=>'0');
			 end if;
                                 
        end case;
    end if;    
    end process;

converter: process(mode,solution_mode) --Convertimos las señales mode y solution_mode a STD_LOGIC para poder usarlas como salidas
begin
    if(mode) then modo <='1';
    else modo <='0';
    end if;
    if(solution_mode) then solucion <= '1';
    else solucion <= '0';
    end if;
end process;
end Behavioral;