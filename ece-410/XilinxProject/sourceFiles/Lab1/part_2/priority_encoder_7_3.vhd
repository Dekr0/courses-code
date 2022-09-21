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
-- Write your code here
END Behavioral;

