----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:40:30 11/01/2020 
-- Design Name: 
-- Module Name:    PcPlus4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity PcPlus4 is
    Port ( PcActual : in  STD_LOGIC_VECTOR (31 downto 0);
           PPlus4 : out  STD_LOGIC_VECTOR (31 downto 0));
end PcPlus4;

architecture Behavioral of PcPlus4 is
begin
PPlus4<= std_logic_vector(1 + unsigned(PcActual));
end Behavioral;

