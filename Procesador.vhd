----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:46 11/08/2020 
-- Design Name: 
-- Module Name:    Procesador - Behavioral 
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

entity Procesador is
    Port ( Data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Cont_out : out std_logic;
           Address : out  STD_LOGIC_VECTOR (5 downto 0);
           Data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           We : out  STD_LOGIC);
end Procesador;

architecture Behavioral of Procesador is

--Data Path--
COMPONENT Data_Path
	PORT(
		Ctrl_in : IN std_logic_vector(10 downto 0);
		Data_Load : IN std_logic_vector(31 downto 0);
		Clock : IN std_logic;
		Reset : IN std_logic; 
		uer_w_DP: in std_logic;
       ExcepSrc : in  STD_LOGIC_VECTOR (1 downto 0);         
		Ctrl_out : OUT std_logic_vector(11 downto 0);
		Direccion : OUT std_logic_vector(5 downto 0);
		D_out : OUT std_logic_vector(31 downto 0);
		We : OUT std_logic
		);
	END COMPONENT;
	
--Unidad de Control--

COMPONENT Unidad_Control
	PORT(
		OpCode : IN std_logic_vector(6 downto 0);
		funct3 : IN std_logic_vector(2 downto 0);
		funct7 : IN std_logic;
		zero : IN std_logic;   
		excepIn: in std_logic;       
		PcSrc : OUT std_logic;
		ResultSrc : OUT std_logic_vector(1 downto 0);
		MemWrite : OUT std_logic;
		ALUSrc : OUT std_logic;
		ImmSrc : OUT std_logic_vector(1 downto 0);
		RegWrite : OUT std_logic;
		UER_W_CU: out std_logic;
      ExcepSrc : out  STD_LOGIC_VECTOR (1 downto 0);
		ALUControl : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	
	------Contador-----------
	COMPONENT Contador
	PORT(
		clk : IN std_logic;
		enable : IN std_logic;          
		salida : OUT std_logic
		);
	END COMPONENT;




signal ctrl_out_aux: std_logic_vector (11 downto 0);
signal ctrl_in_aux: std_logic_vector (10 downto 0);
signal excep_aux: std_logic_vector (1 downto 0);
signal cont_aux, uer_aux:std_logic;

begin

--Data Path--
Inst_Data_Path: Data_Path PORT MAP(
		Ctrl_in => ctrl_in_aux,
		Data_Load => Data_in,
		Clock => CLK,
		Reset => Reset,
		uer_w_dp => uer_aux,
		ExcepSrc => excep_aux,
		Ctrl_out => ctrl_out_aux,
		Direccion => Address,
		D_out => Data_out,
		We => We 
	);


--Unidad de Control--
	Inst_Unidad_Control: Unidad_Control PORT MAP(
		OpCode => ctrl_out_aux (11 downto 5),
		funct3 => ctrl_out_aux (4 downto 2),
		funct7 => ctrl_out_aux (1),
		zero => ctrl_out_aux (0),
		excepIn => cont_aux,
		
		UER_W_CU => uer_aux,
		PcSrc => ctrl_in_aux (10),
		ResultSrc => ctrl_in_aux (9 downto 8),
		MemWrite => ctrl_in_aux (7) ,
		ALUControl => ctrl_in_aux (6 downto 4),
		ALUSrc => ctrl_in_aux (3),
		ImmSrc => ctrl_in_aux (2 downto 1),
		ExcepSrc => excep_aux,
		RegWrite => ctrl_in_aux (0)
	);
	
	
	Inst_Contador: Contador PORT MAP(
		clk => CLK,
		enable => excep_aux(1),
		salida => cont_aux
	);
	Cont_out <= cont_aux;

end Behavioral;

