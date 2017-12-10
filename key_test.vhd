----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:39:07 05/13/2015 
-- Design Name: 
-- Module Name:    key_test - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity key_test is
	port(
	reset: in std_logic;
	ps2data: in std_logic;
	ps2clk: in std_logic;
	reading: out std_logic;
	error: out std_logic;
	key: out std_logic_vector(7 downto 0)
	);
end key_test;

architecture Behavioral of key_test is

	signal data_buffer: std_logic := '0';
	signal startbit: std_logic;
	signal paritybit: std_logic;
	signal stopbit: std_logic;
	signal key_reg: std_logic_vector (7 downto 0) := (others=>'0');
	signal counter: integer range 0 to 10 :=0;
	--signal paritycheck: std_logic := '0';
	--signal err_signal: std_logic;
	--signal r_signal: std_logic;
	--signal tick: integer := 0;
	--signal done: std_logic := '0';
	
begin
	
	error <= startbit or (not stopbit); --or paritycheck;
	reading <= stopbit;
	key <= key_reg; 
	
	aq: process(reset, ps2clk, ps2data)
	begin
	
	if(reset='0') then
		key_reg<=(others=>'0');
		data_buffer <='0';
		counter <=0;
		startbit <='0';
		paritybit <='0';
		stopbit <='0';
		
	elsif(falling_edge(ps2clk)) then
		data_buffer <= ps2data;
		
		if(data_buffer='0' and counter=0) then
			startbit <= data_buffer;
			counter <= counter + 1;
		
		elsif(counter>0 and counter<9) then
			key_reg(counter-1) <= data_buffer;
			counter <= counter + 1;
			
		elsif(counter=9) then
			paritybit <= data_buffer;
			counter <= counter + 1;
			
--			--if ( not(key_reg(7) xor key_reg(6) xor key_reg(5)
--			xor key_reg(4) xor key_reg(3) xor key_reg(2) xor key_reg(1) xor
--			key_reg(0)) /= paritybit) then
--				paritycheck <= '1';
--			else
--				paritycheck <= '0';
--			end if;
			
		elsif(counter=10) then
			stopbit <= data_buffer;
			counter <= 0;
			--done <= '1';
		end if;
	
	end if;
	end process;
		
end Behavioral;