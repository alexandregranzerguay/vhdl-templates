library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Add more if required

entity transmitter is 
port (
    -- Add all your required ports here
    -- I highly recommend grouping them in types and subtypes if need be

    -- GENERIC
    reset, clk: in std_logic; -- Standard reset and clock signal
    
    -- INPUTS
    d: in std_logic; -- input signal or set of input signals
    
    -- OUTPUTS
	q: out std_logic -- output signal or set of output signals
);
end transmitter;

architecture rtl of transmitter is
	-- Internal signal declaration goes HERE
	
begin
	-- Process Description: Change state of the transmitter on rising clock edge
	-- Process is synchronous
	-- Additional details: There is no reset because reset is handled in the Tx_proc as asynchronous signal
	Tx_state: process(reset, clk)
    begin
        if(reset = '1') then
            -- Reset logic
		elsif(rising_edge(clk)) then
			-- Run logic
		end if;				
	end process Tx_state;
end rtl;