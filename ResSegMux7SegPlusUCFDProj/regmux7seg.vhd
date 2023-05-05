----------------------------------------------------------------------------------
-- Company: Faculdade Engenheiro Salvador Arena
--
-- Engineers: Carlos Adonias
--			  	  Carlos Gonçalves
--			 	  Gabriel Teixeira
-- 		 	  Johnny Messias
--
-- Teacher: Filippo Valiante
-- Create Date:    14:11:25 03/11/2023 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regmux7seg is
    Port 
	 ( 
		INPUT : in  STD_LOGIC_VECTOR (3 downto 0);
      CLK : in  STD_LOGIC;
      EN1 : in  STD_LOGIC;
      EN2 : in  STD_LOGIC;
      EN3 : in  STD_LOGIC;
		SEL : in STD_LOGIC;
		CLR : in STD_LOGIC;
		OUTPUT: out STD_LOGIC_VECTOR (6 downto 0);
		DISP_SUPPLY: out STD_LOGIC_VECTOR (3 downto 0);
		DISP_CTRL: in STD_LOGIC_VECTOR (3 downto 0)
	 );
end regmux7seg;

architecture Behavioral of regmux7seg is

component mux2x4
	Port 
	( 
		E0 : in  STD_LOGIC_VECTOR (3 downto 0);
		E1 : in  STD_LOGIC_VECTOR (3 downto 0);
		S : out  STD_LOGIC_VECTOR (3 downto 0);
      SEL : in  STD_LOGIC
	);
end component;

component reg4bits
	Port
	( 
		INPUT : in  STD_LOGIC_VECTOR (3 downto 0);
      OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0);
      EN : in  STD_LOGIC;
      CLR : in  STD_LOGIC;
      CLK : in  STD_LOGIC
	);
end component;

component decoder7seg
	Port 
	( 
		INPUT : in STD_LOGIC_VECTOR (3 downto 0);
      OUTPUT : out STD_LOGIC_VECTOR (6 downto 0);
		SEL : in STD_LOGIC_VECTOR (3 downto 0);
		DISP : out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

signal reg1_mux : STD_LOGIC_VECTOR (3 downto 0);
signal reg2_mux : STD_LOGIC_VECTOR (3 downto 0);
signal mux_reg3 : STD_LOGIC_VECTOR (3 downto 0);
signal reg3_decoder : STD_LOGIC_VECTOR (3 downto 0);

begin

reg1:reg4bits
port map 
( 
	INPUT => INPUT,
	OUTPUT => reg1_mux,
	EN => EN1,
	CLR => CLR,
	CLK => CLK
);

reg2:reg4bits
port map 
( 
	INPUT => INPUT,
	OUTPUT => reg2_mux,
	EN => EN2,
	CLR => CLR,
	CLK => CLK
);

reg3:reg4bits
port map 
( 
	INPUT => mux_reg3,
	OUTPUT => reg3_decoder,
	EN => EN3,
	CLR => CLR,
	CLK => CLK
);

mux1:mux2x4
port map (
	E0 => reg1_mux,
	E1 => reg2_mux,
	SEL => SEL,
	S => mux_reg3
);

decoder1:decoder7seg
port map (
	INPUT => reg3_decoder,
   OUTPUT => OUTPUT,
	SEL => DISP_CTRL,
	DISP => DISP_SUPPLY
);

end Behavioral;

