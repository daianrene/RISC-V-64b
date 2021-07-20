--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:33:41 11/12/2020
-- Design Name:   
-- Module Name:   G:/Organizacion/El procesador padre/ProcesadorOC/tb_alu_v1.vhd
-- Project Name:  ProcesadorOC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu
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
 
ENTITY tb_alu_v1 IS
END tb_alu_v1;
 
ARCHITECTURE behavior OF tb_alu_v1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         SrcA : IN  std_logic_vector(31 downto 0);
         SrcB : IN  std_logic_vector(31 downto 0);
         AluControl : IN  std_logic_vector(2 downto 0);
         AluResult : INOUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SrcA : std_logic_vector(31 downto 0) := (others => '0');
   signal SrcB : std_logic_vector(31 downto 0) := (others => '0');
   signal AluControl : std_logic_vector(2 downto 0) := (others => '0');

	--BiDirs
   signal AluResult : std_logic_vector(31 downto 0);

 	--Outputs
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          SrcA => SrcA,
          SrcB => SrcB,
          AluControl => AluControl,
          AluResult => AluResult,
          zero => zero
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		SrcA<= "00000000000000000000000000000111";
		SrcB<= "00000000000000000000000000000101";
		AluControl<= "010";
     -- wait for <clock>_period*10;
      wait for 50 ns;	
		AluControl<= "110";
		SrcA<= "00000000000000000000000000000110";
		SrcB<= "00000000000000000000000000000101";
		
      wait for 50 ns;	
		AluControl<= "000";
		
      wait for 50 ns;	
		AluControl<= "001";
		
		
      wait for 50 ns;	
		
		SrcA<= "00000000000000000000000000000101";
		SrcB<= "00000000000000000000000000000111";
		AluControl<= "111";


      -- insert stimulus here 

      wait;
   end process;

END;
