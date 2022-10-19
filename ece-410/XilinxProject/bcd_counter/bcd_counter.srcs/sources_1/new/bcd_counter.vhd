----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2022 10:00:34 PM
-- Design Name: 
-- Module Name: bcd_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_counter is
    Port ( en : in STD_LOGIC;
           up_dn_b : in STD_LOGIC;
           counter : out STD_LOGIC_VECTOR (3 downto 0));
end bcd_counter;

architecture Behavioral of bcd_counter is

SIGNAL c: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

begin
    counter <= c;
    
    count: PROCESS(en) IS
    BEGIN
        IF (en = '1' AND en'EVENT) THEN
            IF (up_dn_b = '1') THEN
                IF (c = "1111") THEN
                    c <= "0000";
                END IF;
                c <= STD_LOGIC_VECTOR(UNSIGNED(c) + 1);
            ELSE
                IF (c = "0000") THEN
                    c <= "1111";
                END IF;
                c <= STD_LOGIC_VECTOR(UNSIGNED(c) - 1);
            END IF;
       END IF;
    END PROCESS count; 
end Behavioral;
