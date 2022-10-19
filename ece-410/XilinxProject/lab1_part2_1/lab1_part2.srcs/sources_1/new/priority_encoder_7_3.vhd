----------------------------------------------------------------------------------
-- Company: University of Alberta - Department of Electrical and Computer Engineering
-- Engineer: Bruce Cockburn, Chengzhang Lyu, Shyama Gandhi, Antonio Andara
-- 
-- Create Date: 09/13/2022 07:38:18 AM
-- Design Name: 
-- Module Name: priority_encoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY priority_encoder_7_3 IS
    PORT ( 
        priority_in : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        priority_out : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
        );
END priority_encoder_7_3;

ARCHITECTURE Behavioral of priority_encoder_7_3 IS

--- Y2 = I4I5'I6'I7' + I5I6'I7' + I6I7' + I7
--- Y1 = I2I3'I4'I5'I6'I7' + I3I4'I5'I6'I7' + I6I7' + I7
--- Y0 = I1I2'I3'I4'I5'I6'I7' + I3I4'I5'I6'I7' + I5I6'I7' + I7

BEGIN
-- Write your code here
    priority_out(0) <= (priority_in(0) and (not priority_in(1)) and (not priority_in(2)) and (not priority_in(3)) and (not priority_in(4)) and (not priority_in(5))) or 
    (priority_in(2) and (not priority_in(3)) and (not priority_in(4)) and (not priority_in(5))) or 
    (priority_in(4) and (not priority_in(5))) or priority_in(6);

    priority_out(1) <= (priority_in(1) and (not priority_in(3)) and (not priority_in(4))) or 
    (priority_in(2) and (not priority_in(3)) and (not priority_in(4))) or priority_in(5) or priority_in(6);

    priority_out(2) <= priority_in(3) or priority_in(4) or priority_in(5) or priority_in(6);
END Behavioral;

