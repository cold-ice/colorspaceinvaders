----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:59 05/16/2015 
-- Design Name: 
-- Module Name:    pix_gen - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pix_gen is
port(
	pixel_x,pixel_y: in integer;
	button_r, button_l, button_u, button_d: in std_logic;
	red,green,blue: out std_logic_vector(3 downto 0);
	video_on: in std_logic;
	clk_60: in std_logic;
	tw_make: in std_logic);
	
end pix_gen;

architecture Behavioral of pix_gen is

signal pl_red,pl_blue,pl_green: std_logic_vector(3 downto 0);
signal tw_red,tw_blue,tw_green: std_logic_vector(3 downto 0);
signal bullet_red,bullet_blue,bullet_green: std_logic_vector(3 downto 0);

signal tw_cnt: integer range 0 to 10:=0;
type x_arr is array (0 to 9) of integer range 0 to 639;
type y_arr is array (0 to 9) of integer range 0 to 480;
type t_tim_arr is array (0 to 9) of integer range 0 to 3;
type t_path_arr is array (0 to 47) of integer range 0 to 10;
type en_health_arr is array (0 to 9) of integer range 0 to 2;

signal tw_x_draw: x_arr:=(others=>0);
signal tw_y_draw: y_arr;
signal tw_timer: t_tim_arr := (others=>0);
signal tw_on: std_logic_vector(0 to 9):=(others=>'0');
signal tw_path: t_path_arr:=(others=>0);

signal bullet_x_init: x_arr:=(others=>0);
signal bullet_y_init: y_arr;
signal bullet_x_final: x_arr;
signal bullet_y_final: y_arr;
signal bullet_on: std_logic_vector(0 to 9):=(others=>'0');

signal pl_x_draw: integer range 0 to 639:=0;
signal pl_y_draw: integer range 0 to 479:=220;
signal pl_on: std_logic;

signal en_health: en_health_arr:=(others=>2);
signal en_x_draw: x_arr:= (others=>620);
signal en_y_draw: y_arr := (others=>240);
signal money: integer range 0 to 120:=20;
signal en_destroy: std_logic_vector(0 to 9):=(others=>'0');
signal en_on: std_logic_vector(0 to 9):=(others=>'0');  
signal en_red,en_blue,en_green: std_logic_vector(3 downto 0);
signal en_destroy_temp:std_logic_vector(0 to 9):=(others=>'0');
signal cnt_speed: integer range 0 to 59:=0;
signal cnt_en: integer range 0 to 20:=0;
--signal counter: integer range 0 to 59:=0;


--constant en_num: integer:=20;

	
begin

-------------------**********Player Generation****************------------------
Generate_Player: process(clk_60, button_r, button_l, button_u, button_d)
	begin
		if rising_edge(clk_60) then

			if (button_r = '1') and (pl_x_draw < 640-10-10) then
				pl_x_draw<=pl_x_draw+10;
			end if;

			if (button_l = '1') and (pl_x_draw >= 10) then
				pl_x_draw<=pl_x_draw-10;
			end if;

			if (button_d = '1') and (pl_y_draw < 480-10-10) then
				pl_y_draw<=pl_y_draw+10;
			end if;

			if (button_u = '1') and (pl_y_draw >= 10) then
				pl_y_draw<=pl_y_draw-10;
			end if;

		end if;
end process;

----------------------***********************************------------------------------

-----------------------***********Player Enable**************-----------------------
pl_on <=
'1' when (pixel_x>=pl_x_draw) and (pixel_x<=pl_x_draw+10) and (pixel_y>=pl_y_draw) and (pixel_y<=pl_y_draw+10) else
'0';

pl_red<="1111";
pl_blue<="0000";
pl_green<="0000";
--------------------------**********************------------------------------

