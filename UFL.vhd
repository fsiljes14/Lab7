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
           s(i) <= a(i) and b(i) when sel="00" else
                   a(i) or b(i) when sel="01" else
                   a(i) xor b(i) when sel="10" else
                   not(a(i));
        end loop;
   end process;
end behavioral;
