----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:05:19 11/08/2020 
-- Design Name: 
-- Module Name:    Top - Behavioral 
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

entity Top is
    Port ( CLKTOP : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Exepcion: out std_logic;
           Leds : out  STD_LOGIC_VECTOR (7 downto 0));
end Top;

architecture Behavioral of Top is

--Procesador--
	COMPONENT Procesador
	PORT(
		Data_in : IN std_logic_vector(31 downto 0);
		CLK : IN std_logic;
		Reset : IN std_logic;  
		Cont_out : out std_logic;        
		Address : OUT std_logic_vector(5 downto 0);
		Data_out : OUT std_logic_vector(31 downto 0);
		We : OUT std_logic
		);
	END COMPONENT;

--Memoria RAM--
	COMPONENT Memoria_RAM
	PORT(
		Clk : IN std_logic;
		we : IN std_logic;
		A : IN std_logic_vector(5 downto 0);
		DI : IN std_logic_vector(31 downto 0);          
		DO : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal aux, aux4: std_logic_vector (31 downto 0);
signal aux2: std_logic_vector (5 downto 0);
signal aux3,clkaux : std_logic;

begin


--Memoria RAM--
Inst_Memoria_RAM: Memoria_RAM PORT MAP(
		Clk => CLKTOP,
		we => aux3,
		A => aux2,
		DI => aux4,
		DO => aux
	);

--Procesador--
	Inst_Procesador: Procesador PORT MAP(
		Data_in => aux,
		CLK => CLKTOP,
		Reset => Reset,
		Address => aux2,
		Data_out => aux4,
		Cont_out => Exepcion,
		We => aux3
	);

Leds (5 downto 0) <= aux2;
--Leds (7 downto 6) <= aux(1 downto 0);


end Behavioral;

