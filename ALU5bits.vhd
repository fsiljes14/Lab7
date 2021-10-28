-- ALU 5 BITS

library ieee;
use ieee.std_logic_1164.all;

entity ALU5bits is
	port(
			a,b : in std_logic_vector(4 downto 0);
			sel : in std_logic_vector(2 downto 0);
			s : out std_logic_vector(4 downto 0);
			ov : out std_logic);
end ALU5bits;

architecture structural of ALU5bits is
	signal ov_multip : std_logic;
	signal ov_sr : std_logic;
	signal s_r : std_logic;
	signal s1,s2,s3 : std_logic_vector(4 downto 0);
	signal sel_s : std_logic_vector(1 downto 0);
	signal sel_ov : std_logic;
	signal sel_log : std_logic_vector(1 downto 0);
	signal sel_b : std_logic;
	signal sm1 : std_logic_vector(4 downto 0);
	signal sfinal : std_logic_vector(4 downto 0);
	signal ovfinal : std_logic;
	
	component Multiplicador5Bits
		port(
			a, b : in std_logic_vector(4 downto 0); 
			s : out std_logic_vector(4 downto 0);
			ov : out std_logic);
	end component;
	
	component SumaResta
		port(
			a: in std_logic_vector(4 downto 0);
			b: in std_logic_vector(4 downto 0);
			s: out std_logic_vector(4 downto 0);
			s_r: in std_logic;
			ov: out std_logic);
	end component;
	
	component MuxSelectB
		port(
			b: in std_logic_vector(4 downto 0);
			s: out std_logic_vector(4 downto 0);
			sel_b: in std_logic);
	end component;
	
	component MuxSel_s
		port(
			s_log: in std_logic_vector(4 downto 0); -- Estas son las salidas de la unidad lÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â³gica, multiplexor y sumador/restador
			s_mul: in std_logic_vector(4 downto 0);
			s_sumaresta: in std_logic_vector(4 downto 0);
			sel_s: in std_logic_vector(1 downto 0);
			s: out std_logic_vector(4 downto 0));
	end component;
	
	component MuxSel_ov
		port(
			ov1: in std_logic;
			ov2: in std_logic;
			sel_ov: in std_logic;
			ov: out std_logic);
	end component;
	
	component UControl
		port(
			sel : in std_logic_vector(2 downto 0);
			sel_s : out std_logic_vector(1 downto 0);
			sel_ov : out std_logic;
			s_r : out std_logic;
			sel_b : out std_logic;
			sel_log : out std_logic_vector(1 downto 0));
	end component;
	
	component UFL
		port(
			sel : in std_logic_vector(1 downto 0);
			a : in std_logic_vector(4 downto 0);
			b : in std_logic_vector(4 downto 0);
			s : out std_logic_vector(4 downto 0));
	end component;
	
begin
	s<=sfinal;
	ov<=ovfinal;
	i_UFL : UFL
		port map(
					sel=>sel_log,
					a=>a,
					b=>b,
					s=>s1);
	
	i_Multip : Multiplicador5Bits
		port map(
					 a=>a,
					 b=>b,
					 s=>s2,
					 ov=>ov_multip);
	i_SumaResta : SumaResta
		port map(
					a=>a,
					b=>sm1,
					s_r=>s_r,
					ov=>ov_sr,
					s=>s3);
	i_Mux1 : MuxSelectB
		port map(
					b=>b,
					sel_b=>sel_b,
					s=>sm1);
	i_Mux2 : MuxSel_s
		port map(
					s_log=>s1,
					s_mul=>s2,
					s_sumaresta=>s3,
					sel_s=>sel_s,
					s=>sfinal);
	i_Mux3 : MuxSel_ov
		port map(
				ov1=>ov_multip,
				ov2=>ov_sr,
				sel_ov=>sel_ov,
				ov=>ovfinal);
end structural;