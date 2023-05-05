--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:21 05/05/2023
-- Design Name:   
-- Module Name:   C:/Users/082190011/Documents/GitHub/ResSegMux7SegPlusUCFD/ResSegMux7SegPlusUCFDProj/tb_SD_MUX.vhd
-- Project Name:  ResSegMux7SegPlusUCFDProj
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SD_MUX
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_SD_MUX IS
END tb_SD_MUX;
 
ARCHITECTURE behavior OF tb_SD_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SD_MUX
    PORT(
         GV1 : IN  std_logic;
         GV2 : IN  std_logic;
         MST1 : IN  std_logic;
         MST2 : IN  std_logic;
         ENT : IN  std_logic_vector(3 downto 0);
         DISP : OUT  std_logic_vector(6 downto 0);
         DISP_SUPPLY : OUT  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal GV1 : std_logic := '0';
   signal GV2 : std_logic := '0';
   signal MST1 : std_logic := '0';
   signal MST2 : std_logic := '0';
   signal ENT : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal DISP : std_logic_vector(6 downto 0);
   signal DISP_SUPPLY : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SD_MUX PORT MAP (
          GV1 => GV1,
          GV2 => GV2,
          MST1 => MST1,
          MST2 => MST2,
          ENT => ENT,
          DISP => DISP,
          DISP_SUPPLY => DISP_SUPPLY,
          CLK => CLK,
          RST => RST
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		RST <= '1';
      wait for 100 ns;	
		RST <= '0';
      wait for 100 ns;	
		
		ENT <= "1010";
      wait for 100 ns;
		GV1 <= '1';
		GV2 <= '0';
		wait for 100 ns;
		GV1 <= '0';
		GV2 <= '0';
		wait for 100 ns;
		
		
		ENT <= "0101";
		wait for 100 ns;
		GV1 <= '0';
		GV2 <= '1';
		wait for 100 ns;
		GV1 <= '0';
		GV2 <= '0';
		wait for 100 ns;
		
		MST1 <= '1';
		MST2 <= '0';
		wait for 100 ns;
		MST1 <= '0';
		MST2 <= '0';
		wait for 100 ns;
		MST1 <= '0';
		MST2 <= '1';
		wait for 100 ns;

   end process;

END;
