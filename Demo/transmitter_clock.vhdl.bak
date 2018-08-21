library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity transmitter_clock is
port(
	-- INPUTS
	-- input data received
	clock, reset : in std_logic;
	
	-- OUTPUTs
	-- output signals to Transmitter
	new_clock : out std_logic
);
end transmitter_clock;

architecture rtl of frequency_divider is
	-- Internal signal declaration goes HERE
	
	-- the frequency of the input CLOCK
	signal division_factor : integer := 2;
	
	-- counter is updated based on CLOCK
	signal counter : integer := 1;
	
	-- placeholder for output clock value
	signal new_clock_temp: std_logic;
begin
	
	-- Process Description: Updates Counter
	-- Process is synchronous
	-- Additional details:
	new_clock_process: process (reset, clock)
	begin
		if(reset = '1') then
			counter <= 1;
			new_clock_temp <= '0';
		elsif(rising_edge(clock))then
			if(counter = division_factor) then
				new_clock_temp <= not(new_clock_temp);
				counter <= 1;
			else
				counter <= counter + 1;
			end if;
		end if;
		new_clock <= new_clock_temp;
	end process new_clock_process;

end rtl;