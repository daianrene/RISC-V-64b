----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:21 11/01/2020 
-- Design Name: 
-- Module Name:    Extend - Behavioral 
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

entity Extend is
    Port (	inm : in  STD_LOGIC_VECTOR (31 downto 0);
				inmsource: in std_logic_vector (1 downto 0);
			SignInm : out  STD_LOGIC_VECTOR (31 downto 0));
end Extend;

architecture Behavioral of Extend is

begin
	process(inm, inmsource)
		begin
		if inmsource = "00" then 
		   SignInm(11 downto 0)	<= inm (31 downto 20); 
			if (inm(31) = '1') then SignInm(31 downto 12) <= X"FFFFF"; end if;
			if (inm(31) = '0') then SignInm(31 downto 12) <= X"00000"; end if;
		 end if;
		 
		if inmsource = "01" then
		   SignInm(4 downto 0)	<= inm (11 downto 7); 
		   SignInm(11 downto 5)	<= inm (31 downto 25); 
			if (inm(31) = '1') then SignInm(31 downto 12) <= X"FFFFF"; end if;
			if (inm(31) = '0') then SignInm(31 downto 12) <= X"00000"; end if;
		end if;	
		
		if inmsource = "10" then ---beq---
--			SignInm(0) <= '0';
--		   SignInm(4 downto 1)	<= inm (11 downto 8); 
--			SignInm(11) <= inm(7);
--		   SignInm(10 downto 5)	<= inm (30 downto 25); 
--		   SignInm(12)	<= inm (31); 
--			if (inm (31) = '0') then SignInm(31 downto 13) <= "0000000000000000000"; end if;
--			if (inm (31) = '1') then SignInm(31 downto 13) <= "1111111111111111111"; end if;


		   SignInm(3 downto 0)	<= inm (11 downto 8); 
			SignInm(10) <= inm(7);
		   SignInm(9 downto 4)	<= inm (30 downto 25); 
		   SignInm(11)	<= inm (31); 
			if (inm (31) = '0') then SignInm(31 downto 12) <=  X"00000"; end if;
			if (inm (31) = '1') then SignInm(31 downto 12) <= X"FFFFF"; end if;
			
		end if;
		
		if inmsource = "11" then --jump--
			SignInm(7 downto 0) <= inm (28 downto 21);
			SignInm(8) <= inm (30);
			SignInm(18 downto 9) <= inm(29) & inm (20 downto 12);
			SignInm(19) <= inm (31);
			if (inm (31) = '0') then SignInm(31 downto 20) <= x"000"; end if;
			if (inm (31) = '1') then SignInm(31 downto 20) <= x"FFF"; end if;

		end if;
	end process;
	
end Behavioral;

