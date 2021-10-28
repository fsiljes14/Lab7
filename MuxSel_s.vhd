-- Segundo multiplexor

library ieee;
use ieee.std_logic_1164.all;

entity MuxSel_s is
port(
		s_log: in std_logic_vector(4 downto 0); -- Estas son las salidas de la unidad lógica, multiplexor y sumador/restador
		s_mul: in std_logic_vector(4 downto 0);
		s_sumaresta: in std_logic_vector(4 downto 0);
		sel_s: in std_logic_vector(1 downto 0);
		s: out std_logic_vector(4 downto 0));
end MuxSel_s;

architecture behavioral of MuxSel_s is

begin

	with sel_s select
			s <= 
				s_log when "00",
				s_mul when "01",
				s_sumaresta when "10",
				"00000" when others;
end behavioral;
				
	