----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:24 05/24/2015 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
  port(clock,reset: in std_logic;
       Rout, Gout, Bout: out std_logic_vector(3 downto 0);
		 H, V : out std_logic;
		 Up : in std_logic;
		 Down : in std_logic;
		 Right : in std_logic;
		 Left : in std_logic;
		 tw_make: in std_logic;
		 reset_key: in std_logic;
		 ps2data: in std_logic;
		 ps2clk: in std_logic;
		 seg: out std_logic_vector(6 downto 0);
		 an: out std_logic_vector(7 downto 0);
		-- led: out std_logic_vector(15 downto 0);
		 error: out std_logic;
		 reading: out std_logic;
		 sw: in std_logic
		 );
end top_module;

architecture Behavioral of top_module is

signal btn: std_logic_vector(7 downto 0);
--signal btn1: std_logic_vector(7 downto 0):="00000000";
signal up2,right2,down2,left2: std_logic:='0';
signal n1: integer range 0 to 100:=0;
signal n2: integer range 0 to 100:=0;
signal instruction: std_logic_vector(7 downto 0);
signal position: integer range 0 to 165 := 10;
--signal reading: std_logic;
signal btncnt: integer range 0 to 175:=0;
signal key_true: std_logic:='0';
signal R,G,B: std_logic_vector(3 downto 0);
component clock_div
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic
 );
end component;

component vga_sync is
   port( clock            : in std_logic;  -- 25.175 Mhz clock
        red, green, blue : in std_logic_vector(3 downto 0);  -- input values for RGB signals
        row, column : out std_logic_vector(9 downto 0); -- for current pixel
        Rout, Gout, Bout : out std_logic_vector(3 downto 0);
		  H, V : out std_logic;
		  video_on: out std_logic);
end component;
--component screens is
--port(
--	pixel_x,pixel_y: in integer;
--	red,green,blue: out std_logic_vector(3 downto 0);
--	state_out: out std_logic;
--	shoot: in std_logic);
--end component;
--component pix_gen is
--port(
--	pixel_x,pixel_y: in integer;
--	button_r, button_l, button_u, button_d: in std_logic;
--	red,green,blue: out std_logic_vector(3 downto 0);
--	video_on: in std_logic;
--	clk_60: in std_logic;
--	tw_make: in std_logic);
--end component;
component key_test is
	port(
	reset: in std_logic;
	ps2data: in std_logic;
	ps2clk: in std_logic;
	reading: out std_logic;
	error: out std_logic;
	key: out std_logic_vector(7 downto 0)
	);
end component;


component pix_gen_new is
port(
	pixel_x,pixel_y: in integer;
	pl_x,pl_y: in integer;
	red,green,blue: out std_logic_vector(3 downto 0);
	video_on: in std_logic;
	clk_60: in std_logic;
	lives: out integer;
	bullets: out integer;
	score: out integer;
	bulcol: in integer;
	bull_shoot: in integer
	);
end component;
	
	
	component sSegDemo is
		port(
      clk_i: in std_logic;
      rstn_i: in std_logic;
		num1: in integer range 0 to 100;
		num2: in integer range 0 to 100;
      seg_o: out std_logic_vector(6 downto 0);
      an_o : out std_logic_vector(7 downto 0)
		);

	end component;

signal pixel_x: integer range 0 to 799:=0;
signal pixel_y: integer range 0 to 524:=0;
signal pl_x: integer range 0 to 639-20:=320;
signal pl_y: integer range 0 to 479-20:=400;
signal video_on: std_logic;
signal row, column : std_logic_vector(9 downto 0);
signal clk_60: std_logic;
signal clock_25: std_logic;
signal clock_100: std_logic;
signal cnt_x,cnt_y: integer range 0 to 10:=0;
signal lives: integer;
signal bullets: integer;
signal score: integer range 0 to 100;
signal bulcol: integer range 0 to 3;
signal bull_shoot: integer :=0;
--signal key_new: std_logic;
begin
CLK: component clock_div port map(clock,clock_25,clock_100,reset);
SYNC: component vga_sync port map(clock_25,R,G,B,row,column,Rout,Gout,Bout,H,V,video_on);
--SCREEN: component screens port map(pixel_x,pixel_y,R,G,B,state,tw_make);
GAME: component pix_gen_new port map(pixel_x,pixel_y,pl_x,pl_y,R,G,B,video_on,clk_60, lives, bullets, score, bulcol, bull_shoot);

