library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;

entity timer is
port(
	-- INPUTS
	-- input signals from State Machine
	clock, reset : in std_logic;
	start_timer_reset, start_timer_timeout: in std_logic;
	
	-- OUTPUTS
	-- output signals to State Machine
	after_1_us: out std_logic;
	no_signal_timeout: out std_logic;
	
	timer_out: out std_logic_vector (7 downto 0)
);
end timer;

architecture rtl of timer is
	-- Internal signal declarition goes HERE
	
	signal ticks : integer := 0;
	
	-- assumes a 100ns input clock ie 10MHz
	signal tick_1_us : integer := 10;

begin
	timer_proc: process(clock, reset, start_timer_reset)
	begin
		if(reset = '1') then
			after_1_us <= '0';
			ticks <= 0;
		elsif(rising_edge(clock)) then
			if(start_timer_reset = '1') then
				if(ticks = (tick_1_us - 1)) then
					after_1_us <= '1';
					ticks <= 0;
				else
					ticks <= ticks + 1;
					after_1_us <= '0';
				end if;
			elsif(start_timer_timeout = '1') then
				if(ticks = (tick_1_us - 1)) then
					after_1_us <= '1';
					ticks <= 0;
				else
					ticks <= ticks + 1;
					after_1_us <= '0';
				end if;
			end if;
		end if;
		timer_out <= std_logic_vector(to_unsigned(ticks, timer_out'length));
	end process timer_proc;
end rtl;