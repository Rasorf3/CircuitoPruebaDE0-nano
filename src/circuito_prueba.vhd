-------------------------------------------------------------------------------
Library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------
entity circuito_prueba is
port(
		CLK_50HZ : in std_logic;
		hex00,hex01,hex02,hex03,hex04,hex05,hex06,hex07 : out std_logic_vector(6 downto 0);
		leds : out std_logic_vector(7 downto 0)
		);
end entity circuito_prueba;
-------------------------------------------------------------------------------
architecture structural of circuito_prueba is
	signal CLK_25HZ : std_logic;
begin
	
	RELOG25HZ : entity work.PLL_MEDIO port map(CLK_50HZ,CLK_25HZ);
	
	hex0: entity work.contador_hex port map(CLK_25HZ,hex00);
	hex1: entity work.contador_hex port map(CLK_25HZ,hex01);
	hex2: entity work.contador_hex port map(CLK_25HZ,hex02);
	hex3: entity work.contador_hex port map(CLK_25HZ,hex03);
	hex4: entity work.contador_hex port map(CLK_25HZ,hex04);
	hex5: entity work.contador_hex port map(CLK_25HZ,hex05);
	hex6: entity work.contador_hex port map(CLK_25HZ,hex06);
	hex7: entity work.contador_hex port map(CLK_25HZ,hex07);
	
	FSM_LEDS : entity work.counter_leds port map(CLK_25HZ,leds);
	
	
	
end architecture structural;
-------------------------------------------------------------------------------
	

