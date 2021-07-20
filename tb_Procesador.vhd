--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:57:35 11/12/2020
-- Design Name:   
-- Module Name:   G:/Organizacion/El procesador padre/ProcesadorOC/tb_Procesador.vhd
-- Project Name:  ProcesadorOC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Procesador
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
 
ENTITY tb_Procesador IS
END tb_Procesador;
 
ARCHITECTURE behavior OF tb_Procesador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador
    PORT(
         Data_in : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Address : OUT  std_logic_vector(5 downto 0);
         Data_out : OUT  std_logic_vector(31 downto 0);
         We : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Address : std_logic_vector(5 downto 0);
   signal Data_out : std_logic_vector(31 downto 0);
   signal We : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador PORT MAP (
          Data_in => Data_in,
          CLK => CLK,
          Reset => Reset,
          Address => Address,
          Data_out => Data_out,
          We => We
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reset<= '1';
		wait for 50 ns;
		reset <= '0';
		wait for 50 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
