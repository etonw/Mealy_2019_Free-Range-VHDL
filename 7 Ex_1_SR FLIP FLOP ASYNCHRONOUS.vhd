--ECW 16.09.18
--FREE RANGE VHDL, p.86
--Exercises: Using VHDL for Sequential Circuits

-- EXERCISE 1. Provide a VHDL behavioral
-- model of the D flip-flop shown on the right.
-- The S and R inputs are an active low asynchronous
-- preset and clear. Assume both the
-- S and R inputs will never be asserted simultaneously.

--library
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity d_ff is 
	(
	S, R, D, CLK  : in std_logic;
	Q, Q_bar     : out std_logic
	);
end d_ff;

--architecture
architecture arc_d_ff of d_ff is 
--internal signals
begin
	dff: process(S, R, CLK, Q)
		begin
			if (S = '0') then Q <= '1'; Q_bar <= '0';
			elsif (R = '0') then Q <= '0'; Q_bar <= '1';
			elsif (rising_edge(CLK)) then  -- should this be outside RE: "regardless of the clock"
			Q <= D; Q_bar <= not D; 
			end if; 
	end process dff;
end arc_d_ff;


-- ETON NOTES: S and R are active low. S= '0' , R = '0'

-- When the preset input is activated, S = '0' 
-- the flip-flop will be set (Q=1, not-Q=0) 
-- regardless of any of the synchronous inputs or 
-- the clock. When the clear input is activated, R = '0 
-- the flip-flop will be reset (Q=0, not-Q=1), 
-- regardless of any of the synchronous inputs or the clock.