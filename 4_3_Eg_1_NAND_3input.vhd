-- Eton Williams, 10 sept, Free Range VHDL 
--
--Write the VHDL code that implements a three-input
--NAND gate. The three input signals are named A, B and C and the
--output signal name is F.
--
--
--import libraries
library IEEE;		          --make std_logic data type available
use IEEE.std_logic_1164.all;  --make std_logic data type available

--entity ( the black box)
entity nand_3input is
	port(
	A, B, C	: in std_logic; 
	F		: out std_logic;
	);
end nand_3input;	--end entity description	
	
--architecture ( what happens in the black box)
architecture nand_3input_arc of nand_3input is

-- place any internal, intermediate signals here (none needed in a simple NAND gate)

begin
--boolean expression of a 3 input NAND gate
	F	<=	NOT(A and B and C);
end nand_3input_arc;	--end architecture description
	