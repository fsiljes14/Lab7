--Multiplicador5Bits usando bucles 
-- Practica6

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 


entity Multiplicador5Bits is
port (
	a, b : in std_logic_vector(4 downto 0); 
	s : out std_logic_vector(4 downto 0);
	ov : out std_logic);
end Multiplicador5Bits; 

architecture behavioral of Multiplicador5Bits is 
	signal prod : std_logic_vector(9 downto 0);
	begin
		prod<=std_logic_vector(signed(a)*signed(b));
		s<=prod(4 downto 0);
		ov <= '0' when prod(9 downto 4)="000000" or prod(9 downto 4)="111111"
				else '1';
end behavioral; 