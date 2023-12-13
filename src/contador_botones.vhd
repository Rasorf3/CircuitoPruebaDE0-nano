-------------------------------------------------------------------------------
Library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------
entity contador_botones is
port(
		CLK: in std_logic;
		SW : in std_logic_vector(1 downto 0);
		S 	: out std_logic_vector(1 downto 0)
		);
end entity contador_botones;
-------------------------------------------------------------------------------
architecture beh of contador_botones is
	type estados is(S0,S1,S2,S3,S4);
	signal PS,NS : estados := S0;
begin
	registros : process(CLK) is
	begin
		if(CLK'event and CLK= '1') then
			PS <= NS;
		end if;
	end process registros;
	
	FSM : process(PS) is
	begin
		case(PS) is
			when S0 =>
				S <= "00";
				if(SW = "01")then
					NS <= S1;
				elsif(SW = "10") then
					NS <= S3;
				else
					NS <= S0;
				end if;
				
			when S1 =>
				S <= "01";
				if(SW = "01")then
					NS <= S1;
				elsif(SW = "10") then
					NS <= S3;
				else
					NS <= S2;
				end if;
			
			when S2 => 
				S <= "01";
				if(SW = "01")then
					NS <= S0;
				elsif(SW = "10") then
					NS <= S3;
				else
					NS <= S2;
				end if;
					
			when S3 =>
				S <= "10";
				if(SW = "10")then
					NS <= S3;
				elsif(SW = "01") then
					NS <= S1;
				else
					NS <= S4;
				end if;
					
			when S4 => 
				S <= "10";
				if(SW = "10")then
					NS <= S0;
				elsif(SW = "01") then
					NS <= S1;
				else
					NS <= S4;
				end if;			
		end case;
	end process FSM;
end architecture beh;
-------------------------------------------------------------------------------
				