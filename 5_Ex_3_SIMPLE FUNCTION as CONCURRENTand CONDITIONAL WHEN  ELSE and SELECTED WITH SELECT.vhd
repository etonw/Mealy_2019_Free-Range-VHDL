-- ECW 13.09.18  Free Range VHDL 
-- 3. Model the previous circuit using concurrent, conditional, or selected
-- signal assignment.

-- SOLN: 
-- E_out <= (A_1 AND A_2) OR (B_1 AND B_2) OR (B_2 AND (NOT D_1)) 

library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
		A_1, A_2, B_1, B_2, D_1: in std_logic;
        E_out   	           : out std_logic
	);
end my_function;

---------------CONCURRENT SIGNAL ASSIGNMENT-----------------
architecture arc_my_function of my_function is 
begin
	E_out <= (A_1 AND A_2) OR (B_1 AND B_2) OR (B_2 AND (NOT D_1));
	
end arc_my_function;


---------------------CONDITIONAL SIGNAL ASSIGNMENT-----------
-- <target> <= <expression> when <condition> else
--             <expression> when <condition> else
--             <expression>;
architecture arc_my_function of my_function is 
begin
	E_out <= '1' when (A_1 = '1' AND A_2 = '1') else
	         '1' when (B_1 = '1' AND B_2 = '1') else
	         '1' when (B_2 = '1' AND D_1 = '0') else
			 '0';
end arc_my_function;


---------------------SELECTED SIGNAL ASSIGNMENT--------------
-- with <evaluate this_expression> select
-- target <= <expression> when <expression evaluated>,
          -- <expression> when <expression evaluated>;
architecture arc_my_function of my_function is 
begin
	with (  (A_1 AND A_2) OR 
		    (B_1 AND B_2) OR 
		    (B_2 AND (NOT D_1) )  ) select 
	
	E_out <= '1' when '1',
			 '0' when '0',
			 '0' when others;
end arc_my_function;
