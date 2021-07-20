--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:51:08 11/12/2020
-- Design Name:   
-- Module Name:   G:/Organizacion/El procesador padre/ProcesadorOC/tb_data_path_v1.vhd
-- Project Name:  ProcesadorOC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Path
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
 
ENTITY tb_data_path_v1 IS
END tb_data_path_v1;
 
ARCHITECTURE behavior OF tb_data_path_v1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_Path
    PORT(
         Ctrl_in : IN  std_logic_vector(10 downto 0);
         Data_Load : IN  std_logic_vector(31 downto 0);
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Ctrl_out : OUT  std_logic_vector(11 downto 0);
         Direccion : OUT  std_logic_vector(5 downto 0);
         D_out : OUT  std_logic_vector(31 downto 0);
         We : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ctrl_in : std_logic_vector(10 downto 0) := (others => '0');
   signal Data_Load : std_logic_vector(31 downto 0) := (others => '0');
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Ctrl_out : std_logic_vector(11 downto 0);
   signal Direccion : std_logic_vector(5 downto 0);
   signal D_out : std_logic_vector(31 downto 0);
   signal We : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Path PORT MAP (
          Ctrl_in => Ctrl_in,
          Data_Load => Data_Load,
          Clock => Clock,
          Reset => Reset,
          Ctrl_out => Ctrl_out,
          Direccion => Direccion,
          D_out => D_out,
          We => We
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	reset<='1';

      wait for 50ns;	
	reset<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
