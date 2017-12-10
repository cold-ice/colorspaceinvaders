--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.math_real.ALL;
USE std.textio.ALL;

package game_package is
 type player is
  record
    x        : integer range 0 to 639-20;
    y        : integer range 0 to 479-20;
	 red: std_logic_vector(3 downto 0);
	 blue: std_logic_vector(3 downto 0);
	 green: std_logic_vector(3 downto 0);
	 player_on: std_logic;
 end record;
  
  type enemy_type is
	record
		x: integer range 0 to 639;
		y: integer range 0 to 479;
		red: std_logic_vector(3 downto 0);
		blue: std_logic_vector(3 downto 0);
		green: std_logic_vector(3 downto 0);
	end record;
 type enemy_arr is array (0 to 9) of enemy_type;

--types for the screen
--type arr_1 is array (0 to 630) of integer range 0 to 15;
--type st_screen is array (0 to 64) of arr_1;



--------------------------------
constant pos_x1: integer := 140;
constant pos_x2: integer := 320;
constant pos_x3: integer := 500;
constant pl_speed: integer :=3;
--
-- Declare functions and procedure
--
--procedure get_screen_rgb(signal red,blue,green: out st_screen);
--procedure pl_draw  (signal	pl: inout player; signal up,right,down,left,shoot: in std_logic; signal up2,right2,down2,left2: in std_logic
--signal ucheck,rcheck,dcheck,lcheck: in integer
--); 
-- procedure pl_draw (signal	pl_in: in player; signal pl_out: out player; signal up,right,down,left: in std_logic);
--
procedure en_create(signal en: inout enemy_type; signal pos,color: in integer);
--procedure get_rand(signal prev_value inout integer; signal pos: out integer);
procedure bull_color(signal color: in integer; signal R,G,B:out std_logic_vector);
end game_package;

package body game_package is
		

--procedure get_screen_rgb(signal red,blue,green: out st_screen) is
--
--file fp_red : TEXT open READ_MODE is "C:\Users\korisnik\Documents\CA ASSIGNMENT\game_new_june\images\start_screen\red.txt";
--file fp_blue : TEXT open READ_MODE is "C:\Users\korisnik\Documents\CA ASSIGNMENT\game_new_june\images\start_screen\blue.txt";
--file fp_green : TEXT open READ_MODE is "C:\Users\korisnik\Documents\CA ASSIGNMENT\game_new_june\images\start_screen\green.txt";
--variable red_line,blue_line,green_line: arr_1;
--variable val_r,val_b,val_g:integer range 0 to 15;
--
--begin
--
--	for i in 0 to 64 loop
--		readline(fp_red,red_line);
--		readline(fp_blue,blue_line);
--		readline(fp_green,green_line);
--		for j in 0 to 630 loop
--			read(red_line,val_r);
--			read(blue_line,val_b);
--			read(green_line,val_g);
--			red(i,j)<=val_r;
--			blue(i,j)<=val_b;
--			green(i,j)<=val_g;
--		end loop;
--	end loop;
--	
--end get_screen_rgb;

procedure bull_color(signal color: in integer; signal R,G,B:out std_logic_vector) is
begin
	if color=1 then
		R<="1111";
		G<="0000";
		B<="1111";
	elsif color=2 then
		R<="1111";
		G<="1111";
		B<="0000";
	elsif color=3 then
		R<="0000";
		G<="1111";
		B<="1111";
	else
		R<="0000";
		G<="0000";
		B<="0000";
	end if;

