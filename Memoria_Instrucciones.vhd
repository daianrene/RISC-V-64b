----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:21 11/01/2020 
-- Design Name: 
-- Module Name:    Memoria_Instrucciones - Behavioral 
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

entity Memoria_Instrucciones is
    Port ( PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end Memoria_Instrucciones;

architecture Behavioral of Memoria_Instrucciones is
type Programa is array (0 to 63) of std_logic_vector (31 downto 0);
signal ROM : Programa:= (
x"00000000",
	x"00300413",	-- addi $s0, $zero, 3	# a = 3
	x"00100493",	--	addi $s1, $zero, 1	# b = 1
	x"00100073",   -- break point
	x"01000913", 	--addi $s2, $zero, 16	# cte = 16
	
	
--	#	operaciones logicas aritmeticas y slt
--	or  $t0, $s0, $s1	# c = 3
--	and $t1, $s0, $s1	# d = 1
--	add $t2, $s0, $s1	# e = 4
--	sub $t3, $s0, $s1	# f = 2
--	sub $t4, $s1, $s0	# g = 0xfffffffe = -2
--	slt $t5, $s0, $s1	# h = 0
--	slt $t6, $s1, $s0	# i = 1
--	slt $t7, $t4, $s1	# j = 1
		x"009462b3",
		x"00947333",
		x"009403b3",
		x"40940e33",
		x"40848eb3",
		x"00942f33",
		x"0084afb3",
		x"009ea8b3",
	
	
		x"00100293",
		x"00000313",
		x"01228463", --x"01228863", -- beq x5, x18, sal1 = beq x5, x18, 0x00000008
		
		x"005282b3",
		x"00130313",
		
		x"ffbff06f",	--x"ff5ff06f",	-- j while = jal x0, 0xfffffffa
		x"000004b3",
		x"00000293",
		x"00a00313",
		x"00628463",	--x"00628863",	-- beq x5, x6, sal2 = beq x5, x6, 0x00000008
		x"008484b3",
		x"00128293",
		x"ffbff06f",	--x"ff5ff06f",	-- j for = jal x0, 0xffffffa
		x"00802023",
		x"00902223",
		x"01202423",
		x"00002583",
		x"00402603",
		x"00802683",
others => x"00000000");

signal aux : std_logic_vector (31 downto 0);

begin
	process(Pc_in)
	begin
	if(Pc_in= x"ffffffff") then aux<= x"ffffffff";
	else
	aux<=ROM((to_integer(unsigned(Pc_in))));
	end if;
	end process;

Instr<= aux;
end Behavioral;