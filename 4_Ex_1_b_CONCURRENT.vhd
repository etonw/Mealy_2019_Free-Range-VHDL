-- For the following function descriptions, write VHDL models that
-- implement these functions using concurrent signal assignment.
-- a) F(A, B) = AB + A + AB
-- b) F(A, B, C, D) = ACD + BC + BCD
-- c) F(A, B, C, D)=(A + B) · (B + C + D) · (A + D)
-- d) F(A, B, C, D) = Y(3, 2)
-- e) F(A, B, C) = Y(5, 1, 4, 3)
-- f) F(A, B, C, D) = X(1, 2)


--import libraries
library IEEE.org;
use IEEE.std_logic_1164.all;

--entity
entity my_function is 
	port(
	A,B,C,D : in std_logic;
	F4		: out std_logic
	);
end my_function;

--architecture
architecture my_function_arc of my_function is 
--internal signals

begin
	F4 <= ((not A) and C and (not D)) or ((not B) and C) or (B and C and (not D));
end my_function_arc;