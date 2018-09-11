-- 7. Provide a VHDL model of a 3:8 decoder using conditional signal
-- assignment and selected signal assignment; consider the decoder’s
-- outputs to be ACTIVE-LOW.


-------------CONDITIONAL SIGNAL ASSIGNMENT--------------------
-- <target> <= <expression> when <condition> else
--             <expression> when <condition> else
--             <expression>;

entity my_function is 
	port(
	D_IN	: 	in std_logic_vector(2 downto 0);
	SZ_OUT	:   in std_logic_vector(7 downto 0);
	);
end my_function;
	
architecture arc_my_function of my_function is
begin
	SZ_OUT <= "01111111" 	when D_IN = "000"  else
			  "10111111" 	when D_IN = "001"  else
			  "11011111" 	when D_IN = "010"  else
		   	  "11101111" 	when D_IN = "011"  else
			  "11110111" 	when D_IN = "100"  else
			  "11111011" 	when D_IN = "101"  else
		      "11111101" 	when D_IN = "110"  else
			  "11111110" 	when D_IN = "111"  else
			 '0';
end arc_my_function;


--------------SELECTED SIGNAL ASSIGNMENT----------------------
-- with <evaluate this_expression> select
-- target <= <expression> when <expression evaluated>,
          -- <expression> when <expression evaluated>;
		  
entity my_function is 
	port(
	D_IN	: 	in std_logic_vector(2 downto 0);
	SZ_OUT	:   in std_logic_vector(7 downto 0);
	);
end my_function;
	
architecture arc_my_function of my_function is
begin
	with D_IN select -- evaluate this expression
	SZ_OUT <  "01111111" 	when  "000",
			  "10111111" 	when  "001",
			  "11011111" 	when  "010",
		   	  "11101111" 	when  "011",
			  "11110111" 	when  "100",
			  "11111011" 	when  "101",
		      "11111101" 	when  "110",
			  "11111110" 	when  "111",
					'0' when others;
end arc_my_function;