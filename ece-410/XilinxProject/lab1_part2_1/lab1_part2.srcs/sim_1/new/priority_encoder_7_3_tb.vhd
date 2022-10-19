----------------------------------------------------------------------------------
-- Company: University of Alberta - Department of Electrical and Computer Engineering
-- Engineer: Bruce Cockburn, Chengzhang Lyu, Shyama Gandhi, Antonio Andara
-- 
-- Create Date: 09/13/2022 07:49:55 AM
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY priority_encoder_7_3_tb IS
--  Port ( );
END priority_encoder_7_3_tb;

ARCHITECTURE Behavioral OF priority_encoder_7_3_tb IS
    signal input : STD_LOGIC_VECTOR(6 downto 0);
    signal output : STD_LOGIC_VECTOR(2 downto 0);
    signal i1, i2, i3, y0, y1 : STD_LOGIC;
BEGIN
-- write your test bench code here
    encoder : entity WORK.priority_encoder_7_3
        port map (priority_in => input, priority_out => output);
    
    simulation : process
    begin
    
    end process simulation;         
END BEHAVIORAL;