-------------------------------------------------------------------------------
Library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------
entity contador_hex is
port(
		CLK : in std_logic;
		hex : out std_logic_vector(6 downto 0)
		);
end entity contador_hex;
-------------------------------------------------------------------------------
architecture structural of contador_hex is
	signal datos : std_logic_vector(3 downto 0);
begin
	
	COUNTER : entity work.counter_15 port map(CLK,datos);
	BCH	  : entity work.BCH port map(datos,hex);

end architecture structural;
-------------------------------------------------------------------------------