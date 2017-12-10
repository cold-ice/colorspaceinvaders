----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:26 06/28/2015 
-- Design Name: 
-- Module Name:    pix_gen_new - Behavioral 
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
USE WORK.GAME_PACKAGE.ALL;
USE ieee.math_real.ALL;
USE WORK.screens_package.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity pix_gen_new is
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

end pix_gen_new;

architecture Behavioral of pix_gen_new is
signal pl: player := (x=>320,
							 y=>400,
							 red=>"1111",
							 blue=>"0000",
							 green=>"0000",
							 player_on=>'1');


signal state: integer range 0 to 3:=0;
signal cnt_speed: integer range 0 to 9:=0;
signal bullet_x:integer range 0 to 639;
signal bullet_y:integer range 0 to 479;
signal bonus_x:integer range 0 to 639:=639;
signal bonus_y:integer range 0 to 479:=479;
signal bullet_on: std_logic;
signal bullet_fired: std_logic:='0';
signal bonus_on:std_logic;
signal bonus_destroy: std_logic:='0';
signal bullet_red,bullet_green,bullet_blue: std_logic_vector (3 downto 0);
signal cnt: integer range 0 to 59:=0;
--signal en: enemy_arr;
--signal en_cnt: integer range 0 to 9:=0;
--signal en_free: integer range 0 to 9:=0;
signal en: enemy_type;
signal pos: integer range 0 to 2;
signal color: integer range 0 to 2;
--signal en_destroy: std_logic_vector (0 to 9) := (others=>'0');
signal en_destroy: std_logic:='1';
--signal en_on: std_logic_vector (0 to 9) := (others=>'0');
signal en_on: std_logic;
constant a1 :integer := 757;
constant c1 :integer := 593;
constant m1 :integer := 1021;
signal prev_value1: integer:=0;
constant a2 :integer := 607;
constant c2 :integer := 443;
constant m2 :integer := 997;
signal prev_value2: integer:=0;
signal dest_cnt: integer range 0 to 10:=0;
signal bonus_cnt: integer range 0 to 800:=0;
signal check: std_logic:='0';
signal livesbuf: integer range 0 to 10:=10;
signal bulletsbuf: integer range 0 to 200:=40;
signal scoresbuf: integer range 0 to 100:=0;
signal bull_check: integer:=0;
signal flag: std_logic:='0';
signal shoot: std_logic;
signal slow_enemy: integer range 0 to 3:=0;

begin
bullet_red<="1111";
bullet_green<="1111";
bullet_blue<="1111";
--pl.x<=pl_x;
--pl.y<=pl_y;



lives<=livesbuf;
bullets<=bulletsbuf/2;
score<=scoresbuf;
process(bulcol)
begin


end process;
	
Enemy_proc: process(clk_60,shoot,state,pl_x,pl_y)
begin
	
	if rising_edge(clk_60) then
		if bull_shoot>bull_check then
			shoot<='1';
			bull_check<=bull_shoot;
		else
			shoot<='0';
		end if;
	end if;
if livesbuf/=0 then
if state=1 then
if rising_edge(clk_60) then
--		if pl_x>pl.x then
--			pl.x<=pl.x+5;
--		elsif pl_x<pl.x then
--			pl.x<=pl.x-5;
--		end if;
--		if pl_y>pl.y then
--			pl.y<=pl.y+5;
--		elsif pl_y<pl.y then
--			pl.y<=pl.y-5;
--		end if;
if pl_x<=624 then
	pl.x<=pl_x;
else
	pl.x<=pl.x;
end if;
	pl.y<=pl_y;
	
