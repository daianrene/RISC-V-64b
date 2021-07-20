----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:39 11/01/2020 
-- Design Name: 
-- Module Name:    Data_Path - Behavioral 
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

entity Data_Path is
    Port ( Ctrl_in : in  STD_LOGIC_VECTOR (10 downto 0);
           Data_Load : in  STD_LOGIC_VECTOR (31 downto 0);
           Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  UER_W_DP: in std_logic;
           ExcepSrc : in  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_out : out  STD_LOGIC_VECTOR (11 downto 0);
           Direccion : out  STD_LOGIC_VECTOR (5 downto 0);
           D_out : out  STD_LOGIC_VECTOR (31 downto 0);
           We : out  STD_LOGIC);
end Data_Path;

architecture Behavioral of Data_Path is

--Contador--
	COMPONENT Program_Counter
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		PC_next : IN std_logic_vector(31 downto 0);          
		PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
--Instrucciones--
		COMPONENT Memoria_Instrucciones
	PORT(
		PC_in : IN std_logic_vector(31 downto 0);          
		Instr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


--Banco de registros--
	COMPONENT Banco_Registros
	PORT(
		clk : IN std_logic;
		we3 : IN std_logic;
		ra1 : IN std_logic_vector(4 downto 0);
		ra2 : IN std_logic_vector(4 downto 0);
		wa3 : IN std_logic_vector(4 downto 0);
		wd3 : IN std_logic_vector(31 downto 0);          
		rd1 : OUT std_logic_vector(31 downto 0);
		rd2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
--Extensor de signo--	
	COMPONENT Extend
	PORT(
		inm : IN std_logic_vector(31 downto 0);      
		inmsource : IN std_logic_vector(1 downto 0);        
		SignInm : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
--ALU--
	COMPONENT Alu
	PORT(
		SrcA : IN std_logic_vector(31 downto 0);
		SrcB : IN std_logic_vector(31 downto 0);
		AluControl : IN std_logic_vector(2 downto 0);    
		AluResult : INOUT std_logic_vector(31 downto 0);      
		zero : OUT std_logic
		);
	END COMPONENT;
	
	
--Alu +4--	
		COMPONENT PcPlus4
	PORT(
		PcActual : IN std_logic_vector(31 downto 0);          
		PPlus4 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

--Multiplexor 2x32--	
	COMPONENT Multiplexor_2
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		Sel : IN std_logic;          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	------pctarget para branch------
	COMPONENT PcTarget
	PORT(
		PcActual : IN std_logic_vector(31 downto 0);
		inc : IN std_logic_vector(31 downto 0);          
		PcPlus : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT Memoria_Excepcion
	PORT(
		UER_W : IN std_logic;
		SDir : IN std_logic_vector(31 downto 0);          
		DirOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Mux4x32
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		C : IN std_logic_vector(31 downto 0);
		D : IN std_logic_vector(31 downto 0);
		Sel : IN std_logic_vector(1 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal pcactual_aux, pc_next_aux, instr_aux, rd1_aux, rd2_aux, inm_extend_aux, dir_aux, alu_aux, 
					rdmemory_aux, pc_plus4_aux, in_alu, alu_result, pc_excep, pc_counter_in, pc_target_aux: std_logic_vector(31 downto 0);
signal alu_ctrl : std_logic_vector (3 downto 0);
signal zero_aux, uer_aux  :std_logic;



begin
	
	Inst_Program_Counter: Program_Counter PORT MAP(
		clk => Clock,
		reset => Reset,
		PC_next => pc_counter_in,
		PC => pcactual_aux
	);
	
	
	Inst_Memoria_Instrucciones: Memoria_Instrucciones PORT MAP(
		PC_in => pcactual_aux,
		Instr => instr_aux
	);

	Inst_Banco_Registros: Banco_Registros PORT MAP(
		clk => clock,
		we3 => Ctrl_in(0),
		ra1 => instr_aux(19 downto 15),
		ra2 => instr_aux (24 downto 20),
		wa3 => instr_aux(11 downto 7),
		wd3 => rdmemory_aux,
		rd1 => rd1_aux,
		rd2 => dir_aux
	);
	
	
	Inst_Extend: Extend PORT MAP(
		inm => instr_aux,
		inmsource => Ctrl_in (2 downto 1),
		SignInm => inm_extend_aux
	);

	Inst_Alu: Alu PORT MAP(
		SrcA => rd1_aux,
		SrcB => in_alu,
		AluControl => Ctrl_in (6 downto 4),
		AluResult => alu_result,
		zero => Ctrl_out (0)
	);
	
	Inst_Multiplexor_2Alu: Multiplexor_2 PORT MAP(
		A => dir_aux,
		B => inm_extend_aux,
		Sel =>  Ctrl_in (3),
		Salida => in_alu
	);

	Inst_Multiplexor_2Result: Multiplexor_2 PORT MAP(
		A => alu_result,
		B => Data_Load,
		Sel => ctrl_in (8),
		Salida => rdmemory_aux
		);
		
		
	Inst_PcTarget: PcTarget PORT MAP(
		PcActual => pcactual_aux,
		inc => inm_extend_aux,
		PcPlus =>  pc_target_aux
	);
	
	Inst_PcPlus4: PcPlus4 PORT MAP(
		PcActual => pcactual_aux,
		PPlus4 => pc_plus4_aux
	);
	
	Inst_Multiplexor_2PCSrc: Multiplexor_2 PORT MAP(
		A => pc_plus4_aux,
		B => pc_target_aux,
		Sel =>  Ctrl_in (10),
		Salida => pc_next_aux
	);
	
	
	Inst_Memoria_Excepcion: Memoria_Excepcion PORT MAP(
		UER_W => uer_w_dp,
		SDir => pc_next_aux,
		DirOut => pc_excep
	);
	
	
	Inst_Mux4x32: Mux4x32 PORT MAP(
		A => pc_excep,
		B => pc_next_aux,
		C => x"ffffffff",
		D => x"00000000",
		Sel =>  ExcepSrc,
		Salida => pc_counter_in
	);



	Ctrl_out (11 downto 5) <= instr_aux (6 downto 0);
	Ctrl_out (4 downto 2) <= instr_aux (14 downto 12);
	Ctrl_out (1) <= instr_aux (30);
	
	
	d_out<= dir_aux ;
	Direccion <= alu_result(5 downto 0);
	We <= Ctrl_in (7);
	
end Behavioral;
