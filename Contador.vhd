----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:42:49 11/26/2020 
-- Design Name: 
-- Module Name:    Contador - Behavioral 
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
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Contador is
port(
     clk : in std_logic;
    enable : in std_logic;
    salida   : out std_logic := '0'
);
end entity;

architecture Behavioral of Contador is
    signal cuenta : integer := 0 ;

begin
		PROCESS (clk, enable)
			BEGIN
         IF clk'event AND clk='1' THEN
           IF enable='1' THEN
             cuenta <= cuenta + 1;
           END IF;
			   IF enable='0' THEN
             salida<='0';
				 cuenta <= 0;
           END IF;
			  if (cuenta = 4) then 
				salida<= '1';
			end if;
         END IF;
			
			
		
       END PROCESS;

       
		
end architecture;
