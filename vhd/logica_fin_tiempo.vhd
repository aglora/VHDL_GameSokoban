library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logica_fin_tiempo is
    Port ( uds_seg : in STD_LOGIC_VECTOR (3 downto 0);
           dec_seg : in STD_LOGIC_VECTOR (3 downto 0);
           uds_min : in STD_LOGIC_VECTOR (3 downto 0);
           dec_min : in STD_LOGIC_VECTOR (3 downto 0);
           modo : in STD_LOGIC;
           fin_tiempo : out STD_LOGIC);
end logica_fin_tiempo;

architecture Behavioral of logica_fin_tiempo is

begin

logica_fin_tiempo: process(uds_seg,dec_seg,uds_min,dec_min,modo)
begin
    if( (uds_seg="1001" and dec_seg="0101" and uds_min="1001" and dec_min="0101") and (modo='1') ) then
        fin_tiempo <= '1';
    else fin_tiempo <='0';
    end if;
end process;

end Behavioral;