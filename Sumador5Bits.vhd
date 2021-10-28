-- Sumador 5 bits
library ieee;
use ieee.std_logic_1164.all;

entity Sumador5Bits is
port(
		a: in std_logic_vector(4 downto 0);
		b: in std_logic_vector(4 downto 0);
		s: out std_logic_vector(4 downto 0);
		c_out: out std_logic);
end Sumador5Bits;
architecture structural of Sumador5Bits is
	signal c: std_logic_vector(5 downto 0);
	component Sumador1Bit
	port(
			a_i: in std_logic;
			b_i: in std_logic;
			c_i: in std_logic;
			s_i: out std_logic;
			c_i_mas_1: out std_logic);
	end component;
	begin
	c(0)<='0';
	c_out<=c(5);
	GenSum: for i in 0 to 4 generate
		i_Sumador1Bit: Sumador1Bit
		port map(
					a_i=>a(i),
					b_i=>b(i),
					c_i=>c(i),
					s_i=>s(i),
					c_i_mas_1=>c(i+1));
	end generate GenSum;
end structural;