------------------******************Enemy Generation**************--------------------
Generate_Enemies: process(clk_60,tw_make)
variable pos: integer range 0 to 9;
variable check: std_logic;
begin
	if rising_edge(clk_60) then
	
		if tw_make = '1' then
			check:='1';
			
			for i in 0 to 9 loop
				if i<tw_cnt then
					if tw_x_draw(i)=pl_x_draw and tw_y_draw(i)=pl_y_draw then
						check:='0';
					end if;
				end if;
				
			end loop;
			
			if check='1' then
				if money>=5 then
					tw_x_draw(tw_cnt)<=pl_x_draw;
					tw_y_draw(tw_cnt)<=pl_y_draw;
					tw_path(pl_x_draw/10)<=tw_cnt+1;
					tw_cnt<=tw_cnt+1;
					money<=money-5;
				end if;
			end if;
			
		end if;
		
		--enemy generation
		
		if cnt_speed = 59 then
				if en_x_draw(0)>=10 then
					en_x_draw(0)<=en_x_draw(0)-10;
				end if;
				
				if tw_path(en_x_draw(0)/10)/=0 then
					if tw_timer(tw_path(en_x_draw(0)/10)-1)=0 then
						en_health(0)<=en_health(0)-1;
						if en_health(0)=0 then
							bullet_x_init(tw_path(en_x_draw(0)/10) - 1)<=tw_x_draw(tw_path(en_x_draw(0)/10) - 1);
							bullet_y_init(tw_path(en_x_draw(0)/10) - 1)<=tw_y_draw(tw_path(en_x_draw(0)/10) - 1);
							bullet_x_final(tw_path(en_x_draw(0)/10) - 1)<=en_x_draw(0);
							bullet_y_final(tw_path(en_x_draw(0)/10) - 1)<=en_y_draw(0);
							en_destroy(0)<='1';
							money<=money+5;
						end if;
						tw_timer(tw_path(en_x_draw(0)/10)-1)<=1;
					end if;
				end if;
				
				for i in 1 to 9 loop
				
					
					
--					if tw_path(en_x_draw(i)/10)/=0 and (en_destroy(i)='0') then
--						if tw_timer(tw_path(en_x_draw(i)/10)-1)=0 then
--							en_health(i)<=en_health(i)-1;
--							bullet_x_init(tw_path(en_x_draw(i)/10) - 1)<=tw_x_draw(tw_path(en_x_draw(i)/10) - 1);
--							bullet_y_init(tw_path(en_x_draw(i)/10) - 1)<=tw_y_draw(tw_path(en_x_draw(i)/10) - 1);
--							bullet_x_final(tw_path(en_x_draw(i)/10) - 1)<=en_x_draw(i);
--							bullet_y_final(tw_path(en_x_draw(i)/10) - 1)<=en_y_draw(i);
--						if en_health(i)=0 then
--							en_destroy(i)<='1';
--							money<=money+5;
--						end if;
--						tw_timer(tw_path(en_x_draw(i)/10)-1)<=1;
--						end if;
--					end if;
					
					if tw_path((en_x_draw(i)/10)-1)/=0 and (en_destroy(i)='0') then
						bullet_x_init(tw_path(en_x_draw(i)/10) - 1)<=en_x_draw(i)-10;
						bullet_y_init(tw_path(en_x_draw(i)/10) - 1)<=en_y_draw(i)-20;
						bullet_y_final(tw_path(en_x_draw(i)/10) - 1)<=en_y_draw(i);
						en_health(i)<=en_health(i)-1;
					end if;
					
					if tw_path(en_x_draw(i)/10)/=0 and (en_destroy(i)='0') then
						if en_health(i)=0 then
							en_destroy(i)<='1';
							money<=money+5;
						end if;
					end if;
					
					if (en_x_draw(i-1)<591) and (en_x_draw(i)>11) and (en_destroy(i)='0') then
						en_x_draw(i)<=en_x_draw(i)-10;
					end if;
					
				end loop;
				
				for i in 0 to 9 loop
					if tw_timer(i)=3 then
						tw_timer(i)<=0;
					end if;
					if tw_timer(i)/=0 then
						tw_timer(i)<=tw_timer(i)+1;
					end if;
				end loop;
				
			cnt_speed <= 0;
			
		else
			for i in 0 to 9 loop
				if bullet_x_init(i)/=0 then
					if bullet_y_init(i)=bullet_y_final(i) then
						bullet_x_init(i)<=0;
					else
						bullet_y_init(i)<=bullet_y_init(i)+1;
					end if;
				end if;
			end loop;
