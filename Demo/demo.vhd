------------------------------------------------
-- THIS IS THE TOP-LEVEL ENTITY               --
--	DESCRIPTION: CONNECT ALL COMPONENTS		    --
--															 --
-- CREATOR: ALEXANDRE GRANZER-GUAY            --
-- OWNER:            								 --
------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity demo is
port(
	-- INPUTS
	reset, clock : in std_logic;
	
	input_signal : in std_logic;
	
	-- OUTPUTS
	signal_sent : out std_logic;
	
	timer_out : out std_logic_vector (7 downto 0)
);
end demo;

architecture rtl of demo is
	
	-- COMPONENTS
	-- STATE MACHINE
	component state_machine
	port(
		reset, clock: in std_logic;
		-- INPUTS
		received_signal: in std_logic;
		resetting_time, no_signal_timeout: in std_logic;
		-- OUTPUTS
		reset_rx, start_rx: out std_logic;
		reset_tx, start_tx: out std_logic;
		start_timer_reset, start_timer_timeout, reset_timer: out std_logic
	);
	end component;
	
	-- TRANSMITTER
	component transmitter
	port(	
	 reset, clock: in std_logic;
	 -- INPUTS
	 send_signal, start_tx: in std_logic;
	 -- OUTPUTS
	signal_sent: out std_logic
	);
	end component;
	
	-- TX CLOCK
	component transmitter_clock
	port (
		-- INPUTS
		clock, reset : in std_logic;
		-- OUTPUTs
		new_clock : out std_logic
	);
	end component;
	
	-- RECEIVER
	component receiver
	port (
		-- INPUTS
      reset, clock: in std_logic;
      input_signal: in std_logic;
		start_rx : in std_logic;
		-- OUTPUTS
	   received_signal: out std_logic
	);
	end component;
	
	-- TIMER
	component timer
	port (
		-- INPUTS
		clock, reset, start_timer_reset, start_timer_timeout : in std_logic;
		-- OUTPUTS
		after_1_us: out std_logic;
		no_signal_timeout: out std_logic;
		timer_out: out std_logic_vector (7 downto 0)
	);
	end component;
	
	
	-- Internal signal declaration goes HERE
	
	-- signals Timer - State Machine
	signal after_1_us_link, received_signal_link, no_signal_timeout_link : std_logic;
	signal start_timer_reset_link, start_timer_timeout_link,	reset_timer_link : std_logic;
	
	-- signals Receiver - State Machine
	signal reset_rx_link, start_rx_link : std_logic;
	
	-- signals Transmitter - State Machine
	signal reset_tx_link, start_tx_link, send_signal_link : std_logic;
	
	-- signals Transmitter - Tx Clock
	signal tx_clock_link : std_logic;
	
begin

	-- Instantiate the Unit Under Test (UUT)
	
	-- PORT MAPS
	-- STATE MACHINE
	state_machine_port: state_machine port map (
		reset => reset,
		clock => clock,
		received_signal => received_signal_link,
		resetting_time => after_1_us_link, 
		no_signal_timeout => no_signal_timeout_link,
		reset_rx => reset_rx_link,
		start_rx => start_rx_link,
		reset_tx => reset_tx_link,
		start_tx => start_tx_link,
		start_timer_reset => start_timer_reset_link,
		start_timer_timeout => start_timer_timeout_link,
		reset_timer => reset_timer_link
	);
	
	-- TRANSMITTER
	transmitter_port: transmitter port map (
		reset => reset_tx_link,
		clock => tx_clock_link,
		send_signal => send_signal_link,
		start_tx => start_tx_link,
		signal_sent => signal_sent
	);
	
	-- TX CLOCK
	tx_clock_port: transmitter_clock port map (
		clock => clock,
		reset => reset,
		new_clock => tx_clock_link
	);
	
	-- RECEIVER
	receiver_port: receiver port map (
		reset => reset_rx_link,
		start_rx => start_rx_link,
		clock => clock,
		input_signal => input_signal
	);
	
	-- TIMER
	timer_port: timer port map (
		clock => clock, 
		reset => reset_timer_link,
		start_timer_reset => start_timer_reset_link,
		start_timer_timeout => start_timer_timeout_link,
		after_1_us => after_1_us_link,
		no_signal_timeout => no_signal_timeout_link,
		timer_out => timer_out
	);
	
	demo_process: process (reset, clock)
	begin
		if(reset = '1') then
			-- reset everything
		end if;
	end process demo_process;
end rtl;