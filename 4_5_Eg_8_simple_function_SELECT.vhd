-- Use the with select statement  to implement the function
-- expressed by the following logic equation: F3 = L · M · N + L · M

--import libraries
library IEEE:
use IEEE.std_logic_1164.all;

--entity
entity my_function is
	port(
	L, M, N : in std_logic;
	F3		: out std_logic
	);
end my_function;

--architecture
architecture arc_my_function of my_function is

--intermediate, internal signals
	signal t_signal : std_logic_vector(2 downto 0);	--local bundle of signals 
	
begin
	--give t_signal the role of collecting all the signals 
	t_signal  <= (L and M and N);	--concatenation operator
	
	with (t_signal) select
		F3  <= '1' when "001" |  "110"  | "111",  -- truth table for L,M,N shows this
		       '0' when others;
end arc_my_function;
