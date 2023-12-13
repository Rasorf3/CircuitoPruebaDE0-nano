-------------------------------------------------------------------------------
Library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------
entity counter_15 is
port(
		CLK : in std_logic;
		dato : out std_logic_vector(3 downto 0)
		);
end entity counter_15;
-------------------------------------------------------------------------------
architecture beh of counter_15 is
	type estados is(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15);
	signal PS,NS : estados := S0;
begin
	registro : process(CLK) is
		begin
			if(CLK'event and CLK = '1')then 
				PS <= NS;
			end if;
		end process registro;
		
	FSM : process(PS) is
		begin
			case(PS) is
				when S0 =>
					dato <= x"0";
					NS <= S1;
	
				when S1 =>
					dato <= x"1";
					NS <= S2;
					
				when S2 =>
					dato <= x"2";
					NS <= S3;
					
				when S3 =>
					dato <= x"3";
					NS <= S4;
					
				when S4 =>
					dato <= x"4";
					NS <= S5;
					
				when S5 =>
					dato <= x"5";
					NS <= S6;
					
				when S6 =>
					dato <= x"6";
					NS <= S7;
					
				when S7 =>
					dato <= x"7";
					NS <= S8;
					
				when S8 =>
					dato <= x"8";
					NS <= S9;
					
				when S9 =>
					dato <= x"9";
					NS <= S10;
					
				when S10 =>
					dato <= x"A";
					NS <= S11;
					
				when S11 =>
					dato <= x"B";
					NS <= S12;
					
				when S12 =>
					dato <= x"C";
					NS <= S13;
					
				when S13 =>
					dato <= x"D";
					NS <= S14;
					
				when S14 =>
					dato <= x"E";
					NS <= S15;
					
				when S15 =>
					dato <= x"F";
					NS <= S0;
					
			end case;
		end process FSM;
end architecture beh;