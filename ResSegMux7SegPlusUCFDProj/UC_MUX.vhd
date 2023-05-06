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

---------------------------------------------------------------------------------------------------
-- Deeds (Digital Electronics Education and Design Suite)
-- VHDL Code generated on (05/05/2023, 22:30:21)
--      by the Deeds (Finite State Machine Simulator)(Deeds-FsM)
--      Ver. 2.41.150 (July 14, 2021)
-- Copyright (c) 2002-2021 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- Deeds (Digital Electronics Education and Design Suite)
-- VHDL Code generated on (05/05/2023, 22:30:21)
--      by the Deeds (Finite State Machine Simulator)(Deeds-FsM)
--      Ver. 2.41.150 (July 14, 2021)
-- Copyright (c) 2002-2021 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Deeds (Digital Electronics Education and Design Suite)
-- VHDL Code generated on (05/05/2023, 22:30:21)
--      by the Deeds (Finite State Machine Simulator)(Deeds-FsM)
--      Ver. 2.41.150 (July 14, 2021)
-- Copyright (c) 2002-2021 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UC_MUX IS
  PORT( ----------------------------------->CloCLK & RST:
        CLK:    IN std_logic;
        RST: IN std_logic;
        ----------------------------------->Inputs:
        GV1:  IN std_logic;
        GV2:  IN std_logic;
        MST1:  IN std_logic;
        MST2:  IN std_logic;
        ----------------------------------->Outputs:
        EN1: OUT std_logic;
        EN2: OUT std_logic;
        EN3: OUT std_logic;
        SEL: OUT std_logic
        -------------------------------------------
        );
END UC_MUX;

ARCHITECTURE behavioral OF UC_MUX IS       -- (Behavioral Description)
  TYPE states is ( state_e0,
                   state_e1,
                   state_e2,
                   state_e3,
                   state_e4 );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, GV1, GV2, MST1, MST2 )
  begin
    CASE State IS
      when state_e0 =>
                 if (GV1 = '1') then
                   Next_State <= state_e1;
                 else
                   if (GV2 = '1') then
                     Next_State <= state_e2;
                   else
                     if (MST1 = '1') then
                       Next_State <= state_e3;
                     else
                       if (MST2 = '1') then
                         Next_State <= state_e4;
                       else
                         Next_State <= state_e0;
                       end if;
                     end if;
                   end if;
                 end if;
      when state_e1 =>
                 if (GV2 = '1') then
                   Next_State <= state_e2;
                 else
                   if (MST1 = '1') then
                     Next_State <= state_e3;
                   else
                     if (MST2 = '1') then
                       Next_State <= state_e4;
                     else
                       Next_State <= state_e0;
                     end if;
                   end if;
                 end if;
      when state_e2 =>
                 if (MST1 = '1') then
                   Next_State <= state_e3;
                 else
                   if (MST2 = '1') then
                     Next_State <= state_e4;
                   else
                     Next_State <= state_e0;
                   end if;
                 end if;
      when state_e3 =>
                 if (MST2 = '1') then
                   Next_State <= state_e4;
                 else
                   Next_State <= state_e0;
                 end if;
      when state_e4 =>
                 Next_State <= state_e0;
      when OTHERS =>
                 Next_State <= state_e0;
    END case;
  end process;

  -- State Register --------------------------------------------------
  REG: process( CLK, RST )
  begin
    if (RST = '0') then
              State <= state_e0;
    elsif rising_edge(CLK) then
              State <= Next_State;
       end if;
  end process;

  -- Outputs Combinational Logic -----------------------------------
  OUTPUTS: process( State, GV1, GV2, MST1, MST2 )
  begin
    -- Set output defaults:
    EN1 <= '0';
    EN2 <= '0';
    EN3 <= '0';
    SEL <= '0';

    -- Set output as function of current state and input:
    CASE State IS
      when state_e1 =>
                 EN1 <= '1';
      when state_e2 =>
                 EN2 <= '1';
      when state_e3 =>
                 EN3 <= '1';
      when state_e4 =>
                 EN3 <= '1';
                 SEL <= '1';
      when OTHERS =>
                 EN1 <= '0';
                 EN2 <= '0';
                 EN3 <= '0';
                 SEL <= '0';
    END case;
  end process;

