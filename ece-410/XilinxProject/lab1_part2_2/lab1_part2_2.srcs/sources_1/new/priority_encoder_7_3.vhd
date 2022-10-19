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

-- Declaration and definition of external interface (input and output) for 7-to-3 
-- priority encoder 
ENTITY priority_encoder_7_3 IS
    PORT ( 
        -- 7 inputs
        -- Y7 -> 6. Y6 -> 5, Y5 -> 4, ... I1 -> 0
        priority_in_7 : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        -- 3 outputs
        -- Y2 -> 2, Y1 -> 1, Y0 -> 0
        priority_out_3 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) 
        );
END priority_encoder_7_3;

-- Declaration and definition of behavior for 7-to-3 priority encoder
ARCHITECTURE Behavioral of priority_encoder_7_3 IS
    -- a logic vector (act as a buffer) to receive output from encoder1
    SIGNAL buf1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
    
    -- a logic vector (act as a buffer) to receive output from encoder2
    SIGNAL buf2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
    
    -- A condition signal that selects which 3-to-2 priority encoder will forward  
    -- its values of Y1 and Y0 to Y1 and Y0 of the 7-to-3 encoder.
    SIGNAL Y2 : STD_LOGIC;
    
    -- Declaring a component to reuse the Architecture behavior (in 
    -- priority_encoder_3_2.vhd) of 3-to-2 priority encoder.
    COMPONENT priority_encoder_3_2 IS
        PORT (
            -- 3 inputs
            -- I3 -> 2. I2 -> 1, I0 -> 0
            priority_in : in STD_LOGIC_VECTOR (2 DOWNTO 0);
            -- 2 outputs
            -- Y1 -> 1, Y0 -> 1
            priority_out : out STD_LOGIC_VECTOR (1 DOWNTO 0)
        );
    END COMPONENT;

    BEGIN
        -- Instantiate an instance of 3-to-2 priority encoder -> encoder1
        -- I3, I2, I1 will map to encoder1
        -- The output of encoder1 will map to buf1
        encoder1: priority_encoder_3_2 PORT MAP(
            priority_in (2 DOWNTO 0) => priority_in_7 (2 DOWNTO 0), 
            priority_out => buf1
        );
        
        -- Instantiate an instance of 3-to-2 priority encoder -> encoder2
        -- I6, I5, I4 will map to encoder2
        -- The output of encoder2 will map to buf2
        encoder2: priority_encoder_3_2 PORT MAP(
            priority_in (2 DOWNTO 0) => priority_in_7 (6 DOWNTO 4), 
            priority_out => buf2
        );
        
        -- From Truth Table of 7-to-3 priority encoder, Y2 is on either Y7. 
        -- Y6. Y5. or Y4 is on
        Y2 <= priority_in_7(6) or priority_in_7(5) or priority_in_7(4) or 
            priority_in_7(3);
        priority_out_3(2) <= Y2;
        
        -- Use Y2 to determine which encoder's output will be used for the 
        -- final outputs Y1 and Y0 of 7-to-3 priority encoder.
        
        -- When Y2 is off, use the output from encoder1
        -- When Y2 is on, use the output from encoder2 (outputs 
        -- of encoder1 are don't care).
        priority_out_3(1) <= (Y2 and buf2(1)) or (not Y2 and buf1(1));
        priority_out_3(0) <= (Y2 and buf2(0)) or (not Y2 and buf1(0));
        
--        WITH (Y2) SELECT
--            priority_out_3(1 DOWNTO 0) <= buf2 WHEN '1',
--                                          buf1 WHEN '0',
--                                          "00" WHEN OTHERS;
    END Behavioral;
