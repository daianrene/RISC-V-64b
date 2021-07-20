----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:00 11/08/2020 
-- Design Name: 
-- Module Name:    Memoria_RAM - Behavioral 
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

entity Memoria_RAM is
    Port ( Clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (5 downto 0);
           DI : in  STD_LOGIC_VECTOR (31 downto 0);
           DO : out  STD_LOGIC_VECTOR (31 downto 0));
end Memoria_RAM;

architecture Behavioral of Memoria_RAM is
--architecture syn of rams_04 is
    type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
    signal RAM : ram_type:=(
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",

others => x"00000000");
begin

    process (CLK, we, A, Di)
    begin
        if (CLK'event and CLK = '1') then
--		if (EN ='1') then
            if (WE = '1') then
                RAM(to_integer(unsigned(A))/4) <= DI;
            end if;
	--	  DO <= RAM(to_integer(unsigned(A)));
--		end If;
        end if;
		end process;
   DO <= RAM(to_integer(unsigned(A))/4);
--end syn;
end Behavioral;

