----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:28 11/08/2020 
-- Design Name: 
-- Module Name:    Multiplexor_2 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexor_2 is
		Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
				 B : in  STD_LOGIC_VECTOR (31 downto 0);
             Sel : in  STD_LOGIC;
             Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplexor_2;

architecture Behavioral of Multiplexor_2 is

begin
process (Sel, A, B)
begin
   case Sel is
      when '0' => Salida <= A;
      when '1' => Salida <= B;
      when others => Salida <= A;
   end case;
end process;

end Behavioral;

