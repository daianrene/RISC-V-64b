----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:10 11/08/2020 
-- Design Name: 
-- Module Name:    Unidad_Control - Behavioral 
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

entity Unidad_Control is
    Port ( OpCode : in  STD_LOGIC_VECTOR (6 downto 0);
           funct3 : in  STD_LOGIC_VECTOR (2 downto 0);
           funct7 : in  STD_LOGIC;
           zero : in  STD_LOGIC;
			  excepIn: in std_logic := '0';
			  
           PcSrc : out  STD_LOGIC;
           UER_W_CU : out  STD_LOGIC := '0';
           ResultSrc : out  STD_LOGIC_VECTOR (1 downto 0) ;
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           ImmSrc : out  STD_LOGIC_VECTOR (1 downto 0);
           RegWrite : out  STD_LOGIC;
           ExcepSrc : out  STD_LOGIC_VECTOR (1 downto 0);
           ALUControl : out  STD_LOGIC_VECTOR (2 downto 0));
			  
end Unidad_Control;

architecture Behavioral of Unidad_Control is

signal AluAux : std_logic_vector (2 downto 0);
begin
	process(OpCode, funct3, funct7,zero, excepIn)
	begin
	
	
	Case OpCode is
	when "0110011" => --Tipo R (add,sub,or,and,slt)--
		PcSrc<='0';
		ResultSrc <= "00";
		MemWrite <= '0';
		ALUSrc <= '0';
		RegWrite<='1';
		ImmSrc <= "00";
       ExcepSrc <="00";
		
		if(funct3 = "000" and funct7 = '0')							 then AluAux <= "010";	end if;	
		if(OpCode(5)= '1' and funct3 = "000" and funct7 = '1') then AluAux <= "110";  end if;
		if(funct3 = "010" and funct7 = '0')							 then AluAux <= "111";	end if;
		if(funct3 = "110" and funct7 = '0')							 then AluAux <= "001";	end if;
		if(funct3 = "111" and funct7 = '0')							 then AluAux <= "000";  end if;
		
	when "0000011" => --Tipo Lw--
		PcSrc<='0';
		ResultSrc <= "01";
		MemWrite <= '0';
		ALUSrc <= '1';
		RegWrite<='1';
		ImmSrc <= "00";
		AluAux<= "010";
       ExcepSrc <="00";
		
	when "0100011" => --Tipo Sw--
		PcSrc<='0';
		ResultSrc <= "00";
		MemWrite <= '1';
		ALUSrc <= '1';
		RegWrite<='0';
		ImmSrc <= "01";
		AluAux<= "010";
       ExcepSrc <="00";
		
	when "0010011" => --Tipo I (addi)--
		PcSrc<='0';
		ResultSrc <= "00";
		MemWrite <= '0';
		ALUSrc <= '1';
		RegWrite<='1';
		ImmSrc <= "00";
       ExcepSrc <="00";
		AluAux<= "010";
	
	
	when "1100011" => --Tipo B--(beq)
		if(zero='1') then PcSrc<='1'; end if;
		if(zero='0') then PcSrc<='0'; end if;
		ResultSrc <= "00"; --X--
		MemWrite <= '0';--
		ALUSrc <= '0';--
		RegWrite<='0'; --
		ImmSrc <= "10";--
		AluAux<= "110";
       ExcepSrc <="00";
		
		when "1101111" => --Tipo J-(jal)
		PcSrc<='1'; 
		ResultSrc <= "00"; --X--
		MemWrite <= '0';
		ALUSrc <= '0';--x
		RegWrite<='0'; --
		ImmSrc <= "11";--
		AluAux<= "010";--x
       ExcepSrc <="00";
		 
		when "1110011" => --Breakpoint--
		PcSrc<='0'; 
		ResultSrc <= "00"; --X--
		MemWrite <= '0';
		ALUSrc <= '0';--x
		RegWrite<='0'; --
		ImmSrc <= "00";--
		AluAux<= "010";--x
		UER_W_CU <= '1';
       ExcepSrc <="11";
		 
		  
		when "1111111" => --excepcion--
		PcSrc<='0'; 
		ResultSrc <= "00"; --X--
		MemWrite <= '0';
		ALUSrc <= '0';--x
		RegWrite<='0'; --
		ImmSrc <= "00";--
		AluAux<= "010";--x
       ExcepSrc <="11";
		UER_W_CU <= '0';
		 if(excepIn = '1') then excepSrc <= "01"; end if;
		 
		WHEN others =>	
		PcSrc<='0';
		ResultSrc <= "11";
		MemWrite <= '0';
		ALUSrc <= '0';
		RegWrite<='0';
		ImmSrc <= "00";
		AluAux<="000";
       ExcepSrc <="00";
	
		
		end case;
end process;
		

ALUControl <= AluAux;

end Behavioral;

