-- Sumador/Restador 5 Bits usando sumador 5 Bits de la práctica 5

library ieee;
use ieee.std_logic_1164.all;

entity SumaResta is
port(
	a: in std_logic_vector(4 downto 0);
	b: in std_logic_vector(4 downto 0);
	s: out std_logic_vector(4 downto 0);
	s_r: in std_logic;
	ov: out std_logic);
end SumaResta;

architecture structural of SumaResta is
	
	signal c: std_logic_vector(5 downto 0);
	signal b_aux: std_logic_vector(4 downto 0);
	
	component Sumador1Bit
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			c_i: in std_logic;
			s_i: out std_logic;
			c_i_mas_1: out std_logic);
	end component;

begin
	c(0)<= s_r;
	ov<= c(5) xor c(4);
	
	GenSum: for i in 0 to 4 generate
		b_aux(i)<= b(i) xor s_r;
	i_Sumador1Bit : Sumador1Bit
	port map(
			a_i=>a(i),
			b_i=>b_aux(i),
			c_i=>c(i),
			s_i=>s(i),
			c_i_mas_1=>c(i+1));
	end generate GenSum;
end structural;
