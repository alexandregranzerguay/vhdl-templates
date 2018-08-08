library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tx_clock_recovery is
port(
	-- INPUTS
	-- input data received
	CLOCK, RESET : in std_logic;
	
	-- OUTPUTs
	-- output signals to Host System (note: RX_CLOCK also input for receiver)
	TX_CLOCK : out std_logic
);
end tx_clock_recovery;

architecture rtl of tx_clock_recovery is
	-- Internal signal declaration goes HERE
	
	-- set range top as the factor by which you want to divide
	-- the frequency of the input CLOCK
	signal division_factor : integer := 3;
	
	-- counter is updated based on CLOCK
	-- range top = division_factor
	signal counter : integer range 1 to 3 := 1;
	
	-- placeholder for output clock value
	signal tx_clock_tmp: std_logic;
begin
	
	-- Process Description: Divide Clock Frequency
	-- Process is synchronous
	-- Additional details:
	CLK_recovery: process (RESET, CLOCK)
	begin
		if(RESET = '1') then
			counter <= 1;
			tx_clock_tmp <= '0';
		elsif(rising_edge(CLOCK))then
			if(counter = division_factor) then
				tx_clock_tmp <= not(tx_clock_tmp);
				counter <= 1;
			else
				counter <= counter + 1;
			end if;
		end if;
		TX_CLOCK <= tx_clock_tmp;
	end process CLK_recovery;

end rtl;