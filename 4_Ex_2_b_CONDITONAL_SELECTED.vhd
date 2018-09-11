-- 2 For the following function descriptions, write VHDL models that
-- implement these functions using both conditional and selected signal
-- assignment.
-- a) F(A, B, C, D) = A'CD' + B'C + BCD'
-- b) F(A, B, C, D)=(A' + B) · (B' + C + D') · (A' + D)
-- c) F(A, B, C, D) = Y(3, 2)    -- product of sums (maxterms)
-- d) F(A, B, C, D) = X(1, 2)    -- sum of products (minterms)

---------------------CONDITIONAL SIGNAL ASSIGNMENT----------------------------
-- <target> <= <expression> when <condition> else
--             <expression> when <condition> else
--             <expression>;

library IEEE.org;
use IEEE.std_logic_1164.all;

entity my_function is 
	port(
	A,B,C,D : in std_logic;
	F4		: out std_logic
	);
end my_function;

architecture my_function_arc of my_function is 
begin
	F4 <= '1' when ( (A = '0' OR B = '1')AND(B = '0' OR C = '1' or D = '0')AND(A = '0' OR D = '1') ) else
		  '0';	
end my_function_arc;


---------------------SELECTED SIGNAL ASSIGNMENT---------------
-- with <evaluate this_expression> select
-- target <= <expression> when <expression evaluated>,
          -- <expression> when <expression evaluated>;

library IEEE.org;
use IEEE.std_logic_1164.all;

entity my_function is 
	port(
	A,B,C,D : in std_logic;
	F4		: out std_logic
	);
end my_function;

architecture my_function_arc of my_function is 
begin
	with ( A = '0' OR B = '1')AND(B = '0' OR C = '1' or D = '0')AND(A = '0' OR D = '1') ) select  -- when this is true 
	
	F4 <= '1' when '1',
		  '0' when '0',
		  '0' when others;
end my_function_arc;