library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div_frec_4 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sat : out STD_LOGIC
           );
end div_frec_4;

architecture Behavioral of div_frec_4 is
signal p_cuenta, cuenta : unsigned(26 DOWNTO 0);
begin
sync: process(clk)
begin
if(rising_edge(clk)) then
    cuenta<=p_cuenta;
end if;
end process;

comb: process(cuenta,reset)
begin
if(reset='1') then
    p_cuenta<=(others=>'0');
    sat<='0';
elsif(cuenta=100000000) then
    p_cuenta<=(others=>'0');
    sat <= '1';
else 
    p_cuenta<=cuenta+1;
    sat <= '0';
end if;
end process;
end Behavioral;
