library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Add more if required

entity entity_name is 
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
end entity_name;

architecture rtl of entity_name is
	-- Internal signal declaration goes HERE
	
begin

	-- Process Description: Logic to determine what data the entity_name can send
	-- Process is asynchronous
	-- Additional details: Add additional details if needed
    process_name: process(d) -- Add all input signals that affect behavior of asynchronous process to the sensitivity list
	begin
        -- Insert logic HERE
	end process process_name; -- Naming the process to end is not necessary but helps readibility of code
end rtl;