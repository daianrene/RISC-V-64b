----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:01 11/01/2020 
-- Design Name: 
-- Module Name:    Contador_Programa - Behavioral 
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

entity Program_Counter is
	Port(	clk, reset : in  STD_LOGIC;
			PC_next : in  STD_LOGIC_VECTOR (31 downto 0);
			PC : out  STD_LOGIC_VECTOR (31 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

begin
	process(clk, reset)
	begin
		if reset = '1' then
			PC <="00000000000000000000000000000000";
		elsif clk'event and clk='1' and reset='0' then
				PC <= pc_next;
		end if;
	end process;
end behavioral;

