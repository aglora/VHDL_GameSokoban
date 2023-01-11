library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_movimientos is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR (3 downto 0);
           sat : out STD_LOGIC);
end contador_movimientos;

architecture Behavioral of contador_movimientos is
signal s_cuenta,p_cuenta: unsigned(3 DOWNTO 0);
begin
sync: process(clk)
begin
if(rising_edge(clk)) then
    s_cuenta<=p_cuenta;
end if;
end process;

comb: process(s_cuenta,reset,enable)
begin
p_cuenta<=s_cuenta;
sat <= '0';

if(reset='1') then
    p_cuenta<=(others=>'0');
elsif(enable='1') then
     if(s_cuenta="1001") then
        p_cuenta <= (others => '0');
        sat <='1';
     else p_cuenta <= s_cuenta+1;
     end if;
end if;
end process;

cuenta<=STD_LOGIC_VECTOR(s_cuenta);
end Behavioral;
