-- Sumador1Bit

library ieee;
use ieee.std_logic_1164.all;

entity Sumador1Bit is
port(
		a_i: in std_logic;
		b_i: in std_logic;
		c_i: in std_logic;
		s_i: out std_logic;
		c_i_mas_1: out std_logic);
end Sumador1Bit;
architecture behavioral of Sumador1Bit is
begin 
s_i<=(a_i xor b_i) xor c_i;
c_i_mas_1<=(a_i and b_i) or ((a_i xor b_i) and c_i);
end behavioral;