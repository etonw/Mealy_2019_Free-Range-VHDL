-- Write some VHDL code that implements the 8:1 MUX
-- shown here. Use as many if statements as you deem necessary to implement
-- your design. In the black-box diagram, the CE input is a chip enable.
-- When CE = ’1’, the output acts like the MUX of Example 10.
-- When CE is ’0’, the output of the MUX is ’0’.


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

-- if   (condition)  then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;

architecture arc_my_function of my_function is 
begin

	proc_1: process(Data_in, SEL, CE) is
	begin
		
		if (CE = '1') then 
		
			if    ( SEL = "111" ) then F_CTRL <= Data_in(7);
			elsif ( SEL = "110" ) then F_CTRL <= Data_in(6);
			elsif ( SEL = "101" ) then F_CTRL <= Data_in(5);
			elsif ( SEL = "100" ) then F_CTRL <= Data_in(4);
			elsif ( SEL = "011" ) then F_CTRL <= Data_in(3);
			elsif ( SEL = "010" ) then F_CTRL <= Data_in(2);
			elsif ( SEL = "001" ) then F_CTRL <= Data_in(1);
			elsif ( SEL = "000" ) then F_CTRL <= Data_in(0);
			else F_CTRL <= '0';	--catch all condition
			end if;
			
		else F_CTRL <='0'; --catch all condition
		end if;
		
	end process proc_1;
	
end arc_my_function;