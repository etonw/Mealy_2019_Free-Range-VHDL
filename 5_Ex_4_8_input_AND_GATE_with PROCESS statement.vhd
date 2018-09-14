-- 4. Provide a VHDL model of an 8-input AND gate using a process
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
	
		func_out <= A AND B AND C AND D AND E AND F AND G AND H;
		
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
	
		if (  (A = '1' AND B = '1' AND C = '1' AND D = '1' AND 
		       E = '1' AND F = '1' AND G = '1' AND H = '1')  then
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
	ABCDEFGH <= A & B & C & D & E & F & G & H;
	proc_1 : process (ABCDEFGH) is 
	
		case (ABCDEFGH) is 
		when "11111111"	=>  func_out <= '1';	  
		when others	=>  func_out <= '0';	-- too many other possible conditions! 
		end case;
	
	end process proc_1;	
	
end arc_my_function;