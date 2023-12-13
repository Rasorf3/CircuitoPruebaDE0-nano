-------------------------------------------------------------------------------
Library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------
entity counter_leds is
port(
		CLK : in std_logic;
		leds : out std_logic_vector(7 downto 0)
		);
end entity counter_leds;
-------------------------------------------------------------------------------
architecture beh of counter_leds is
	type estados is(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11);
	signal PS,NS : estados := S0;
begin
	registros : process(CLK) is
	begin
		if(CLK'event and CLK = '1') then
			PS <= NS;
		end if;
	end process registros;
	
	FSM : process(PS) is
	begin
		case(PS) is
			when S0 =>
				leds <= x"00";
				NS <= S1;
				
			when S1 =>
				leds <= x"01";
				NS <= S2;
				
			when S2 =>
				leds <= x"02";
				NS <= S3;
				
			when S3 => 
				leds <= x"04";
				NS <= S4;
				
			when S4 =>
				leds <= x"08";
				NS <= S5;
				
			when S5 =>
				leds <= x"10";
				NS <= S6;
				
			when S6 =>
				leds <= x"20";
				NS <= S7;
				
			when S7 =>
				leds <= x"40";
				NS <= S8;
				
			when S8 =>
				leds <= x"80";
				NS <= S9;
				
			when S9 =>
				leds <= x"0F";
				NS <= S10;
			
			when S10 =>
				leds <= x"FF";
				NS <= S11;
				
			when S11 =>
				leds <= x"F0";
				NS <= S0;
		end case;
	end process FSM;
end architecture beh;
			