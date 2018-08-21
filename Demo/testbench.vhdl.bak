------------------------------------------------
-- THIS IS A TESTBENCH                        --
-- CREATOR:                                   --
-- OWNER:                                     --
------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench is
-- MUST LEAVE EMPTY FOR TESTBENCH
end testbench;

architecture rtl of testbench is

	-- Component declaration for Unit Under Test (UUT)
	component STATE_MACHINE
	port(
		-- INPUTS
		RESET, CLOCK: in std_logic;
		INPUT_SIGNAL : in std_logic;
		-- OUTPUTS
		OUTPUT_SIGNAL : in std_logic
	);
	end component;
	
	-- Internal signal declaration goes HERE
	
begin

	-- Instantiate the Unit Under Test (UUT)
    
	-- STATE_MACHINE PORT MAP
	state_machine_port: STATE_MACHINE port map (
		RESET => RESET,
		CLOCK => CLOCK,
        INPUT_SIGNAL => INPUT_SIGNAL,
        OUTPUT_SIGNAL => OUTPUT_SIGNAL
	);
    
    -- Internal signal declaration goes HERE
    signal RESET, CLOCK : std_logic;

    -- inputs for UUT
    signal INPUT_SIGNAL : std_logic;

    -- outputs for UUT
    signal OUTPUT_SIGNAL : std_logic;

    -- Process Description: Testbench for UUT
	-- Additional details: Add additional details if needed
	tb: process
	begin
		-- insert testbench logic here
	end process tb;
end rtl;