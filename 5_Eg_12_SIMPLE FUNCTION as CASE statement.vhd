-- EXAMPLE 12. Write some VHDL code that implements the following
-- function using the case statement: F OUT(A, B, C) = AB'C '+ Bc
--SOLN  involves rewriting to F = AB'C' + ABC + A'BC

-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
	
library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
	A, B, C		: in std_logic;
	F3          : out std_logic
	);
end my_function;

architecture arc_my_function of my_function is 
    --internal signals
	signal ABC: std_logic_vector(2 downto 0);	

begin
	ABC <= A & B & C; -- group signal for case statement
	proc_1: process(ABC) is	-- use only this new variable 

	begin
		
		case  (ABC) is 
		when "100"	=>  F3 <= '1';	 --AB'C'
		when "111"	=>  F3 <= '1';   --ABC
		when "011"	=>  F3 <= '1';   --A'BC
		when others	=>  F3 <= '0';	
		end case;
		
	end process proc_1;
	
end arc_my_function;

-------------------
case  (ABC) is 
		when "100"	=>  F3 <= '1';	
		when "-11"	=>  F3 <= '1';   -- DONT'T CARE FEATURE. AVOID USING
		when others	=>  F3 <= '0';	
		end case;