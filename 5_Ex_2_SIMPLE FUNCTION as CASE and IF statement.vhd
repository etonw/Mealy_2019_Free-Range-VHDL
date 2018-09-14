-- ECW 13.09.18  Free Range VHDL 
-- For the circuit below, write the VHDL behavioral model that implements
-- it using both case statements and if statements (two
-- separate models)

-- CASE AND IF statements CAN ONLY be used in a PROCESS STATEMENT

library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
		A_1, A_2, B_1, B_2, D_1: in std_logic;
        E_out   	           : out std_logic
	);
end my_function;

-----------if statements------------
-- if   (condition)  then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

-- SOLN: 
-- E_out = (A_1 AND A_2) OR (B_1 AND B_2) OR (B_2 AND (NOT D_1)) 

architecture arc_my_function of my_function is 
--internal signals
begin
	
	proc_1: process(A_1, A_2, B_1, B_2, D_1) is	
	begin
		
		if (  (A_1 = '1' AND A_2 = '1') OR 
			  (B_1 = '1' AND B_2 = '1') OR
			  (B_2 = '1' AND D_1 = '0') 
		) then
			E_out  <= '1';
		else
			E_out  <= '0';
		end if;
		
	end process proc_1;
	
end arc_my_function;

---------case statements-------------
-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
	
architecture arc_my_function of my_function is 

	signal (CREW) : std_logic_vector(4 downto 0);	--internal signals
	
begin
	
	CREW <= A_1 & A_2 & B_1 & B_2 & D_1 ;	-- group signals for case statement

	proc_1: process(CREW) is	
	begin
	
-- solution requires an expansion of the function that is too time consuming. 
-- IF THEN ELSE is the better solution

		case  (CREW) is 
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';	
		when "xxxxx"	=>  E_out <= '1';			
		end case;
	
	end process proc_1;
	
end arc_my_function;
