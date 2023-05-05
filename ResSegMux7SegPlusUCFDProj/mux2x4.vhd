----------------------------------------------------------------------------------
-- Company: Faculdade Engenheiro Salvador Arena
--
-- Engineers: Carlos Adonias
--			  	  Carlos Gonçalves
--			 	  Gabriel Teixeira
-- 		 	  Johnny Messias
--
-- Teacher: Filippo Valiante
-- Create Date:    13:23:09 03/11/2023 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x4 is
    Port 
	 ( 
		E0 : in  STD_LOGIC_VECTOR (3 downto 0);
		E1 : in  STD_LOGIC_VECTOR (3 downto 0);
      S : out  STD_LOGIC_VECTOR (3 downto 0);
		SEL : in  STD_LOGIC
	  );
end mux2x4;

architecture Behavioral of mux2x4 is
	
begin
	S <= E0 when (SEL = '0') else E1;
end Behavioral;

