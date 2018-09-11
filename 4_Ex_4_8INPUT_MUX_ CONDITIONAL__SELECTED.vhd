-- 3. Provide a VHDL model of an 8:1 MUX using conditional signal
-- assignment and selected signal assignment.


-------------CONDITIONAL SIGNAL ASSIGNMENT--------------------
-- <target> <= <expression> when <condition> else
--             <expression> when <condition> else
--             <expression>;

entity my_function is 
	port(
	A, B, C, D, E, F, G, H	: 	in std_logic;
	SEL						:   in std_logic_vector(7 downto 0);
	MX_OUT 			    	:	out std_logic
	);
end my_function;
	
architecture arc_my_function of my_function is
begin
	MX_OUT <= A 	when SEL = "000"  else
			  B 	when SEL = "001"  else
			  C 	when SEL = "010"  else
		   	  D 	when SEL = "011"  else
			  E 	when SEL = "100"  else
			  F 	when SEL = "101"  else
		      G 	when SEL = "110"  else
			  H 	when SEL = "111"  else
			 '0';
end arc_my_function;


--------------SELECTED SIGNAL ASSIGNMENT----------------------
-- with <evaluate this_expression> select
-- target <= <expression> when <expression evaluated>,
          -- <expression> when <expression evaluated>;
		  
entity my_function is 
	port(
	A, B, C, D, E, F, G, H	: 	in std_logic;
	SEL						:   in std_logic_vector(7 downto 0);
	MX_OUT 			    	:	out std_logic
	);
end my_function;
	
architecture arc_my_function of my_function is
begin
	with SEL select -- evaluate this expression
	MX_OUT <=   A 	when "000",  
				B 	when "001",  
				C 	when "010",  
				D 	when "011",  
				E 	when "100", 
				F 	when "101",  
				G 	when "110",  
				H 	when "111",
				'0' when others;
end arc_my_function;