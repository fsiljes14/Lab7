-- Pract7

library ieee;
use ieee.std_logic_1164.all;

entity pract7 is
	port(
			a,b : in std_logic_vector(4 downto 0);
			sel : in std_logic_vector(2 downto 0);
			ov : out std_logic;
			s1,s2 : out std_logic_vector(6 downto 0));
	
end pract7;

architecture behavioral of pract7 is
	signal s_bina7seg : std_logic_vector(7 downto 0);
	component BinA7Seg
		port(
				hexad : in std_logic_vector(3 downto 0);
				disp7 : out std_logic_vector(6 downto 0));
	end component;
	component ALU5bits
		port(
				a,b : in std_logic_vector(4 downto 0);
				sel : in std_logic_vector(2 downto 0);
				s : out std_logic_vector(4 downto 0);
				ov : out std_logic);
	end component;
	
begin
	i_ALU5bits : ALU5bits
		port map(
					a=>a,
					b=>b,
					sel=>sel,
					ov=>ov,
					s=>s_bina7seg(4 downto 0));
					s_bina7seg(7 downto 5)<="000";
	i_BinA7Seg : BinA7Seg
		port map(
					hexad=>s_bina7seg(3 downto 0),
					disp7=>s1);
	i2_BinA7Seg : BinA7Seg
		port map(
					hexad=>s_bina7seg(7 downto 4),
					disp7=>s2);
end behavioral;
	