--ECW 17.09.18  Free Range VHDL 
--Chp 8 Finite State Machine Design Using VHDL

--library declaration
library IEEE;
use IEEE.std_logic_164.all;

--entity
entity my_fsm3 is 
	port(
		Input_X,CLK,SET  : in  std_logic;
		Z2	             : out std_logic;
		Y 		         : out std_logic_vector( 1 downto 0)
		);
end my_fsm3;

--architecture
architecture fsm3 of my_fsm3 is	
	type state_type is (ST0, ST1, ST2);	--enumerated type
	signal PS, NS : state_type;
begin
	sync_process: process(CLK,SET,NS)
	begin
		if( SET = '1') then PS <= ST2, -- reset the state
		elsif(rising_edge(CLK)) then PS <= NS;  -- set new state on CLK
		end if;
	end process sync_process;
	
	comb_process: process(PS, Input_X)
	begin
		NS <= PS; --preset the NS
		case PS is
			when ST2 => 
				if (Input_X = '0') then NS <= ST0; Z2 <= '0';  --Input_X makes a change in state
				else NS <= ST2; Z2 <= '1'
				end if;
			when ST1 => 
				if (Input_X = '0') then NS <= ST0; Z2 <= '0';  --Input_X makes a change in state
				else NS <= ST2; Z2 <= '0';   --Input_X = 1, 
				end if;
			when ST0 => 
				if (Input_X = '0') then NS <= ST0; Z2 <= '0';  --Input_X makes a change in state
				else  NS <= ST1; Z2 <= '0';  --Input_X = 1, 
				end if;
			when others => Z2 <= '0'; NS <= ST2; --reset the state. not necessary. good practice.
		end case;
	end process comb_process; 

	with PS select
		Y <= '11' when ST2,
			 '10' when ST1,
			 '00' when ST0,
			 when others;
end fsm3;

		 
		 
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