END behavioral;


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
--entity UC_MUX is
--
--	Port 
--		(	
--			GV1, GV2, MST1, MST2, CLK, RST: in STD_LOGIC;
--			EN1, EN2, EN3, SEL : out STD_LOGIC
--		);
--	
--end UC_MUX;
--
--architecture Behavioral of UC_MUX is
--
--type TIPO_ESTADO is (EST_0, EST_1, EST_2, EST_3, EST_4);
--signal ESTADO_ATUAL, PROXIMO_ESTADO : TIPO_ESTADO;
--
--begin
--
--	-- Processo comum a toda e qualquer FSM (Finite State Machine)
--	SINCRONISMO_ASM: process (CLK, RST)
--	begin
--
--		if (RST='1') then 
--			ESTADO_ATUAL <= EST_0;
--		elsif (CLK'event and CLK ='1') then
--			ESTADO_ATUAL <= PROXIMO_ESTADO;
--		end if;
--
--	end process;
--
--	ASM: process(GV1, GV2, MST1, MST2)
--	begin
--		
--		--PROXIMO_ESTADO <= ESTADO_ATUAL;
--		
--		case (ESTADO_ATUAL) is
--		
--			-- estado 0
--			when EST_0 =>
--			
--				EN1 <= '0';
--				EN2 <= '0';
--				EN3 <= '0';
--				SEL <= '0';
--				
--				if GV1 = '1' then
--					PROXIMO_ESTADO <= EST_1;
--				elsif GV2 = '1' then
--					PROXIMO_ESTADO <= EST_2;
--				elsif MST1 = '1' then
--					PROXIMO_ESTADO <= EST_3;
--				elsif MST2 = '1' then
--					PROXIMO_ESTADO <= EST_4;
--				else
--					PROXIMO_ESTADO <= EST_0;
--				end if;
--				
--			-- estado 1
--			when EST_1 =>
--			
--				EN1 <= '1';
--				EN2 <= '0';
--				EN3 <= '0';
--				SEL <= '0';
--				
--				if GV1 = '1' then
--					PROXIMO_ESTADO <= EST_1;
--				elsif GV2 = '1' then
--					PROXIMO_ESTADO <= EST_2;
--				elsif MST1 = '1' then
--					PROXIMO_ESTADO <= EST_3;
--				elsif MST2 = '1' then
--					PROXIMO_ESTADO <= EST_4;
--				else
--					PROXIMO_ESTADO <= EST_0;
--				end if;
--			
--			-- estado 2
--			when EST_2 =>
--			
--				EN1 <= '0';
--				EN2 <= '1';
--				EN3 <= '0';
--				SEL <= '0';
--				
--				if MST1 = '1' then
--					PROXIMO_ESTADO <= EST_3;
--				elsif MST2 = '1' then
--					PROXIMO_ESTADO <= EST_4;
--				else
--					PROXIMO_ESTADO <= EST_2;
--				end if;
--				
--			-- estado 3
--			when EST_3 =>
--			
--				EN1 <= '0';
--				EN2 <= '0';
--				EN3 <= '1';
--				SEL <= '0';
--				
--				if MST2 = '1' then
--					PROXIMO_ESTADO <= EST_4;
--				else
--					PROXIMO_ESTADO <= EST_3;
--				end if;
--			
--			-- estado 4
--			when EST_4 =>
--			
--				EN1 <= '0';
--				EN2 <= '0';
--				EN3 <= '1';
--				SEL <= '1';
--				
--				PROXIMO_ESTADO <= EST_0;
--				
--			when others =>
--				PROXIMO_ESTADO <= EST_0;
--				
--			end case;
--	end process;
--	
--end Behavioral;

