----------------------------------------------------------------------------------
-- Company: Faculdade Engenheiro Salvador Arena
--
-- Engineers: Carlos Adonias
--			  	  Carlos Gonçalves
--			 	  Gabriel Teixeira
-- 		 	  Johnny Messias
--
-- Teacher: Filippo Valiante
-- Create Date:    20:20:54 05/05/2023 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SD_MUX is
    Port ( GV1, GV2, MST1, MST2 : in  STD_LOGIC;
           ENT : in  STD_LOGIC_VECTOR (3 downto 0);
           DISP : out  STD_LOGIC_VECTOR (6 downto 0);
			  DISP_SUPPLY: out STD_LOGIC_VECTOR (3 downto 0);
           CLK, RST : in  STD_LOGIC);
end SD_MUX;

architecture Behavioral of SD_MUX is
	
	--Fluxo de dados
	COMPONENT regmux7seg
	PORT(
		INPUT : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;
		EN1 : IN std_logic;
		EN2 : IN std_logic;
		EN3 : IN std_logic;
		SEL : IN std_logic;
		CLR : IN std_logic;
		DISP_CTRL : IN std_logic_vector(3 downto 0);          
		OUTPUT : OUT std_logic_vector(6 downto 0);
		DISP_SUPPLY : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	--Unidade de controle
	COMPONENT UC_MUX
	PORT(
		GV1 : IN std_logic;
		GV2 : IN std_logic;
		MST1 : IN std_logic;
		MST2 : IN std_logic;
		CLK : IN std_logic;
		RST : IN std_logic;          
		EN1 : OUT std_logic;
		EN2 : OUT std_logic;
		EN3 : OUT std_logic;
		SEL : OUT std_logic
		);
	END COMPONENT;
	
	signal EN1_SIGNAL, EN2_SIGNAL, EN3_SIGNAL, SEL_SIGNAL : std_logic;
	
begin

	Inst_regmux7seg: regmux7seg PORT MAP(
		INPUT => ENT,
		CLK => CLK,
		EN1 => EN1_SIGNAL,
		EN2 => EN2_SIGNAL,
		EN3 => EN3_SIGNAL,
		SEL => SEL_SIGNAL,
		CLR => RST,
		OUTPUT => DISP,
		DISP_SUPPLY => DISP_SUPPLY,
		DISP_CTRL => "0001" 
	);

	Inst_UC_MUX: UC_MUX PORT MAP(
		GV1 => GV1,
		GV2 => GV2,
		MST1 => MST1,
		MST2 => MST2,
		CLK => CLK,
		RST => RST,
		EN1 => EN1_SIGNAL,
		EN2 => EN2_SIGNAL,
		EN3 => EN3_SIGNAL,
		SEL => SEL_SIGNAL
	);
	
end Behavioral;

