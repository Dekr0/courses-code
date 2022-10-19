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
    -- Testing signal vectors for input and output of 7-to-3 priority encoder
    SIGNAL input : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL output : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
-- write your test bench code here

    -- port map the testing singal vectors to input and output of 7-to-3 priority 
    -- encoder
    encoder : ENTITY WORK.priority_encoder_7_3 PORT MAP (
        priority_in_7 => input, 
        priority_out_3 => output
    );
    
    -- Create a process call "simulation"
    simulation : PROCESS
    BEGIN
        input (6 DOWNTO 0) <= "0000000"; -- initial value        
        WAIT FOR 10 ns;
        ASSERT UNSIGNED(output) = 0 REPORT "Error";
    
        -- Test for the case of which Y2 is off
        -- Result Y1 and Y0 should come from encoder1
        FOR i IN 1 TO 7 LOOP
            input (2 DOWNTO 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 3));
            WAIT FOR 10 ns;
        END LOOP;
        
        -- Test for the case of which Y2 just turn on
        -- Result from encoder1 should be don't care and should receive 
        -- result from encoder2
        input (3) <= '1';
        WAIT FOR 20 ns;
        ASSERT UNSIGNED(output) = 4 REPORT "Error";
    
        input (2 DOWNTO 0) <= "000";
        WAIT FOR 20 ns;
        ASSERT UNSIGNED(output) = 4 REPORT "Error";
        
        -- Test for the case of which Y2 is on and result of encoder2 
        FOR i IN 0 TO 2 LOOP
            input (6 DOWNTO 4) <= STD_LOGIC_VECTOR(TO_UNSIGNED(2 ** i, 3));
            input (2 DOWNTO 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(2 ** i, 3));
            WAIT FOR 10 ns;
        END LOOP;
        
        -- Extra Test cases
        input <= "1000000";
        WAIT FOR 20 ns;
        ASSERT UNSIGNED(output) = 7 REPORT "Error";
        
        input <= "1011111";
        WAIT FOR 20 ns;
        ASSERT UNSIGNED(output) = 7 REPORT "Error";
        
        input <= "0101111";
        WAIT FOR 20 ns;
        ASSERT UNSIGNED(output) = 6 REPORT "Error";
        
    END PROCESS simulation;         
END BEHAVIORAL;
