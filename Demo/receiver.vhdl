library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Add more if required

entity receiver is 
port (
    -- Add all your required ports here
    -- I highly recommend grouping them in types and subtypes if need be

    -- GENERIC
    reset, clock: in std_logic; -- Standard reset and clock signal
	 start_rx : in std_logic;
    
    -- INPUTS
    input_signal: in std_logic; -- input signal or set of input signals
    
	 -- OUTPUTS
	 received_signal: out std_logic
);
end receiver;

architecture rtl of receiver is
	-- Internal signal declaration goes HERE
	
begin
	-- Process Description: Change state of the transmitter on rising clock edge
	-- Process is synchronous
	-- Additional details: There is no reset because reset is handled in the Tx_proc as asynchronous signal
	Rx_state: process(reset, clock)
    begin
        if(reset = '1') then
            -- Reset logic
		elsif(rising_edge(clock)) then
			-- Run logic
		end if;				
	end process Rx_state;
end rtl;