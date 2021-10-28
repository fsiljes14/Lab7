-- MuxSel overflow

library ieee;
use ieee.std_logic_1164.all;

entity MuxSel_ov is
	port(
		ov1: in std_logic;
		ov2: in std_logic;
		sel_ov: in std_logic;
		ov: out std_logic);
end MuxSel_ov;

architecture behavioral of MuxSel_ov is

begin
	
	with sel_ov select
			ov <= ov1 when '0',
					ov2 when '1',
					'0' when others;
end behavioral;