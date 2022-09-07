library IEEE;  		-- The IEEE created the IEEE VHDL library and std_logic type in standard 1164
use IEEE.STD_LOGIC_1164.ALL;		 -- Using all in standard 1164 from IEEE library.
--use IEEE.STD_LOGIC_UNSIGNED.ALL; 	-- Using all in standard unsigned from IEEE library.

entity INVERTER is
Port
(
	A:	in STD_LOGIC;  -- Input A, single bit input as standard logic.
	B:	out STD_LOGIC  -- Output B, single bit output as standard logic.
	);
end INVERTER;

architecture BEHAVIORAL  of INVERTER is	-- BEHAVIORAL is architecture name, can be any other text.
begin
    B<=not A;	-- not a reserved keyword for NOT operation.	
end BEHAVIORAL;
