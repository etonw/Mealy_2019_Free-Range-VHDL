-- For the following function descriptions, write VHDL models that
-- implement these functions using concurrent signal assignment.
-- a) F(A, B) = AB + A + AB
-- b) F(A, B, C, D) = ACD + BC + BCD
-- c) F(A, B, C, D)=(A + B) · (B + C + D) · (A + D)
-- d) F(A, B, C, D) = Y(3, 2)     -- product of sums (maxterms)
-- e) F(A, B, C) = Y(5, 1, 4, 3)  -- product of sums (maxterms)
-- f) F(A, B, C, D) = X(1, 2)     -- sum of products (minterms)



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
	F4 <= ((NOT A)AND(NOT B)AND(NOT C)AND(NOT D)) OR
	      ((NOT A)AND(NOT B)AND(NOT C)AND(D));
end my_function_arc;