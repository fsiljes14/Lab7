-- Unidad de funciones lógicas

library ieee;
use ieee.std_logic_1164.all;

entity UFL is
	port(
			sel : in std_logic_vector(1 downto 0);
			a : in std_logic_vector(4 downto 0);
			b : in std_logic_vector(4 downto 0);
			s : out std_logic_vector(4 downto 0));
end UFL;

architecture behavioral of UFL is

begin
	with sel select
		s<= 
			(a and b) when "00",
			(a or b) when "01",
			(a xor b) when "10",
			not(a) when "11",
			"00000" when others;
end behavioral;