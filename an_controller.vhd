library IEEE;
use IEEE.STD_LOGIC_1164.all;

package an_controller is

--	type digits is array (0 to 15) of std_logic_vector(6 downto 0);

--	procedure switcher (
--		signal pos : in integer range 0 to 7;
--		signal d : in std_logic_vector(6 downto 0);
--		signal seg	: out std_logic_vector(6 downto 0);
--		signal an : out std_logic_vector(7 downto 0)
--	);

	procedure numspl (
		signal number: in integer range 0 to 100; 
		signal h: out integer range 0 to 10; 
		signal dec: out integer range 0 to 10;
		signal un: out integer range 0 to 10 
	);

	procedure leds (
		signal SEL: in integer range 0 to 10;
		signal LEDS: out std_logic_vector(6 downto 0)
	);

end an_controller;

package body an_controller is

-- NUMSPL  
procedure numspl (
	signal number: in integer range 0 to 100; 
	signal h: out integer range 0 to 10; 
	signal dec: out integer range 0 to 10;
	signal un: out integer range 0 to 10
	) is
	
	begin
	
	if(number=100) then
		h <= 1;
		dec <= 0;
		un <= 0;
	elsif(99 >= number and number >= 90) then
		h <= 10;
		dec <= 9;
		un <= number - 90;
	elsif(89 >= number and number >= 80) then
		h <= 10;
		dec <= 8;
		un <= number - 80;
	elsif(79 >= number and number >= 70) then
		h <= 10;
		dec <= 7;
		un <= number - 70;
	elsif(69 >= number and number>=60) then
		h <= 10;
		dec <= 6;
		un <= number - 60;
	elsif(59 >= number and number>=50) then
		h <= 10;
		dec <= 5;
		un <= number - 50;
	elsif(49>=number and number >= 40) then
		h <= 10;
		dec <= 4;
		un <= number - 40;
	elsif(39 >= number and number >= 30) then
		h <= 10;
		dec <= 3;
		un <= number - 30;
	elsif(29 >= number and number >= 20) then
		h <= 10;
		dec <= 2;
		un <= number - 20;
	elsif(19 >= number and number >= 10) then
		h <= 10;
		dec <= 1;
		un <= number - 10;
	else
		h <= 10;
		dec <= 10;
		un <= number;
	end if;
	
end numspl;

-- LEDS
procedure leds (
	signal SEL: in integer range 0 to 10;
	signal LEDS: out std_logic_vector(6 downto 0)
	) is
	
	begin
	
	case SEL is
		when 0 =>
			LEDS <= "1000000";
		when 1 =>
			LEDS <= "1111001";
		when 2 =>
			LEDS <= "0100100";
		when 3 =>
			LEDS <= "0110000";
		when 4 =>
			LEDS <= "0011001";
		when 5 =>
			LEDS <= "0010010";
		when 6 =>
			LEDS <= "0000010";
		when 7 =>
			LEDS <= "1111000";
		when 8 =>
			LEDS <= "0000000";
		when 9 =>
			LEDS <= "0010000";
		when 10 =>
			LEDS <= "1111111";
		end case;
			
end LEDS;

---- SWITCHER
-- procedure switcher (
--	signal pos : in integer range 0 to 7;
--	signal d : in std_logic_vector(6 downto 0);
--	signal seg	: out std_logic_vector(6 downto 0);
--	signal an : out std_logic_vector(7 downto 0)
--) is
--    
--  begin
--  
--	case pos is
--	when 0 => 
--		an <= "11111110";
--	when 1 => 
--		an <= "11111101";
--	when 2 => 
--		an <= "11111011";
--	when 3 => 
--		an <= "11110111";
--	when 4 => 
--		an <= "11101111";
--	when 5 => 
--		an <= "11011111";
--	when 6 => 
--		an <= "10111111";
--	when 7 => 
--		an <= "01111111";
--	end case;
--			
--  seg <= not d(6 downto 0);
--   
--end switcher;

end an_controller;