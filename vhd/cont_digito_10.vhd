library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cont_digito_10 is
    generic(
        N: unsigned(3 downto 0)
        ); 
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           mode: in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR (3 downto 0);
           sat : out STD_LOGIC);
end cont_digito_10;

architecture Behavioral of cont_digito_10 is
signal s_cuenta,p_cuenta: unsigned(3 DOWNTO 0);
begin
sync: process(clk)
begin
if(rising_edge(clk)) then
    s_cuenta<=p_cuenta;
end if;
end process;

comb: process(s_cuenta,reset,enable,mode)
begin
p_cuenta<=s_cuenta;
sat <= '0';

if(reset='1') then
    case mode is
        when '0' =>
            p_cuenta<=(others=>'0');
        when '1' =>
            p_cuenta<= N;
    end case;
elsif(enable='1') then
    case mode is
        when '0' => --modo ascendente: cuenta hacia adelante de 1 en 1 
                if(s_cuenta="1001") then
                    p_cuenta <= (others => '0');
                    sat <='1';
                else
                    p_cuenta <= s_cuenta+1;

                end if;
        when '1' => --modo descendente: cuenta hacia atrás de 1 en 1
                if(s_cuenta="0000") then
                    sat <= '1';
                    p_cuenta <= "1001";
                else
                    p_cuenta <= s_cuenta-1;
                end if;
        end case;
end if;
end process;

cuenta<=STD_LOGIC_VECTOR(s_cuenta);
end Behavioral;

