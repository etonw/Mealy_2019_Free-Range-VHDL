-- EXAMPLE 10. Write some VHDL code that implements
-- the 8:1 MUX shown below. Use an if statement in your
-- implementation.

-- if    (condition) then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

library IEEE.org;
use IEEE.STD_LOGIC_1164.ALL;

entity my_function is 
	port(
	Data_in	: in std_logic_vector(7 downto 0);
	SEL		: in std_logic_vector(2 downto 0);
	F_CTRL  : out std_logic
	);
end my_function;

architecture arc_my_function of my_function is 
begin

	proc_1: process(Data_in, SEL) is
	begin
	
		if    ( SEL = "111" ) then F_CTRL <= Data_in(7);
		elsif ( SEL = "110" ) then F_CTRL <= Data_in(6);
		elsif ( SEL = "101" ) then F_CTRL <= Data_in(5);
		elsif ( SEL = "100" ) then F_CTRL <= Data_in(4);
		elsif ( SEL = "011" ) then F_CTRL <= Data_in(3);
		elsif ( SEL = "010" ) then F_CTRL <= Data_in(2);
		elsif ( SEL = "001" ) then F_CTRL <= Data_in(1);
		elsif ( SEL = "000" ) then F_CTRL <= Data_in(0);
		else F_CTRL <= '0';
		end if;
		
	end process proc_1;
end arc_my_function;