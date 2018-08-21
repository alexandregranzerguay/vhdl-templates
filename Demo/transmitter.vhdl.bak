library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Add more if required

entity transmitter is 
port (
	-- Add all your required ports here
    -- I highly recommend grouping them in types and subtypes if need be

    -- GENERIC
    reset, clock: in std_logic; -- Standard reset and clock signal
    
    -- INPUTS
    -- input coming from State Machine
    send_signal, start_tx: in std_logic; -- input signal or set of input signals
    
    -- OUTPUTS
	signal_sent: out std_logic -- output signal or set of output signals
);
end transmitter;

architecture rtl of transmitter is
	-- Internal signal declaration goes HERE
    
    signal count_flag : std_logic := '1';
    -- internal counter to keep track of signals sent
    signal next_count, current_count: integer := 0;
begin

	-- Process Description: Logic to determine what data the transmitter can send
	-- Process is asynchronous
	-- Additional details: Add additional details if needed
    Tx_proc: process(send_signal, start_tx, reset, clock)
	begin
        if(reset = '1') then
            signal_sent <= '0';
        elsif(start_tx = '1' and send_signal = '1') then
            signal_sent <= send_signal and clock;
            count_flag <= send_signal and clock;
        end if;
        if(count_flag = '1') then
            next_count <= current_count + 1;
        end if;
    end process Tx_proc; 
    
    -- Process Description: Update counter on rising clock edge
	-- Process is synchronous
	-- Additional details: There is no reset because reset is handled in the Tx_proc as asynchronous signal
    Tx_state: process(clk)
	begin
		if(rising_edge(clk)) then
			current_count <= next_count;
		end if;				
	end process Tx_state;
end rtl;