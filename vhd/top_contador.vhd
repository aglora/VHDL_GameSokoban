library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_contador is
    Port ( clk : in STD_LOGIC;
           enable: in STD_LOGIC;
           reset : in STD_LOGIC;
           mode: in STD_LOGIC;
           Dec_min : out STD_LOGIC_VECTOR (3 downto 0);
           Uds_min : out STD_LOGIC_VECTOR (3 downto 0);
           Dec_seg : out STD_LOGIC_VECTOR (3 downto 0);
           Uds_seg : out STD_LOGIC_VECTOR (3 downto 0));
end top_contador;

architecture Behavioral of top_contador is
--SEÑALES
signal s_en_uds_seg, s_en_dec_seg, s_en_uds_min, s_en_dec_min, s_en_reg_desp: STD_LOGIC;
signal sat_uds_seg, sat_dec_seg, sat_uds_min: STD_LOGIC;
--COMPONENTES
component div_frec_4
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sat : out STD_LOGIC);
end component;
component cont_digito_10
    Generic(
        N : std_logic_vector(3 downto 0)
    );
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           mode: in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR (3 downto 0);
           sat : out STD_LOGIC);
end component;
component cont_digito_6
    Generic(
        N : std_logic_vector(3 downto 0)
    );
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           mode: in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR (3 downto 0);
           sat : out STD_LOGIC);
end component;
begin
ins_div_frec: div_frec_4
PORT MAP( clk=>clk,
        reset=>enable,
        sat=>s_en_uds_seg);
ins_cont_digito_uds_seg: cont_digito_10
GENERIC MAP (
    N => "0000"
    )
PORT MAP( clk=>clk,
        reset=>reset,
        mode => mode,
        enable=>s_en_uds_seg,
        cuenta=>uds_seg,
        sat=>sat_uds_seg);
ins_cont_digito_dec_seg: cont_digito_6
GENERIC MAP (
    N => "0011"
    )
PORT MAP( clk=>clk,
        reset=>reset,
        mode=> mode,
        enable=>s_en_dec_seg,
        cuenta=>dec_seg,
        sat=>sat_dec_seg);
ins_cont_digito_uds_min: cont_digito_10
GENERIC MAP (
    N => "0001"
    )
PORT MAP( clk=>clk,
        reset=>reset,
        mode=> mode,
        enable=>s_en_uds_min,
        cuenta=>uds_min,
        sat=>sat_uds_min);
ins_cont_digito_dec_min: cont_digito_6
GENERIC MAP (
    N => "0000"
    )
PORT MAP( clk=>clk,
        reset=>reset,
        mode => mode,
        enable=>s_en_dec_min,
        cuenta=>dec_min,
        sat=>OPEN);

s_en_dec_seg<=sat_uds_seg AND s_en_uds_seg;
s_en_uds_min<=sat_dec_seg AND s_en_dec_seg;
s_en_dec_min<=sat_uds_min AND s_en_uds_min;

end Behavioral;
