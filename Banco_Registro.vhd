
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Banco_Registros is
	port(	clk: in STD_LOGIC;
			we3: in STD_LOGIC;
			ra1, ra2, wa3:in STD_LOGIC_VECTOR(4 downto 0);
			wd3: in STD_LOGIC_VECTOR(31 downto 0);
			rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0));
end Banco_Registros;

architecture behav of Banco_Registros is
	type ramtype is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
	signal mem: ramtype:=(
	 
x"00000000", --0
x"00000000", --1
x"00000000", --2
x"00000000", --3
x"00000000", --4
x"00000000", --5
x"00000000", --6
x"00000000", --7
x"00000000", --8
x"00000000", --9
x"00000000", --10
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
-- three-ported register file, --read two ports combinationally
-- write third port on rising edge of clock
	process(clk)
	begin
		if clk'event and clk = '1' then
			if we3 = '1' then 
				mem(to_integer(unsigned(wa3))) <= wd3;
			end if;
		end if;
	end process;

	process (ra1, ra2) --mem
	begin	
	-- $r0 = x"00000000"
		if (to_integer(unsigned(ra1)) = 0) then 
			rd1 <= X"00000000";
				else 
			rd1 <= mem(to_integer(unsigned(ra1)));
		end if;
		if (to_integer(unsigned(ra2)) = 0) then 
			rd2 <= X"00000000";
		else 
			rd2 <= mem(to_integer(unsigned(ra2)));
		end if;
	end process;
end behav;
