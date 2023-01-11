library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
    Generic (Nbit: INTEGER := 8);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           resets : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (Nbit-1 downto 0));
end contador;

architecture Behavioral of contador is
signal count, p_count: UNSIGNED(Nbit-1 downto 0);

begin
sinc:process(clk)
begin
	if (rising_edge(clk)) then
		count <= p_count;
	end if;
end process;

comb: process(count,reset,resets, enable)
begin
    if (reset ='1' or resets = '1') then
        p_count <= (others => '0');
    elsif (enable = '1') then
        p_count <= count + 1;
    else
        p_count <= count;
    end if;
end process;

Q <= STD_LOGIC_VECTOR(count);

end Behavioral;