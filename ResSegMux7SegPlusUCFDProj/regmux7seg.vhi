
-- VHDL Instantiation Created from source file regmux7seg.vhd -- 20:22:14 05/05/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_regmux7seg: regmux7seg PORT MAP(
		INPUT => ,
		CLK => ,
		EN1 => ,
		EN2 => ,
		EN3 => ,
		SEL => ,
		CLR => ,
		OUTPUT => ,
		DISP_SUPPLY => ,
		DISP_CTRL => 
	);


