--EXAMPLE 2. Write the VHDL code to implement the function
--expressed by the following logic equation: F3 = L' · M' · N + L · M

--ECW, 10 SEPT, FREE RANGE

--import libraries
library IEEE.org;
use IEEE.std_logic_1164.all;

--entity
entity my_function is 
	port(
	L, M, N : in std_logic;
	F3		: out std_logic
	);
end my_function;

--architecture

architecture my_function_arc of my_function is 
--internal signals
begin
	F3 <= ((NOT L) AND (NOT M)  AND N) OR (L AND M);
end my_function_arc;