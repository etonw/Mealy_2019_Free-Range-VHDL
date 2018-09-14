-- EXAMPLE 13. Write some
-- ETON WILLIAMS, 12.09.18
-- FREE RANGE VHDL

--  VHDL code that implements the
-- 8:1 MUX shown below. Use a case
-- statement in your design. In the
-- black-box diagram shown below,
-- the CE input is a chip enable. When
-- CE = ’1’, the output acts like the
-- MUX of Example 10. When CE is
-- ’0’, the output of the MUX is ’0’.

-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
	
library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
	Data_in	: in std_logic_vector(7 downto 0);
	SEL		: in std_logic_vector(2 downto 0);
	CE		: in std_logic;
	F_CTRL  : out std_logic
	);
end my_function;

architecture arc_my_function of my_function is 
begin

	proc_1: process(Data_in, SEL, CE) is
	begin
		
		if (CE = '1') then 
		
			case (SEL) is 
			
			when  "111" => F_CTRL <= Data_in(7);
			when  "110" => F_CTRL <= Data_in(6);
			when  "101" => F_CTRL <= Data_in(5);
			when  "100" => F_CTRL <= Data_in(4);
			when  "011" => F_CTRL <= Data_in(3);
			when  "010" => F_CTRL <= Data_in(2);
			when  "001" => F_CTRL <= Data_in(1);
			when  "000" => F_CTRL <= Data_in(0);
			when others F_CTRL <= '0';	--catch all condition			end if;
			
			end case;
			
		else F_CTRL <='0'; --catch all condition
		end if;
		
	end process proc_1;
	
end arc_my_function;