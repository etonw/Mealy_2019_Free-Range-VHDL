-- 6. Provide a VHDL model of an 8:1 MUX using a process statement.
-- Include a model that uses if statements and case statements (two
-- separate models).

entity my_function is 
	port(
	Data_in	: in std_logic_vector(7 downto 0);
	SEL		: in std_logic_vector(2 downto 0);
	F_CTRL  : out std_logic
	);
end my_function;

--------------------if statement----------------
-- if    (condition) then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

architecture arc_my_function of my_function is
	begin
	
	proc_1 : process (Data_in, SEL)
	
			if    ( SEL = "111" ) then F_CTRL <= Data_in(7);
			elsif ( SEL = "110" ) then F_CTRL <= Data_in(6);
			elsif ( SEL = "101" ) then F_CTRL <= Data_in(5);
			elsif ( SEL = "100" ) then F_CTRL <= Data_in(4);
			elsif ( SEL = "011" ) then F_CTRL <= Data_in(3);
			elsif ( SEL = "010" ) then F_CTRL <= Data_in(2);
			elsif ( SEL = "001" ) then F_CTRL <= Data_in(1);
			elsif ( SEL = "000" ) then F_CTRL <= Data_in(0);
		
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
	proc_1 : process (SEL) is 
	
		case (SEL) is 
		when  "111"	=>  F_CTRL <= Data_in(7);
		when  "110" =>  F_CTRL <= Data_in(6);
		when  "101" =>  F_CTRL <= Data_in(5);
		when  "100" =>  F_CTRL <= Data_in(4);
		when  "011" =>  F_CTRL <= Data_in(3);
		when  "010" =>  F_CTRL <= Data_in(2);
		when  "001" =>  F_CTRL <= Data_in(1);
		when  "000" =>  F_CTRL <= Data_in(0);
			
		when others	=>  func_out <= '0';	
		end case;
	
	end process proc_1;	
	
end arc_my_function;