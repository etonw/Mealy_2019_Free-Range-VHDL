--Listing 5.4 Use of the IF process statement to implement simple function
--F(A,B,C) = AB'C' + BC

-- if   (condition)  then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;


library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
	A, B, C	: in std_logic;
	F3		: out std_logic
	);
end my_function;

architecture arc_my_function of my_function is 
begin

	proc_1: process(A, B, C) is
	begin
	
		if (  (A = '1' AND  B = '0' AND C = '0') OR (B = '1' AND C = '1')  ) then
			F3 <= '1';
		else
			F3 <= '0';
		end if;
		
	end process proc_1;
end arc_my_function;