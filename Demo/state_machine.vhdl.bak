library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Add more if required

entity state_machine is
port(
	-- Add all your required ports here

    -- GENERIC
    reset, clk: in std_logic;

    -- INPUTS
    -- signals from Receiver
    received_signal: in std_logic;

    -- OUTPUTS
    -- signals to Receiver
    reset_rx, start_rx: out std_logic;

    -- signals to Transmitter
    reset_tx, start_tx: out std_logic

);
end state_machine;

architecture rtl of state_machine is
	-- Internal signal declaration goes HERE
    -- For state machine it is rare that you will need internal signals
    
	-- State signal declaration goes HERE
	type state_type is (reset, starting, communicating); -- Add all possible states
	signal state, next_state : state_type; 

begin
	-- NOTE: THIS DESIGN CAN WORK FOR BOTH MEALY AND MOORE FINITE STATE MACHINES

	-- Process Description: Change state to next state on rising clock edge
	-- Process is synchronous
	-- Additional details: Add additional details if needed
	sync_state: process (clk) -- synchronous processes should only have reset and clk in their sensitivity list
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				-- Reset the state machine
			else
				-- Update state of state machine
				state <= next_state;
			end if;
		end if;
	end process sync_state; -- Naming the process to end is not necessary but helps readibility of code
	
	-- Process Description: Update output signals based on current state
	-- Process is asynchronous
	-- Additional details: Add additional details if needed
	state_output: process (state)
    begin
        -- initial output values
        reset_tx <= '0';
        reset_rx <= '0';
        start_rx <= '0';
        start_tx <= '0';

        -- output values changed based on current state
        case(state) is
            when reset =>
                reset_tx <= '1';
                reset_rx <= '1';
            when starting =>
                start_rx <= '1';
            when communicating =>
                start_tx <= '1';
        end case;
	end process state_output;
	
	-- Process Description: Update next state based on input signals and current state
	-- Process is asynchronous
    -- Additional details: Add additional details if needed
	next_state_proc : process (state, received_signal, no_signal_timeout, resetting_time)
	begin
        case(state) is
            when reset =>
                if(resetting_time = '1') then
                    next_state <= starting;
                end if;
            when starting =>
                if(signal_received = '1') then
                    next_state <= communicating;
                end if;
            when communicating =>
                if(no_signal_timeout) then
                    next_state <= reset;
                end if;
        end case;
	end process next_state_proc;
	
end rtl;
