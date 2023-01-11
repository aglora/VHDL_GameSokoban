library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frec_pixel is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_pixel : out STD_LOGIC);
end frec_pixel;

architecture Behavioral of frec_pixel is
signal cuenta : unsigned(1 downto 0);
begin
    process(clk)
    begin
        clk_pixel <= '0';
        if(rising_edge(clk)) then
            if(reset='1') then
                cuenta <= (others => '0');
            else cuenta <= cuenta+1;
            end if;
            if(cuenta="11") then
                clk_pixel <= '1';
            end if;
        end if;
    end process;
end Behavioral;
