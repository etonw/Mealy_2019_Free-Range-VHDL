-- 6. Provide a VHDL model of a 3:8 decoder using conditional signal
-- assignment and selected signal assignment; consider the decoder’s
-- outputs to be ACTIVE-HIGH.


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
	SZ_OUT <= "10000000" 	when D_IN = "000"  else
			  "01000000" 	when D_IN = "001"  else
			  "00100000" 	when D_IN = "010"  else
		   	  "00010000" 	when D_IN = "011"  else
			  "00001000" 	when D_IN = "100"  else
			  "00000100" 	when D_IN = "101"  else
		      "00000010" 	when D_IN = "110"  else
			  "00000001" 	when D_IN = "111"  else
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
		 SZ_OUT <=   "10000000" 	when "000",  
					 "01000000" 	when "001",  
					 "00100000" 	when "010",  
					 "00010000" 	when "011",  
					 "00001000" 	when "100", 
					 "00000100" 	when "101",  
					 "00000010" 	when "110",  
					 "00000001" 	when "111",
					'0' when others;
end arc_my_function;