--	if (flag='0') then
--		livesbuf<=20;
--		bulletsbuf<=90;
--		scoresbuf<=0;
--		flag <= '1';
--	end if;
	
		--enemy creation
		if en_destroy='1' and dest_cnt<9 then
			prev_value1<=(a1*prev_value1+c1) mod m1;
			pos<=prev_value1 mod 3;
			
			prev_value2<=(a2*prev_value2+c2) mod m2;
			color<=prev_value2 mod 3;
			
			en_create(en,pos,color);
			en_destroy<='0';
		end if;

		if dest_cnt=9 then	
			
			if ((a1*prev_value1+c1) mod 629)>500 then
				bonus_x<=(a1*prev_value1+c1) mod 629;
			else
				bonus_x<=(a1*prev_value1+c1) mod 125;
			end if;
			bonus_y<=(a2*prev_value2+c2) mod 469;
		
			if bonus_cnt=800 then
				en_destroy<='1';
				bonus_x<=639;
				bonus_y<=479;
				bonus_cnt<=0;
				bonus_destroy<='0';
				dest_cnt<=0;
				check<='0';
			else
				bonus_cnt<=bonus_cnt+1;
			end if;
			
		end if;
			
	--pl_draw(pl,up,right,down,left,shoot,up2,right2,down2,left2);
	
	if shoot='1' and bullet_fired='0' and bulletsbuf>=1 then
		bullet_fired<='1';
		bullet_x<=pl.x;
		bullet_y<=pl.y;
		bulletsbuf<=bulletsbuf-1;
	end if;
	
	if bullet_fired<='1' then
		if bullet_y<10 then
			bullet_fired<='0';
		else
			bullet_y<=bullet_y-5;
		end if;
	end if;
	
	if bonus_x/=639 and bonus_y/=479 and bonus_destroy='0' then
		if bonus_x>=pl.x and bonus_x<=pl.x+20 and bonus_y>=pl.y and bonus_y<=pl.y+20 then
			bonus_destroy<='1';
			bulletsbuf<=bulletsbuf+4;
		end if;
	end if;
	
	
	if en.y<380 and en_destroy='0' and slow_enemy/=3  then
		en.y<=en.y+1;
	end if;
	
	
	slow_enemy<=slow_enemy+1;
	
	if en_destroy='0' then
		if en.y=380 then
			en_destroy<='1';
			dest_cnt<=dest_cnt+1;
			livesbuf<=livesbuf-1;
		end if;
	end if;
		
	if en.y+20>=bullet_y and bullet_y>=en.y and en.x<=bullet_x and en.x+18>=bullet_x and en_destroy='0'
		and bullet_fired='1' and ((bulcol=1 and en.red<="1111" and en.green="0000" and en.blue="1111")
		or (bulcol=2 and en.red<="1111" and en.green="1111" and en.blue="0000")
		or (bulcol=3 and en.red<="0000" and en.green="1111" and en.blue="1111")) then
			en_destroy<='1';
			bullet_fired<='0';
			en.y<=0;
			dest_cnt<=dest_cnt+1;
			bulletsbuf<=bulletsbuf+2;
			scoresbuf<=scoresbuf+1;
			bullet_x<=pl.x;
			bullet_y<=pl.y;
	end if;
		
end if;
end if;
else
	if shoot='1' then
		livesbuf<=10;
		bulletsbuf<=40;
		scoresbuf<=0;
	end if;
end if;
end process;



RGB: process(pixel_x,pixel_y,pl,bullet_x,bullet_y,bullet_on,bullet_fired,state,shoot,bulcol)
--variable bg_check: std_logic:='1';

begin
if livesbuf=0 then
		draw_over(red,green,blue,pixel_x,pixel_y);
		if shoot='1' then
			state<=1;
		end if;

else
--if state=2 then
--	draw_over(red,green,blue,pixel_x,pixel_y);
--	if shoot='1' then
--		state<=1;
--	end if;
if state=0 then
		draw_start(red,green,blue,pixel_x,pixel_y);
		if shoot='1' then
			state<=1;
		end if;
		
elsif state=1 then

	if pixel_x>=pl.x and pixel_x<=pl.x+20 and pixel_y>=pl.y and pixel_y<=pl.y+20 then
		pl.player_on<='1';
	else 
		pl.player_on<='0';
	end if;
	
	
	if pixel_x>=bullet_x and pixel_x<=bullet_x+4 and pixel_y>=bullet_y and pixel_y<=bullet_y+4 and bullet_fired='1' then
		bullet_on<='1';
	else
		bullet_on<='0';
	end if;
	
	if bonus_x/=639 and pixel_x>=bonus_x and pixel_x<=bonus_x+10 and pixel_y>=bonus_y and pixel_y<=bonus_y+10 and bonus_destroy='0' then
		bonus_on<='1';
	else
		bonus_on<='0';
	end if;
	
	
	
	if en_destroy='0' and pixel_x>=en.x and pixel_x<=en.x+20 and pixel_y>=en.y and pixel_y<en.y+20 then
		en_on<='1';
	else
		en_on<='0';
	end if;
		
	
--	red<="0000";
--	blue<="0000";
--	green<="0000";
	
--	bg_check:='1';
if video_on='1' then
	if bonus_on='1' and bonus_destroy='0' then
		red<="1111";
		blue<="1111";
		green<="1111";
	elsif pl.player_on='1' then
		draw_player(red,green,blue,pixel_x,pixel_y,pl.x,pl.y);
	elsif bullet_on='1' then
		bull_color(bulcol,red,green,blue);
	elsif en_on='1' then
		draw_enemy(red,green,blue,pixel_x,pixel_y,en.x,en.y,en.red,en.green,en.blue);
	else
		borders(red,green,blue,pixel_x,pixel_y);
	end if;
else
	red<="0000";
	blue<="0000";
	green<="0000";
end if;
end if;
end if;
end process;
end Behavioral;