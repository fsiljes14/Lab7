-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/28/2021 09:33:35"
                                                            
-- Vhdl Test Bench template for design  :  ALU5bits
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
USE ieee.numeric_std.all;                              

ENTITY ALU5bits_vhd_tst IS
END ALU5bits_vhd_tst;
ARCHITECTURE ALU5bits_arch OF ALU5bits_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL ov : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT ALU5bits
	PORT (
	a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	ov : OUT STD_LOGIC;
	s : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ALU5bits
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	ov => ov,
	s => s,
	sel => sel
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
for k in 0 to 7 loop
	sel <= std_logic_vector(to_unsigned(k, 3));
	for i in -16 to 15 loop
		a <= std_logic_vector(to_signed(i, 5));
		for j in -16 to 15 loop
			b <= std_logic_vector(to_signed(j, 5));
			wait for 100 ns;
			if sel = "000" then
				assert s = (a and b)
					report "Error en el AND" severity failure;
			end if;
			if sel = "001" then
				assert s = (a or b)
					report "Error en la OR" severity failure;
			end if;
			if sel = "010" then
				assert s = (a xor b)
					report "Error en la XOR" severity failure;
			end if;
			if sel = "011" then
				assert s = not(a)
					report "Error en la NOT" severity failure;
			end if;
			if sel = "100" then
				if (i+j > 15) or (i+j < -16) then
					assert ov = '1'
						report "Error en el overflow de la suma"
						severity failure;
				else
					assert signed(s) = i+j
						report "Error en la suma"
						severity failure;
				end if;
			end if;
			if sel = "101" then
				if (i-j > 15) or (i-j < -16) then
					assert ov = '1'
						report "Error en el overflow de la resta"
						severity failure;
				else
					assert signed(s) = i-j
						report "Error en la resta"
						severity failure;
				end if;
			end if;
			if sel = "110" then
				if (i+1 > 15) or (i+1 < -16) then
					assert ov = '1'
						report "Error en el overflow del incremento"
						severity failure;
				else
					assert signed(s) = i+1 report "Error en el incremento"
						severity failure;
				end if;
			end if;
			if sel = "111" then
				if (i*j > 15) or (i*j < -16) then
					assert ov = '1'
						report "Error en el overflow de la multiplicación"
						severity failure;
				else
					assert signed(s) = i*j
						report "Error en la multiplicación"
						severity failure;
				end if;
			end if;
		end loop;
	end loop;
end loop;

WAIT;                                                        
END PROCESS always;                                          
END ALU5bits_arch;
