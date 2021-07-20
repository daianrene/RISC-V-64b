----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:28 11/28/2020 
-- Design Name: 
-- Module Name:    Memoria_Excepcion - Behavioral 
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

entity Memoria_Excepcion is
    Port ( UER_W : in  STD_LOGIC;
           SDir : in  STD_LOGIC_VECTOR (31 downto 0);
           DirOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Memoria_Excepcion;

architecture Behavioral of Memoria_Excepcion is

signal direccion_next : std_logic_vector (31 downto 0) := x"00000000";

begin
process(UER_W)
	begin
		if UER_W = '1' then
			direccion_next <= SDir;
		end if;
	end process;
	DirOut <= direccion_next;
end Behavioral;

