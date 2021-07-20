----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:25 11/01/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

library UNISIM;
use UNISIM.VComponents.all;

entity Alu is
	Port(	SrcA, SrcB : in  STD_LOGIC_VECTOR (31 downto 0);
			AluControl : in  STD_LOGIC_VECTOR (2 downto 0);
			AluResult : inout  STD_LOGIC_VECTOR (31 downto 0);
			zero : out  STD_LOGIC);
end Alu;

architecture Behavioral of Alu is

SIGNAL result : std_logic_vector (31 DOWNTO 0);
SIGNAL senialSLT : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
Process (SrcA, SrcB, AluControl)
		 Begin
		 
			IF(SIGNED(SrcA)<SIGNED(SrcB)) THEN
					senialSLT <="00000000000000000000000000000001"; --Solo se usa el ultimo bit
				ELSE
					senialSLT <="00000000000000000000000000000000";
			END IF;
			
			 
	END PROCESS;
			
			result <= std_logic_vector(signed(SrcA) + signed(SrcB)) when (AluControl="010") else
			std_logic_vector(signed(SrcA)-signed(SrcB)) when (AluControl="110") else
			 SrcA and SrcB when (AluControl="000") else
			 SrcA or SrcB when (AluControl="001") else
			 senialSLT WHEN(AluControl="111") else
			 "00000000000000000000000000000000";


	AluResult<=result;
	zero<='1' WHEN (result="00000000000000000000000000000000") and (AluControl="110")
	ELSE '0';

end Behavioral;

