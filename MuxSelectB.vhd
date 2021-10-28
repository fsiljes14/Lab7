-- Multiplexor seleccionador de B o "00001"

library ieee;
use ieee.std_logic_1164.all;

entity MuxSelectB is
port(
		b: in std_logic_vector(4 downto 0);
		s: out std_logic_vector(4 downto 0);
		sel_b: in std_logic);
end MuxSelectB;

architecture behavioral of MuxSelectB is
begin
	process(sel_b, b)
	begin
		if sel_b='0' then
			s<= b;
		elsif sel_b='1' then
			s<="00001";
		else
			null;
		end if;
	end process;
end behavioral;