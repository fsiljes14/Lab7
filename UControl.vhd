-- Unidad de control

library ieee;
use ieee.std_logic_1164.all;

entity UControl is
	port(
			sel : in std_logic_vector(2 downto 0);
			sel_s : out std_logic_vector(1 downto 0);
			sel_ov : out std_logic;
			s_r : out std_logic;
			sel_b : out std_logic;
			sel_log : out std_logic_vector(1 downto 0));
end UControl;

architecture behavioral of UControl is

begin
	with sel select
		sel_s<=
			"00" when "000",
			"00" when "001",
			"00" when "010",
			"00" when "011",
			"10" when "100",
			"10" when "101",
			"10" when "110",
			"01" when "111",
			"--" when others;
	sel_ov<= sel(0) and sel(1);
	s_r<= sel(0);
	sel_b<= sel(1);
	sel_log<= sel(1 downto 0);
			
end behavioral;