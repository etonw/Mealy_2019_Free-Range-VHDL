--ECW 17.09.18  Free Range VHDL 
--Chp 8 Finite State Machine Design Using VHDL

--library declaration
library IEEE;
use IEEE.std_logic_164.all;

--entity
entity my_fsm2 is 
	port(
		TOG_EN   : in std_logic;
		CLK, CLR : in std_logic;
		Y, Z1	 : in std_logic
		);
end my_fsm2;

--architecture
architecture fsm2 of my_fsm2 is	
	type state_type is (ST0, ST1);	--enumerated type
	signal PS, NS : state_type;
begin

	sync_process: process(CLK,CLR,NS)
	begin
		if( CLR = '1') then PS <= ST0, -- reset the state
		elsif(rising_edge(CLK)) then PS <= NS;  -- set new state on CLK
		end if;
	end process sync_process;
	
	comb_process: process(PS, TOG_EN)
	begin
		case PS is
			when ST0 => Z1 <= '0';  -- in this state, that output
				if ( TOG_EN = '1') then NS <= ST1  --TOG_EN makes a change in state
				else NS <= ST0;   --else remain in same state
				end if;
			when ST1 => Z1 <= '1'; -- in this state, that output
				if (TOG_EN = '1') then NS <= ST0;  --TOG_EN makes a change in state
				else NS <= ST1; --remain in same state
				end if;
			when others => Z1 <= '0'; --catch all condition
				NS <= ST0; --reset the state
		end case;
	end process comb_process; 

with PS select
	Y <= '0' when ST0,
	     '1' when ST1,
		 '0' when others;
		 
end fsm2;

		 
		 
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
-- end if