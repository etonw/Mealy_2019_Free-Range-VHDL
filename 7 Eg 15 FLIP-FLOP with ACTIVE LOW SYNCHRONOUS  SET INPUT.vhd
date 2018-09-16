--ECW 15.09.18
--FREE RANGE VHDL, p.79
--Model of a simple flip flop

-- EXAMPLE 15. Write the VHDL code that describes a D 
-- flip-flop shown on the right. Use a behavioral
-- model in your description. Consider the S input 
-- to be an active-low, synchronous input that sets 
-- the D flip flop outputs when asserted. 

-- asynchronous it can occur at any time and at irregular intervals. 
-- Communication within a computer, is usually synchronous and
-- is governed by the microprocessor clock.

-------------------------------------------------------------------
-- RET D FLIP-FLOP MODEL WITH ACTIVE-LOW SYNCHRONOUS SET INPUT.
-------------------------------------------------------------------

--library declation
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity d_ff_al is 
	port(
		D, S : in std_logic;
 		CLK  : in  std_logic;
		Q	 : out std_logic;
		);
end d_ff_al;

--architecture
architecture my_d_ff_al of d_ff_al is
begin
	dff: process(CLK)
	begin
			if (rising_edge(CLK))	then  -- when clk'event and CLK ='1'
				
				if (S = '0') then	--active LOW input
					Q <= '1';
				else
					Q <= D;					Q 
				end if;

			end if;
	end dff;
end my_d_ff_al;


-- The S input to the flip flop is made synchronous by 
-- only allowing it to affect the operation of the 
-- flip flop on the rising edge of the system clock.

-- In an if-else statement, once one condition
-- evaluates as true, none of the other conditions is checked.

-- In other
-- words, the D input is transferred to the output only on the rising edge
-- of the clock and only if the S input is not asserted.