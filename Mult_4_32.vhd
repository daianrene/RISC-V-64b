----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:52 11/28/2020 
-- Design Name: 
-- Module Name:    Mult_4_32 - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux4x32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : in  STD_LOGIC_VECTOR (31 downto 0);
           D : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux4x32;

architecture Behavioral of Mux4x32 is

begin
process (Sel, A, B, C, D)
begin
   case Sel is
      when "00" => Salida <= B;
      when "01" => Salida <= A;
      when "10" => Salida <= C;
      when "11" => Salida <= C;
      when others => Salida <= B;
   end case;
end process;

end Behavioral;
