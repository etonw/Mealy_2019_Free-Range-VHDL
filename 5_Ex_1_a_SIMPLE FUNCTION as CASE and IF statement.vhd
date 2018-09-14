-- ECW 12.09.18  Free Range VHDL 
-- For the following function, write VHDL behavioral models that implement
-- these functions using both case statements and if statements
-- (two separate models for each function).

-- a) F(A, B) = A'B + A + AB'
-- b) F(A, B, C, D) = A'CD' + B'C + BCD'
-- c) F(A, B, C, D)=(A' + B) · (B' + C + D') · (A' + D)
-- d) F(A, B, C) = Y(5, 1, 4, 3)    product of sums
-- e) F(A, B, C, D) = X(1, 2)		sum of products

-- CASE AND IF statements CAN ONLY be used in a PROCESS STATEMENT

library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
	A, B 		: in std_logic;
	F           : out std_logic
	);
end my_function;

-----------if statements------------
-- if   (condition)  then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

-- SOLN: expanded expression to F = A'B + AB + AB'

architecture arc_my_function of my_function is 
--internal signals
begin
	
	proc_1: process(AB) is	
	begin
		
		if (  (A = '0' AND B = '1') OR (A = '1' AND B = '1') OR (A = '1' AND B = '0')  ) then
			F  <= '1';
		else
			F  <= '0';
		end if;
		
	end process proc_1;
	
end arc_my_function;

---------case statements-------------
-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
	
architecture arc_my_function of my_function is 

	signal (AB) : std_logic_vector(1 downto 0);	--internal signals
	
begin
	
	AB <= A & B ;	-- group signals for case statement

	proc_1: process(AB) is	
	begin

		case  (AB) is 
		when "01"	=>  F <= '1';	
		when "11"	=>  F <= '1';   
		when "10"	=>  F <= '1';   
		when others	=>  F <= '0';	
		end case;
	
	end process proc_1;
	
end arc_my_function;
