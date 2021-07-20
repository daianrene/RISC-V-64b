--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:44:49 11/12/2020
-- Design Name:   
-- Module Name:   G:/Organizacion/El procesador padre/ProcesadorOC/tb_unidad_control_v1.vhd
-- Project Name:  ProcesadorOC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_Control
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
 
ENTITY tb_unidad_control_v1 IS
END tb_unidad_control_v1;
 
ARCHITECTURE behavior OF tb_unidad_control_v1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_Control
    PORT(
         OpCode : IN  std_logic_vector(6 downto 0);
         funct3 : IN  std_logic_vector(2 downto 0);
         funct7 : IN  std_logic;
         zero : IN  std_logic;
         PcSrc : OUT  std_logic;
         ResultSrc : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         ImmSrc : OUT  std_logic_vector(1 downto 0);
         RegWrite : OUT  std_logic;
         ALUControl : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OpCode : std_logic_vector(6 downto 0) := (others => '0');
   signal funct3 : std_logic_vector(2 downto 0) := (others => '0');
   signal funct7 : std_logic := '0';
   signal zero : std_logic := '0';

 	--Outputs
   signal PcSrc : std_logic;
   signal ResultSrc : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal ALUSrc : std_logic;
   signal ImmSrc : std_logic_vector(1 downto 0);
   signal RegWrite : std_logic;
   signal ALUControl : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_Control PORT MAP (
          OpCode => OpCode,
          funct3 => funct3,
          funct7 => funct7,
          zero => zero,
          PcSrc => PcSrc,
          ResultSrc => ResultSrc,
          MemWrite => MemWrite,
          ALUSrc => ALUSrc,
          ImmSrc => ImmSrc,
          RegWrite => RegWrite,
          ALUControl => ALUControl
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
		OpCode<= "0110011";
		funct3 <= "000";
		funct7 <='0';

      wait for 50 ns;	
		funct3 <= "000";
		funct7 <='1';
		
      wait for 50 ns;	
		funct3 <= "010";
		funct7 <='0';
		
      wait for 50 ns;	
		funct3 <= "110";
		
      wait for 50 ns;	
		funct3 <= "111";

      wait;
   end process;

END;
