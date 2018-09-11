-- ECW 10.SEPT.2018 Free Range 4.4 Conditional Signal Assignment

-- Write the VHDL code that implements a 4:1 MUX
-- using a single conditional signal assignment statement.
-- The inputs to the MUX are data inputs D3, D2, D1, D0 
-- and a two-input control bus SEL. The single output is MX OUT.


--import libraries
library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity  my_4_to_1_MUX is
	port(
	D3, D2, D1, D0 :	in std_logic;
	SEL			   :	in std_logic_vector(1 downto 0);
	MX_OUT		   :	out  std_logic
	);
end my_4_to_1_MUX;

--architecture
architecture mux4t1 of my_4_to_1_MUX is

begin
MX_OUT <= D3 when SEL = "11"  else	--double qoutes used for values with multiple signals
		  D2 when SEL = "10"  else	
		  D1 when SEL = "01"  else	
		  D0 when SEL = "00"  else	
		  '0';
end mux4t1;