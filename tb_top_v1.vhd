--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:07:07 11/12/2020
-- Design Name:   
-- Module Name:   G:/Organizacion/El procesador padre/ProcesadorOC/tb_top_v1.vhd
-- Project Name:  ProcesadorOC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top
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
 
ENTITY tb_top_v1 IS
END tb_top_v1;
 
ARCHITECTURE behavior OF tb_top_v1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top
    PORT(
         CLKTOP : IN  std_logic;
         Reset : IN  std_logic;
         Leds : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLKTOP : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Leds : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLKTOP_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          CLKTOP => CLKTOP,
          Reset => Reset,
          Leds => Leds
        );

   -- Clock process definitions
   CLKTOP_process :process
   begin
		CLKTOP <= '0';
		wait for CLKTOP_period/2;
		CLKTOP <= '1';
		wait for CLKTOP_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset<= '1';
      wait for 20 ns;	
		reset<= '0';
      wait for CLKTOP_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
