--ECW 15.09.18
--FREE RANGE VHDL, p.81
--Model of a simple flip flop

-- EXAMPLE 16. Write the VHDL code that describes a D 
-- flip-flop shown on the right. Use a behavioral
-- model in your description. Consider the R input 
-- to be an active-high, asynchronous input that resets 
-- the D flip flop outputs when asserted. 

-- NB! CLK SYMBOL ON DIAGRAM HAS A LINE OVER IT.
-- MEANS THAT IT IS FALLING EDGE TRIGGERED ?

-------------------------------------------------------------------
-- RET D FLIP-FLOP MODEL WITH ACTIVE-HIGH ASYNCHRONOUS RESET INPUT.
-------------------------------------------------------------------

--library declation
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity d_ff_r is 
	port(
		D, R : in std_logic;
 		CLK  : in  std_logic;
		Q	 : out std_logic;
		);
end d_ff_r;

--architecture
architecture my_d_ff_r of d_ff_r is
begin
	dff: process(R, CLK)
	begin				
		if (R = '1') then	--active LOW input
			Q <= '0';
		elsif(falling_edge(CLK)) then
			Q <= D;					Q 
		end if;
	end process dff;
end my_d_ff_r;

