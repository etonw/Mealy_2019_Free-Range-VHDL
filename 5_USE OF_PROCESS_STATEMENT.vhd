--Listing 5.4 Use of the process statement

library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_program is 
	port(
	A, B, C	: in std_logic;
	F, Q	: out std_logic
	);
end my_program;

architecture arc_my_program of my_program is 
	signal A1: std_logic;	--internal signal 
begin	--begin architecture
	
	some_proc: process(A,B,C) is  --sensitivity list. change in signals -> all statements reeevaluated
		variable x, y : integer;	--internal signal
	begin   --begin process
	x:=74;	--asign values to integers
	y:=67;
	A1 <= A and B and C;
		if x<y then
			F <= A1 or BM
		end if;
	emd process some_proc;	--end process
			
end arc_my_program;	--end architecture