----------------------------------------------------------------------------------
-- Company: Department of Electrical and Computer Engineering, University of Alberta
-- Engineer: Shyama Gandhi and Bruce Cockburn
-- 
---- Create Date: 28/09/2022 04:52:32 PM
---- Design Name: 
-- Module Name: seq_fsm_tb - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7-10 
-- Tool Versions: 
-- Description: SEQUENCE DETECTOR : 11011 - OVERLAPPING CASE : MEALY FSM
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

entity seq_fsm_tb is
end seq_fsm_tb;

architecture Behavioral of seq_fsm_tb is
    
component seq_fsm is 
Port (clk           : in std_logic;
      reset         : in std_logic;
      seq_in        : in std_logic;
      output_detect : out std_logic);
end component;

component clk_divider is
Port (
    clk_in : in std_logic;
    clk_out : out std_logic);
end component;

--signal clk_tb : std_logic;
signal clk_in_tb : std_logic;
signal reset_tb : std_logic;
signal seq_in_tb : std_logic := '0';

signal output_detect_tb : std_logic;
signal clk_out_tb : std_logic;

constant clk_period : time := 40ns;

begin
    --*** add the design lines to port map the entity here
    fsm_seq : seq_fsm port map (
        seq_in => seq_in_tb,
        reset => reset_tb,
        output_detect => output_detect_tb,
        clk => clk_in_tb
        );
     
     divider : clk_divider port map (
        clk_in => clk_in_tb,
        clk_out => clk_out_tb
     );
                       
    --*** end design lines                               
   clk_process :process
   begin
        clk_in_tb <= '0';
        wait for clk_period/2;  
        clk_in_tb <= '1';
        wait for clk_period/2;  
   end process;                                   

    stim_proc: PROCESS 
    begin
    
    -- test sequence : "0110101"
    reset_tb <= '0';
    seq_in_tb <= '0';
    wait for clk_period;
    seq_in_tb <= '1';
    wait for clk_period;
    seq_in_tb <= '1';
    wait for clk_period;
    seq_in_tb <= '0';
    wait for clk_period;
    seq_in_tb <= '1';
    wait for clk_period;
    seq_in_tb <= '0';
    wait for clk_period;
    seq_in_tb <= '1';
    wait for clk_period;
        
    end process;
end Behavioral;
