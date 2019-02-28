-- ECW 20.09.18
-- FREE RANGE VHDL CHAP 9
-- PAGE 123

-------XNOR function

entity big_xnor is 
	port(A, B : in std_logic;
		F	  : out std_logic);
end big_xnor;

architecture ckt1 of big_xnor is 
begin
	F <= not ( ( A and ( not B) )or ( (not A) and B) );
end ckt1;


-----3-input AND
entity big_and3 is 
	port(A,B,C : in std_logic;
		F	   : out std_logic);
end big_and3;

architecture ckt1 of big_and3 is 
begin
	F <= ( A and B and C );
end ckt1;