--KEYBOARD: component key_test port map(reset => reset, ps2data => ps2data, ps2clk => ps2clk, reading => reading, error => error, key => btn);
LEDMODULE: component sSegDemo port map(clk_i => clock_100, rstn_i => reset, num1 => n1, num2 => n2, seg_o => seg, an_o => an);
--getting the position
  pixel_x<=conv_integer(column);
  pixel_y<=conv_integer(row);
    
--getting the 60Hz clock
	clk_60 <=
	'1' when (pixel_x = 0) and (pixel_y = 481) else
	'0';
--
	n1 <= lives;
	n2 <= 
		bullets when sw='0' else
		score;
	
	KR: key_test port map(reset => reset_key,	ps2data => ps2data,	ps2clk => ps2clk,
									reading => reading, error => error, key => instruction);
					
	POS: process(reset_key, ps2clk, instruction)
	begin
	
--		if (reset_key='0') then
--			position <= 10;
--			
		if (falling_edge(ps2clk)) then
			
					if instruction = "01110101" then--up
					if (pl_x>=0 and pl_x<=120) or (pl_x>=520 and pl_x<=640) then
						if pl_y>=2 then
							pl_y<=pl_y-1;
						end if;
					else
						if pl_y>=403 then
							pl_y<=pl_y-1;
						end if;
					end if;
				
					elsif instruction = "11100000" then--right
					--if cnt_x=0 then
						if pl_y<=400 then
							if (pl_x<=117) or (pl_x>=520 and pl_x<=626) then
								pl_x<=pl_x+1;
							end if;
						else
							if pl_x<=626 then
								pl_x<=pl_x+1;
							end if;
						end if;

					elsif instruction = "01110010" then --down
						if pl_y<=456 then
							pl_y<=pl_y+1;
						end if;

					elsif instruction = "01101011"  then--left
						if pl_y<=400 then
							if (pl_x>=13 and pl_x<=120) or (pl_x>=523) then
								pl_x<=pl_x-1;
							end if;
						else
							if pl_x>=13 then
								pl_x<=pl_x-1;
							end if;
						end if;

					elsif instruction = "00010110"  then
						bulcol <= 1;
						bull_shoot<=bull_shoot+1;
						
					elsif instruction = "00011110"  then
						bulcol <= 2;
						bull_shoot<=bull_shoot+1;
						
					elsif instruction = "00100110"  then
						bulcol <= 3;
						bull_shoot<=bull_shoot+1;
					else
						pl_x<=pl_x;
						pl_y<=pl_y;
						bulcol <= bulcol;
						bull_shoot<=bull_shoot;
					end if;
--					
--					if cnt_x>=1 then
--						cnt_x<=cnt_x+1;
--					end if;
--					
--					if cnt_y>=1 then
--						cnt_y<=cnt_y+1;
--					end if;
--					end if;
--			else
--					if(btncnt=166) then
--						key_true <='0';
--						btncnt <= 0;
--						up2<='0';
--						right2<='0';
--						down2<='0';
--						left2<='0';
--					else
--						btncnt <= btncnt+1;
--					end if;
--						
--				end if;
--
		end if;
	end process;
	
--	POS: process(reset, ps2clk, btn, keytrue, btncnt)
--	begin
--	
--	if (reset='1') then
--		led <= "00000000";
--		
--	elsif (falling_edge(ps2clk)) then
--		if(keytrue='0') then
--			case btn is
--				when "11100000" => led <= "11100000"; keytrue <= '1'; --right
--				when "01101011" => led <= "01101011"; keytrue <= '1'; --left
--				when "01110010" => led <= "01110010"; keytrue <= '1'; --down
--				when "01110101" => led <= "01110101"; keytrue <= '1'; --up
--				when "00010110" => led <= "00010110"; keytrue <= '1'; --fire1
--				when "00011110" => led <= "00011110"; keytrue <= '1'; --fire2
--				when "00100110" => led <= "00100110"; keytrue <= '1'; --fire3
--				when others => null;
--			end case;
--		else
--			if(btncnt=166) then
--				keytrue <='0';
--				btncnt <= 0;
--				led <= "00000000";
--			else
--				btncnt <= btncnt+1;
--			end if;
--		end if;
--		
		--get the actual counter value 10khz/x=60hz=>x=10^4/60=167
		--put a signal to check that you have gotten one of the values you wanted
		--if you have gotten it then start the btncnt <=> keep the same value, so something like
		--when btn is one of the coded keys, then you assign that value to btn1 and you make check true
		--if check is true and btncnt didn't reach 167(166) you increase the btncnt
		--if btn cnt reaches 166 and check is true, put btncnt to zero and put check back to false
		--so you only increase the counter when your check is true, that is when you have one
		--of the signals you wanted
		
--	end if;
--	end process;
	
end Behavioral;