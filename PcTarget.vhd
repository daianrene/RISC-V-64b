----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:57 11/25/2020 
-- Design Name: 
-- Module Name:    PcTarget - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PcTarget is
    Port ( PcActual : in  STD_LOGIC_VECTOR (31 downto 0);
				inc : in STD_LOGIC_VECTOR (31 downto 0);
           PcPlus : out  STD_LOGIC_VECTOR (31 downto 0));
end PcTarget;

architecture Behavioral of PcTarget is
signal salida : STD_LOGIC_VECTOR(31 downto 0);

begin
process (PcActual,inc)
begin
salida <= std_logic_vector(signed(PcActual) + signed(inc));
end process;

PcPlus<=salida;
end Behavioral;

