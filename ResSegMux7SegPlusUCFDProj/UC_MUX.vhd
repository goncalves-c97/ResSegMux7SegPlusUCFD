----------------------------------------------------------------------------------
-- Company: Faculdade Engenheiro Salvador Arena
--
-- Engineers: Carlos Adonias
--			  	  Carlos Gonçalves
--			 	  Gabriel Teixeira
-- 		 	  Johnny Messias
--
-- Teacher: Filippo Valiante
-- Subject: FSM - Finite State Machine
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC_MUX is

	Port 
		(	
			GV1, GV2, MST1, MST2, CLK, RST: in STD_LOGIC;
			EN1, EN2, EN3, SEL : out STD_LOGIC
		);
	
end UC_MUX;

architecture Behavioral of UC_MUX is

type TIPO_ESTADO is (EST_0, EST_1, EST_2, EST_3, EST_4);
signal ESTADO_ATUAL, PROXIMO_ESTADO : TIPO_ESTADO;

begin

	-- Processo comum a toda e qualquer FSM (Finite State Machine)
	SINCRONISMO_ASM: process (CLK, RST)
	begin

		if (RST='1') then 
			ESTADO_ATUAL <= EST_0;
		elsif (CLK'event and CLK ='1') then
			ESTADO_ATUAL <= PROXIMO_ESTADO;
		end if;

	end process;

	ASM: process(GV1, GV2, MST1, MST2)
	begin
		
		PROXIMO_ESTADO <= ESTADO_ATUAL;
		
		case (ESTADO_ATUAL) is
		
			-- estado 0
			when EST_0 =>
			
				EN1 <= '0';
				EN2 <= '0';
				EN3 <= '0';
				SEL <= '0';
				
				if GV1 = '1' then
					PROXIMO_ESTADO <= EST_1;
				elsif GV2 = '1' then
					PROXIMO_ESTADO <= EST_2;
				elsif MST1 = '1' then
					PROXIMO_ESTADO <= EST_3;
				elsif MST2 = '1' then
					PROXIMO_ESTADO <= EST_4;
				else
					PROXIMO_ESTADO <= EST_0;
				end if;
				
			-- estado 1
			when EST_1 =>
			
				EN1 <= '1';
				EN2 <= '0';
				EN3 <= '0';
				SEL <= '0';
				
				if GV2 = '1' then
					PROXIMO_ESTADO <= EST_2;
				elsif MST1 = '1' then
					PROXIMO_ESTADO <= EST_3;
				elsif MST2 = '1' then
					PROXIMO_ESTADO <= EST_4;
				else
					PROXIMO_ESTADO <= EST_0;
				end if;
			
			-- estado 2
			when EST_2 =>
			
				EN1 <= '0';
				EN2 <= '1';
				EN3 <= '0';
				SEL <= '0';
				
				if MST1 = '1' then
					PROXIMO_ESTADO <= EST_3;
				elsif MST2 = '1' then
					PROXIMO_ESTADO <= EST_4;
				else
					PROXIMO_ESTADO <= EST_0;
				end if;
				
			-- estado 3
			when EST_3 =>
			
				EN1 <= '0';
				EN2 <= '0';
				EN3 <= '1';
				SEL <= '0';
				
				if MST2 = '1' then
					PROXIMO_ESTADO <= EST_4;
				else
					PROXIMO_ESTADO <= EST_0;
				end if;
			
			-- estado 4
			when EST_4 =>
			
				EN1 <= '0';
				EN2 <= '0';
				EN3 <= '1';
				SEL <= '1';
				
				PROXIMO_ESTADO <= EST_0;
				
			when others =>
				PROXIMO_ESTADO <= EST_0;
				
			end case;
	end process;
	
end Behavioral;