--			if cnt_speed>0 and cnt_speed<=20 then
--				if bullet_x_init(0)/=0 then
--					if bullet_y_init(0)=bullet_y_final(0) then
--						bullet_x_init(0)<=0;
--					else
--						bullet_y_init(0)<=bullet_y_init(0)+1;
--					end if;
--				end if;
--			end if;
			
			cnt_speed<=cnt_speed+1;
		end if;		
		
	end if;
end process;

process(pixel_x,pixel_y)
begin


--for j in 0 to 9 loop
--	en_destroy(j)<=en_destroy_temp(j);
--end loop;
		

for i in 0 to 9 loop
	
		if (en_destroy(i)='0') and (en_x_draw(i)<=pixel_x) and (en_x_draw(i)+10>=pixel_x) and (en_y_draw(i)<=pixel_y) and (en_y_draw(i)+10>=pixel_y) then
	
			en_on(i)<='1';
		else
			en_on(i)<='0';
		end if;
	
		if tw_x_draw(i)/=0 then
			if (tw_x_draw(i)<=pixel_x) and (tw_x_draw(i)+10>=pixel_x) and (pixel_y>=tw_y_draw(i)) and (pixel_y<=tw_y_draw(i)+10) then
				tw_on(i)<='1';
			else
				tw_on(i)<='0';
			end if;
		end if;
		--(bullet_x_init(i)/=0) and (pixel_x<=bullet_x_init(i)+2) and (pixel_y=>bullet_y_init(i)) and (pixel_y<=bullet_y_init(i)+2)
			if (bullet_x_init(i)/=0) and  (pixel_x>=bullet_x_init(i)) and (pixel_x<=bullet_x_init(i)+2) and (pixel_y>=bullet_y_init(i))  and (pixel_y<=bullet_y_init(i)+2) then
				bullet_on(i)<='1';
			else
				bullet_on(i)<='0';
			end if;
		
end loop;

end process;

en_red<="0000";
en_blue<="1111";
en_green<="0000";


tw_red<="0000";
tw_blue<="0000";
tw_green<="1111";

bullet_red<="1111";
bullet_blue<="1111";
bullet_green<="1111";

--------------------*********RGB MUX*************-------------------------
RGB_MUX: process(video_on,pixel_x,pixel_y)
variable bg: std_logic :='1';
begin
	if video_on = '1' then
	
		red<="0000";
		blue<="0000";
		green<="0000";
		
		if pl_on='1' then
			red<=pl_red;
			blue<=pl_blue;
			green<=pl_green;
			bg:='0';
		end if;
		
		for i in 0 to 9 loop
			if en_on(i)='1' then
				red<=en_red;
				blue<=en_blue;
				green<=en_green;
				bg:='0';
			end if;
			
			if i<tw_cnt then
				if tw_on(i)='1' then
					red<=tw_red;
					blue<=tw_blue;
					green<=tw_green;
					bg:='0';
				end if;
			end if;
			
			if bullet_on(i)='1' then
				red<=bullet_red;
				blue<=bullet_blue;
				green<=bullet_green;
				bg:='0';
			end if;
			
		end loop;
		
		if bg='1' then
			red<="0000";
			blue<="0000";
			green<="0000";
		end if;

	else
		red<="0000";
		blue<="0000";
		green<="0000";
	end if;
	
end process;


end Behavioral;
