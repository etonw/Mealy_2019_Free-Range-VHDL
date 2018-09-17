--ECW 15.09.18
--FREE RANGE VHDL, p.79
--Model of a simple flip flop

-- EXAMPLE 17. Write the VHDL
-- code that describes a T flip flop shown on the right. Use a behavioral
-- model in your description. Consider the S input to be an active-low, asyn-
-- chronous input that sets the T flip flop outputs when asserted.

----------------------------------------------------------------
-- RET T FLIP-FLOP MODEL WITH ACTIVE-LOW ASYNCHRONOUS SET INPUT. 
----------------------------------------------------------------

--library declaration
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity t_ff_s is 
	port(
		T, S, CLK   : in  std_logic;
		Q           : out std_logic;
		);
end t_ff_s;

--architecture
architecture my_t_ff_s of t_ff_s is
	signal t_tmp  : std_logic; --intermediate signal declaration
begin
	tff: process(S, CLK)
	begin
		if (S = '0') then   -
			t_tmp <= '1'; 
		elsif (rising_edge(CLK)) then   
			t_tmp <= T XOR t_tmp;	--temp output assignment
		end if;		
	end process tff;	
	Q <= t_tmp;	-- final output assignment	
end my_t_ff_s;

