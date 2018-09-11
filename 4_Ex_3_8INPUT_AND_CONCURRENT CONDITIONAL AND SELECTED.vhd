-- 3. Provide a VHDL model of an 8-input AND gate using concurrent,
-- conditional and selected signal assignment.

-------------CONCURRENT SIGNAL ASSIGNMENT-----------------
--   <target> <= <expression>

library IEEE.org
use.IEEE.std_logic_1164.all;

entity my_function is 
	port(
	A, B, C, D, E, F, G, H	: 	in std_logic;
	func_out		    	:	out std_logic
	);
end my_function;
	
architecture arc_my_function of my_function is
	begin
	func_out <= (A AND B AND C AND D AND E AND F AND G AND H);
end arc_my_function;


-------------CONDITIONAL SIGNAL ASSIGNMENT--------------------
-- <target> <= <expression> when <condition> else
--             <expression> when <condition> else
--             <expression>;

entity my_function is 
	port(
	A, B, C, D, E, F, G, H	: 	in std_logic;
	func_out		    	:	out std_logic;
	);
end my_function;
	
architecture arc_my_function of my_function is
	begin
	func_out <= '1' when (A = '1' AND B = '1' AND C = '1'AND D = '1' AND E = '1' AND F = '1' AND G = '1' AND H = '1') else
	            '0';
end arc_my_function;


--------------SELECTED SIGNAL ASSIGNMENT----------------------
-- with <evaluate this_expression> select
-- target <= <expression> when <expression evaluated>,
          -- <expression> when <expression evaluated>;
		  
entity my_function is 
	port(
	A, B, C, D, E, F, G, H	: 	in std_logic;
	func_out		    	:	out std_logic;
	);
end my_function;
	
architecture arc_my_function of my_function is
	begin
	with (A = '1' AND B = '1' AND C = '1'AND D = '1' AND E = '1' AND F = '1' AND G = '1' AND H = '1') select
	func_out <= '1' when '1'.
				'0' when '0',
				'0' when others;
end arc_my_function;