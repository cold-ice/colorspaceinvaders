----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:02 07/01/2015 
-- Design Name: 
-- Module Name:    screens - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE WORK.screens_package.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity screens is
port(
	pixel_x,pixel_y: in integer;
	red,green,blue: out std_logic_vector(3 downto 0);
	state_out: out std_logic;
	shoot: in std_logic);
end screens;

architecture Behavioral of screens is
signal state: std_logic := '1';

begin
process(pixel_x,pixel_y)
begin
	if state='1' then
	
		draw_start(red,green,blue,pixel_x,pixel_y);
		if shoot='1' then
			state<='0';
		end if;
		
	end if;
	state_out<=state;
end process;
end Behavioral;

