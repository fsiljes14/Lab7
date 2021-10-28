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
    p_logic : process(a,b,sel)
    begin
        for : or i in 0 to 4 loop
           case sel is        
              when "00" => s(i) <= a(i) and b(i);
              when "01" => s(i) <= a(i) or b(i);
              when "10" => s(i) <= a(i) xor b(i);              
              when others => not(a(i));        
           end case;
        end loop;
   end process;

end behavioral;
