--ECW 17.09.18  Free Range VHDL 
--Chp 8 Finite State Machine Design Using VHDL

--library declaration
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity my_fsm1 is 
	port(
		TOG_EN   : in std_logic;
		CLK, CLR : in std_logic;
		Z1		 : out std_logic
		);
end my_fsm1;

--architecture
architecture fsm1 of my_fsm1 is
	type state_type is (ST0, ST1);  --enumeration type to represent different states
	signal PS, NS   : state_type;
begin	
	synch_proc: process (CLK, NS, CLR)
	begin
		--take care of asychronous input ( to reset)
		if (CLR = '1') then PS <= ST0;  -- reset state here
		elsif (rising_edge(CLK)) then PS <= NS;
		end if;	--PS not specified for all states= storage element
	end process synch_proc;
	
	comb_proc: process(PS, TOG_EN)
	begin
		Z1 = '0'; 
			case PS is   -- deciding what happens with different values of present state 
				when ST0  =>	--regarding state ST0
					Z1 <= '0';	-- Moore output
					if (TOG_EN = '1') then NS <= ST1; --sets value for NEXT STATE. 
					else NS <= ST0; --here it remains in same state 
					end if;
				when ST1  =>	--regarding state ST1
					Z1 <= '1';	--Moore output
					if (TOG_EN = '1') then NS <= ST0;
					else NS <= ST1;  --remains in same state
					end if;
				when others =>	--catch all condition
					Z1 <= '0';	--
					NS <= ST0;	--make it to these two statements
			end case;
	end process comb_proc;
end fsm1;


---------case statements-------------
-- case (expression) is 
	-- when choices  => <sequential statements>;
	-- when choices  => <sequential statements>;
	-- when others	 => <sequential statements>
	-- end case;
	
	-----------if statements------------
-- if   (condition)  then <statements>
-- elsif (condition) then <statements>
-- else <statements>
-- end if;
