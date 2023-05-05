----------------------------------------------------------------------------------
-- Company: Faculdade Engenheiro Salvador Arena
--
-- Engineers: Carlos Adonias
--			  	  Carlos Gonçalves
--			 	  Gabriel Teixeira
-- 		 	  Johnny Messias
--
-- Teacher: Filippo Valiante
-- Create Date:    13:59:32 03/11/2023 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder7seg is
    Port 
	 ( 
		INPUT : in STD_LOGIC_VECTOR (3 downto 0);
      OUTPUT : out STD_LOGIC_VECTOR (6 downto 0);
		SEL : in STD_LOGIC_VECTOR (3 downto 0);
		DISP : out STD_LOGIC_VECTOR (3 downto 0)
	  );
end decoder7seg;

architecture Behavioral of decoder7seg is

begin
	with SEL SELECT
			DISP <=   "0000" WHEN "1111",
						 "0001" WHEN "1110",
						 "0010" WHEN "1101",
						 "0011" WHEN "1100",
						 "0100" WHEN "1011",
						 "0101" WHEN "1010",
						 "0110" WHEN "1001",
						 "0111" WHEN "1000",
						 "1000" WHEN "0111",
						 "1001" WHEN "0110",
						 "1010" WHEN "0101",
						 "1011" WHEN "0100",
						 "1100" WHEN "0011",
						 "1101" WHEN "0010",
						 "1110" WHEN "0001",				 
						 "1111" WHEN OTHERS;
						 
	with INPUT SELECT
		OUTPUT <= "0000001" WHEN "0000",
					 "1001111" WHEN "0001",
					 "0010010" WHEN "0010",
					 "0000110" WHEN "0011",
					 "1001100" WHEN "0100",
					 "0100100" WHEN "0101",
					 "0100000" WHEN "0110",
					 "0001111" WHEN "0111",
					 "0000000" WHEN "1000",
					 "0000100" WHEN "1001",
					 "0001000" WHEN "1010",
					 "1100000" WHEN "1011",
					 "0110001" WHEN "1100",
					 "1000010" WHEN "1101",
					 "0110000" WHEN "1110",
					 "0111000" WHEN OTHERS;
end Behavioral;

