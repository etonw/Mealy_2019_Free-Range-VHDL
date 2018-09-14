-- 5. Provide a VHDL model of an 8-input OR gate using a process
-- statement.

entity my_function is 
	port(
	A, B, C, D, E, F, G, H	: 	in std_logic;
	func_out		    	:	out std_logic
	);
end my_function;

------------signal assignment statement---------
architecture arc_my_function of my_function is
	begin
	
	proc_1 : process (A, B, C, D, E, F, G, H)
	
		func_out <= A OR B OR C OR D OR E OR F OR G OR H;
		
	end process proc_1;	
	
end arc_my_function;

--------------------if statement------------
-- if    (condition) then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

	
architecture arc_my_function of my_function is
	begin
	
	proc_1 : process (A, B, C, D, E, F, G, H)
	
		if (  (A = '1' OR B = '1' OR C = '1' OR D = '1' OR 
		       E = '1' OR F = '1' OR G = '1' OR H = '1')  then
			func_out  <= '1';
		else
			func_out  <= '0';
		end if;
		
	end process proc_1;	
	
end arc_my_function;


---------case statement-------------
-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
		  
architecture arc_my_function of my_function is
	signal (ABCDEFGH)  : std_logic_vector(7 downto 0);
	
	begin
	ABCDEFGH <= A & B & C & D & E & F & G & H;  --concantenation
	proc_1 : process (ABCDEFGH) is 
	
		case (ABCDEFGH) is 
		when "00000000"	=>  func_out <= '0';	  
		when others	=>  func_out <= '1';	-- too many other possible conditions! 
		end case;
	
	end process proc_1;	
	
end arc_my_function;