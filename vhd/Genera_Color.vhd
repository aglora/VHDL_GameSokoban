library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity gen_color is
    Port ( blank_h : in STD_LOGIC;
           blank_v : in STD_LOGIC;
           RED_in : in STD_LOGIC_VECTOR (3 downto 0);
           GRN_in : in STD_LOGIC_VECTOR (3 downto 0);
           BLU_in : in STD_LOGIC_VECTOR (3 downto 0);
           RED : out STD_LOGIC_VECTOR (3 downto 0);
           GRN : out STD_LOGIC_VECTOR (3 downto 0);
           BLU : out STD_LOGIC_VECTOR (3 downto 0));
end gen_color;

architecture Behavioral of gen_color is

begin

gen_color:process(Blank_H, Blank_V, RED_in, GRN_in,BLU_in)
begin
    if (Blank_H='1' or Blank_V='1') then
        RED<=(others => '0'); 
        GRN<=(others => '0');
        BLU<=(others => '0');
    else
        RED<=RED_in; 
        GRN<=GRN_in; 
        BLU<=BLU_in;
    end if;
end process;
end Behavioral;
