library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparador is
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
end comparador;

architecture Behavioral of comparador is
signal datos: UNSIGNED(Nbit-1 downto 0);

begin
datos <= unsigned(data);

sinc:process(clk)
begin
	if (rising_edge(clk)) then
	   	if (reset = '1') then
		  O1 <= '0';
		  O2 <= '0';
		  O3 <= '0';
	    elsif(datos > End_Of_Screen) then
		  O1 <= '1';
		else
		  O1 <= '0';
		end if;
		
		if((Start_Of_Pulse < datos) and (datos < End_Of_Pulse)) then
		  O2 <= '0';
		else
		  O2 <= '1';
		end if;
		
		if(datos = End_Of_Line) then
		  O3 <= '1';
		else
		  O3 <= '0';
		end if;
		
	end if;
end process;


end Behavioral;
