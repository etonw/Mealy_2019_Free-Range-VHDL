-- Write the VHDL code that implements the following
-- circuit. The circuit contains an input bundle of four signals and an
-- output bundle of three signals. The input bundle, D IN, represents a 4-
-- bit binary number. The output bundle, SZ OUT, is used to indicate the
-- magnitude of the 4-bit binary input number. The relationship between
-- the input and output is shown in the table below. Use a selected signal
-- assignment statement in the solution.
-- 
-- range of D IN     SZ OUT
-- 0000 to  0011      100
-- 0100 to  1001      010
-- 1010 to  1111      001
-- unknown value      000


--import libraries
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity my_decoder is
	port(
	D_IN	: in std_logic_vector;
	SZ_OUT	: out std_logic_vector
	);
end my_decoder;

--architecture
architecture arc_my_decoder of my_decoder is

begin
--evaluate this expression
	-- give SZ_OUT this value with these evaluation results
	SZ_OUT <=	"100" when "0000"|"0001"|"0010"|"0011",
				"010" when "0100"|"0101"|"0110"|"0111"|"1000"|"1001",
				"001" when "1010"|"1011"|"1100"|"1101"|"1110"|"1111",
				"000" when others;
end arc_my_decoder;