end bull_color;
procedure en_create(signal en: inout enemy_type; signal pos,color: in integer) is
begin
	if color=0 then
	
		if pos = 0 then
			en.x<=pos_x1;
		elsif pos=1 then
			en.x<=pos_x2;
		else
			en.x<=pos_x3;
		end if;
		
		en.red<="1111";
		en.blue<="1111";
		en.green<="0000";
		
	elsif color=1 then
	
		if pos = 0 then
			en.x<=pos_x1;
		elsif pos=1 then
			en.x<=pos_x2;
		else
			en.x<=pos_x3;
		end if;
		
		en.red<="0000";
		en.blue<="1111";
		en.green<="1111";
	else
	
		if pos = 0 then
			en.x<=pos_x1;
		elsif pos=1 then
			en.x<=pos_x2;
		else
			en.x<=pos_x3;
		end if;
		
		en.red<="1111";
		en.green<="1111";
		en.blue<="0000";
	end if;
	en.y<=0;
	--en.en_destroy<='0';
	--en.en_on<='0';
end en_create;
--procedure pl_draw  (signal	pl: inout player; signal up,right,down,left,shoot: in std_logic; signal up2,right2,down2,left2: in std_logic
----signal ucheck,rcheck,dcheck,lcheck: in integer
--) is
--begin
--	
--	if right='1' then
--		--bottom area
--		if pl.y>=400 and pl.y<=459 and pl.x>=0 and pl.x<=619-pl_speed then
--			pl.x<=pl.x+pl_speed;
--		end if;
--		
--		--top area
--		if pl.y<400 and pl.y>=0 and ((pl.x>=0 and pl.x<=120-pl_speed) or (pl.x>=520 and pl.x<=619-pl_speed)) then
--			pl.x<=pl.x+pl_speed;
--		end if;
--	end if;
--	
--	if right2='1'  then
--		--bottom area
--		if pl.y>=400 and pl.y<=459 and pl.x>=0 and pl.x<=619-pl_speed then
--			pl.x<=pl.x+pl_speed;
--		end if;
--		
--		--top area
--		if pl.y<400 and pl.y>=0 and ((pl.x>=0 and pl.x<=120-pl_speed) or (pl.x>=520 and pl.x<=619-pl_speed)) then
--			pl.x<=pl.x+pl_speed;
--		end if;
--	end if;
--
--	
--	if left='1' then
--		--bottom area
--		if pl.y>=400 and pl.y<=459 and pl.x>=0+pl_speed and pl.x<=619 then
--			pl.x<=pl.x-pl_speed;
--		end if;
--		
--		--top area
--		if pl.y<400 and pl.y>=0 and ((pl.x>=0+pl_speed and pl.x<=120) or (pl.x>=520+pl_speed and pl.x<=619)) then
--			pl.x<=pl.x-pl_speed;
--		end if;
--	end if;
--	
--	if left2='1' then
--		--bottom area
--		if pl.y>=400 and pl.y<=459 and pl.x>=0+pl_speed and pl.x<=619 then
--			pl.x<=pl.x-pl_speed;
--		end if;
--		
--		--top area
--		if pl.y<400 and pl.y>=0 and ((pl.x>=0+pl_speed and pl.x<=120) or (pl.x>=520+pl_speed and pl.x<=619)) then
--			pl.x<=pl.x-pl_speed;
--		end if;
--	end if;
--	
--	if up='1'   then
--		if pl.x<=120 or pl.x>=500 then--left and right areas
--			if pl.y>=0+pl_speed then
--				pl.y<=pl.y-pl_speed;
--			end if;
--		else--center area
--			if pl.y>=400+pl_speed then
--				pl.y<=pl.y-pl_speed;
--			end if;
--		end if;
--	end if;
--	
--	if up2='1' then
--		if pl.x<=120 or pl.x>=500 then--left and right areas
--			if pl.y>=0+pl_speed then
--				pl.y<=pl.y-pl_speed;
--			end if;
--		else--center area
--			if pl.y>=400+pl_speed then
--				pl.y<=pl.y-pl_speed;
--			end if;
--		end if;
--	end if;
--
--	
--	if down='1' then
--	
--			if pl.y<=459-pl_speed then
--				pl.y<=pl.y+pl_speed;
--			end if;
--			
--	end if;
--	
--	if down2='1' then
--	
--			if pl.y<=459-pl_speed then
--				pl.y<=pl.y+pl_speed;
--			end if;
--			
--	end if;
--
--end pl_draw;

end game_package;
