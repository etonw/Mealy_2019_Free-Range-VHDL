-- 7. Provide a VHDL model of a 3:8 decoder using a process statement.
-- Include a model that uses if statements and case statements (two
-- separate models). Consider the outputs to be active low.

entity my_function is 
	port(
	Data_in	: in  std_logic_vector(3 downto 0);
	SZ_OUT	: in  std_logic_vector(7 downto 0)
	);
end my_function;

--------------------if statement----------------
-- if    (condition) then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

architecture arc_my_function of my_function is
	begin
	
	proc_1 : process (Data_in)
	
		if    ( Data_in = "111" ) then SZ_OUT <= "01111111";
		elsif ( Data_in = "110" ) then SZ_OUT <= "10111111";
		elsif ( Data_in = "101" ) then SZ_OUT <= "11011111";
		elsif ( Data_in = "100" ) then SZ_OUT <= "11101111";
		elsif ( Data_in = "011" ) then SZ_OUT <= "11110111";
		elsif ( Data_in = "010" ) then SZ_OUT <= "11111011";
		elsif ( Data_in = "001" ) then SZ_OUT <= "11111101";
		elsif ( Data_in = "000" ) then SZ_OUT <= "11111110";;
	
	end process proc_1;	
	
end arc_my_function;


--------------------case statement---------------
-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
		  
architecture arc_my_function of my_function is
	begin
	proc_1 : process (Data_in) is 
	
		case (Data_in) is 
		when  "111"	=>  SZ_OUT <= "01111111";
		when  "110" =>  SZ_OUT <= "10111111";
		when  "101" =>  SZ_OUT <= "11011111";
		when  "100" =>  SZ_OUT <= "11101111";
		when  "011" =>  SZ_OUT <= "11110111";
		when  "010" =>  SZ_OUT <= "11111011";
		when  "001" =>  SZ_OUT <= "11111101";
		when  "000" =>  SZ_OUT <= "11111110";
		when others	=>  SZ_OUT <= '0';	-- catch all condition
		end case;
	
	end process proc_1;	
	
end arc_my_function;