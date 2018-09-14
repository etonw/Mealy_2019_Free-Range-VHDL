-- ECW 13.09.18  Free Range VHDL 
-- For the following function, write VHDL behavioral models that implement
-- these functions using both case statements and if statements
-- (two separate models for each function).

-- a) F(A, B) = A'B + A + AB'
-- b) F(A, B, C, D) = A'CD' + B'C + BCD'
-- c) F(A, B, C, D)=(A' + B) · (B' + C + D') · (A' + D)
-- d) F(A, B, C) = Y(5, 1, 4, 3)   product of sums
-- e) F(A, B, C, D) = X(1, 2)		sum of products

-- CASE AND IF statements CAN ONLY be used in a PROCESS STATEMENT

library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
	A, B, C, D	: in std_logic;
	F           : out std_logic
	);
end my_function;

-----------if statements------------
-- if   (condition)  then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

-- SOLN: expanded expression by multiplying by one ( i.e. A' + A)
-- F = A'BCD' + A'B'CD' + AB'CD + AB'CD' + A'B'CD + ABCD' 
--     0110     0010      1011    1010      0011    1110   

architecture arc_my_function of my_function is 
--internal signals
begin
	
	proc_1: process(ABCD) is	
	begin
		
		if (  (A = '0' AND B = '1' AND C = '1' AND D = '0') OR 
			  (A = '0' AND B = '0' AND C = '1' AND D = '0') OR 
			  (A = '1' AND B = '0' AND C = '1' AND D = '1') OR 
			  (A = '1' AND B = '0' AND C = '1' AND D = '0') OR 
			  (A = '0' AND B = '0' AND C = '1' AND D = '1') OR 
			  (A = '1' AND B = '1' AND C = '1' AND D = '0') OR 	  
		) then
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

	signal (ABCD) : std_logic_vector(3 downto 0);	--internal signals
	
begin
	
	ABCD <= A & B & C & D ;	-- group signals for case statement

	proc_1: process(ABCD) is	
	begin

		case (ABCD) is 
		when "0110"	=>  F  <= '1';	
		when "0010"	=>  F  <= '1';   
		when "1011"	=>  F  <= '1';   
		when "1010"	=>  F  <= '1';	
		when "0011"	=>  F  <= '1';   
		when "1110"	=>  F  <= '1';   
		when others	=>  F  <= '0';	
		end case;
	
	end process proc_1;
	
end arc_my_function;
