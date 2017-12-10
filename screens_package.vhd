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

package screens_package is
--font type
--type vector is array (0 to 8*4-1) of std_logic;
type game_type is array(0 to 15) of std_logic_vector(0 to 8*4-1);
type letter_type is array(0 to 15) of std_logic_vector(0 to 7);
type start_type is array(0 to 15) of std_logic_vector(0 to 8*19-1);
type over_type is array(0 to 15) of std_logic_vector(0 to 8*9-1);
type ship_type is array(0 to 19) of std_logic_vector(0 to 19);
type bonus_type is array(0 to 9) of std_logic_vector(0 to 9);
type bullet_type is array(0 to 3) of std_logic_vector(0 to 3);

--type enemy_type is
--record
--	x: integer range 0 to 639;
--	y: integer range 0 to 479;
--	red: std_logic_vector(3 downto 0);
--	blue: std_logic_vector(3 downto 0);
--	green: std_logic_vector(3 downto 0);
--end record;
--type enemy_arr is array (0 to 9) of enemy_type;

procedure draw_player(signal R,G,B: out std_logic_vector; signal x,y,pl_x,pl_y: in integer);
procedure draw_enemy(signal R,G,B: out std_logic_vector; signal x,y,en_x,en_y: in integer;
signal en_red,en_green,en_blue: in std_logic_vector);
procedure draw_over(signal R,G,B: out std_logic_vector; signal x,y: in integer);
procedure borders(signal R,G,B: out std_logic_vector; signal x,y: in integer);

 constant game: game_type :=(
	"00000000000000000000000000000000", -- 0
   "00000000000000000000000000000000", -- 1
   "00111100000100001100001111111110", -- 2   ****
   "01100110001110001110011101100110", -- 3  **  **
   "11000010011011001111111101100010", -- 4 **    *
   "11000000110001101111111101101000", -- 5 **
   "11000000110001101101101101111000", -- 6 **
   "11011110111111101100001101101000", -- 7 ** ****
   "11000110110001101100001101100000", -- 8 **   **
   "11000110110001101100001101100010", -- 9 **   **
   "01100110110001101100001101100110", -- a  **  **
   "00111010110001101100001111111110", -- b   *** *ame
   "00000000000000000000000000000000", -- c
   "00000000000000000000000000000000", -- d
   "00000000000000000000000000000000", -- e
   "00000000000000000000000000000000" -- f
);

constant P: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "11111100", -- 2 ******
   "01100110", -- 3  **  **
   "01100110", -- 4  **  **
   "01100110", -- 5  **  **
   "01111100", -- 6  *****
   "01100000", -- 7  **
   "01100000", -- 8  **
   "01100000", -- 9  **
   "01100000", -- a  **
   "11110000", -- b ****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant R: letter_type :=(
"00000000", -- 0
   "00000000", -- 1
   "11111100", -- 2 ******
   "01100110", -- 3  **  **
   "01100110", -- 4  **  **
   "01100110", -- 5  **  **
   "01111100", -- 6  *****
   "01101100", -- 7  ** **
   "01100110", -- 8  **  **
   "01100110", -- 9  **  **
   "01100110", -- a  **  **
   "11100110", -- b ***  **
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant E: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "11111110", -- 2 *******
   "01100110", -- 3  **  **
   "01100010", -- 4  **   *
   "01101000", -- 5  ** *
   "01111000", -- 6  ****
   "01101000", -- 7  ** *
   "01100000", -- 8  **
   "01100010", -- 9  **   *
   "01100110", -- a  **  **
   "11111110", -- b *******
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant S: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "11000110", -- 4 **   **
   "01100000", -- 5  **
   "00111000", -- 6   ***
   "00001100", -- 7     **
   "00000110", -- 8      **
   "11000110", -- 9 **   **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant space: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "00000000", -- 2  *****
   "00000000", -- 3 **   **
   "00000000", -- 4 **   **
   "00000000", -- 5  **
   "00000000", -- 6   ***
   "00000000", -- 7     **
   "00000000", -- 8      **
   "00000000", -- 9 **   **
   "00000000", -- a **   **
   "00000000", -- b  ***** pace
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant F: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "11111110", -- 2 *******
   "01100110", -- 3  **  **
   "01100010", -- 4  **   *
   "01101000", -- 5  ** *
   "01111000", -- 6  ****
   "01101000", -- 7  ** *
   "01100000", -- 8  **
   "01100000", -- 9  **
   "01100000", -- a  **
   "11110000", -- b ****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant I: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "00111100", -- 2   ****
   "00011000", -- 3    **
   "00011000", -- 4    **
   "00011000", -- 5    **
   "00011000", -- 6    **
   "00011000", -- 7    **
   "00011000", -- 8    **
   "00011000", -- 9    **
   "00011000", -- a    **
   "00111100", -- b   ****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant T: letter_type :=(
	 "00000000", -- 0
   "00000000", -- 1
   "11111111", -- 2 ********
   "11011011", -- 3 ** ** **
   "10011001", -- 4 *  **  *
   "00011000", -- 5    **
   "00011000", -- 6    **
   "00011000", -- 7    **
   "00011000", -- 8    **
   "00011000", -- 9    **
   "00011000", -- a    **
   "00111100", -- b   ****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant O: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "11000110", -- 4 **   **
   "11000110", -- 5 **   **
   "11000110", -- 6 **   **
   "11000110", -- 7 **   **
   "11000110", -- 8 **   **
   "11000110", -- 9 **   **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant A: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "00010000", -- 2    *
   "00111000", -- 3   ***
   "01101100", -- 4  ** **
   "11000110", -- 5 **   **
   "11000110", -- 6 **   **
   "11111110", -- 7 *******
   "11000110", -- 8 **   **
   "11000110", -- 9 **   **
   "11000110", -- a **   **
   "11000110", -- b **   **
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant V: letter_type :=(
	"00000000", -- 0
   "00000000", -- 1
   "11000011", -- 2 **    **
   "11000011", -- 3 **    **
   "11000011", -- 4 **    **
   "11000011", -- 5 **    **
   "11000011", -- 6 **    **
   "11000011", -- 7 **    **
   "11000011", -- 8 **    **
   "01100110", -- 9  **  **
   "00111100", -- a   ****
   "00011000", -- b    **
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
);

constant start: start_type:=(
	P(0) & R(0) & E(0) & S(0) & S(0) & space(0) & F(0) & I(0) & R(0) & E(0) & space(0) & T(0) & O(0) & space(0) & S(0) & T(0) & A(0) & R(0) & T(0),
	P(1) & R(1) & E(1) & S(1) & S(1) & space(1) & F(1) & I(1) & R(1) & E(1) & space(1) & T(1) & O(1) & space(1) & S(1) & T(1) & A(1) & R(1) & T(1),
	P(2) & R(2) & E(2) & S(2) & S(2) & space(2) & F(2) & I(2) & R(2) & E(2) & space(2) & T(2) & O(2) & space(2) & S(2) & T(2) & A(2) & R(2) & T(2),
	P(3) & R(3) & E(3) & S(3) & S(3) & space(3) & F(3) & I(3) & R(3) & E(3) & space(3) & T(3) & O(3) & space(3) & S(3) & T(3) & A(3) & R(3) & T(3),
	P(4) & R(4) & E(4) & S(4) & S(4) & space(4) & F(4) & I(4) & R(4) & E(4) & space(4) & T(4) & O(4) & space(4) & S(4) & T(4) & A(4) & R(4) & T(4),
	P(5) & R(5) & E(5) & S(5) & S(5) & space(5) & F(5) & I(5) & R(5) & E(5) & space(5) & T(5) & O(5) & space(5) & S(5) & T(5) & A(5) & R(5) & T(5),
	P(6) & R(6) & E(6) & S(6) & S(6) & space(6) & F(6) & I(6) & R(6) & E(6) & space(6) & T(6) & O(6) & space(6) & S(6) & T(6) & A(6) & R(6) & T(6),
	P(7) & R(7) & E(7) & S(7) & S(7) & space(7) & F(7) & I(7) & R(7) & E(7) & space(7) & T(7) & O(7) & space(7) & S(7) & T(7) & A(7) & R(7) & T(7),
	P(8) & R(8) & E(8) & S(8) & S(8) & space(8) & F(8) & I(8) & R(8) & E(8) & space(8) & T(8) & O(8) & space(8) & S(8) & T(8) & A(8) & R(8) & T(8),
	P(9) & R(9) & E(9) & S(9) & S(9) & space(9) & F(9) & I(9) & R(9) & E(9) & space(9) & T(9) & O(9) & space(9) & S(9) & T(9) & A(9) & R(9) & T(9),
	P(10) & R(10) & E(10) & S(10) & S(10) & space(10) & F(10) & I(10) & R(10) & E(10) & space(10) & T(10) & O(10) & space(10) & S(10) & T(10) & A(10) & R(10) & T(10),
	P(11) & R(11) & E(11) & S(11) & S(11) & space(11) & F(11) & I(11) & R(11) & E(11) & space(11) & T(11) & O(11) & space(11) & S(11) & T(11) & A(11) & R(11) & T(11),
	P(12) & R(12) & E(12) & S(12) & S(12) & space(12) & F(12) & I(12) & R(12) & E(12) & space(12) & T(12) & O(12) & space(12) & S(12) & T(12) & A(12) & R(12) & T(12),
	P(13) & R(13) & E(13) & S(13) & S(13) & space(13) & F(13) & I(13) & R(13) & E(13) & space(13) & T(13) & O(13) & space(13) & S(13) & T(13) & A(13) & R(13) & T(13),
	P(14) & R(14) & E(14) & S(14) & S(14) & space(14) & F(14) & I(14) & R(14) & E(14) & space(14) & T(14) & O(14) & space(14) & S(14) & T(14) & A(14) & R(14) & T(14),
	P(15) & R(15) & E(15) & S(15) & S(15) & space(15) & F(15) & I(15) & R(15) & E(15) & space(15) & T(15) & O(15) & space(15) & S(15) & T(15) & A(15) & R(15) & T(15)	
);

constant over: over_type:=(
	game(0) & space(0) & O(0) & V(0) & E(0) & R(0),
	game(1) & space(1) & O(1) & V(1) & E(1) & R(1),
	game(2) & space(2) & O(2) & V(2) & E(2) & R(2),
	game(3) & space(3) & O(3) & V(3) & E(3) & R(3),
	game(4) & space(4) & O(4) & V(4) & E(4) & R(4),
	game(5) & space(5) & O(5) & V(5) & E(5) & R(5),
	game(6) & space(6) & O(6) & V(6) & E(6) & R(6),
	game(7) & space(7) & O(7) & V(7) & E(7) & R(7),
	game(8) & space(8) & O(8) & V(8) & E(8) & R(8),
	game(9) & space(9) & O(9) & V(9) & E(9) & R(9),
	game(10) & space(10) & O(10) & V(10) & E(10) & R(10),
	game(11) & space(11) & O(11) & V(11) & E(11) & R(11),
	game(12) & space(12) & O(12) & V(12) & E(12) & R(12),
	game(13) & space(13) & O(13) & V(13) & E(13) & R(13),
	game(14) & space(14) & O(14) & V(14) & E(14) & R(14),
	game(15) & space(15) & O(15) & V(15) & E(15) & R(15)
);

constant ship: ship_type:=(
	"00000000011000000000", --1 
	"00000000011000000000", --2
	"00000000011000000000", --3
	"00000000011000000000", --4
	"00000000011000000000", --5
	"00000000011000000000", --6
	"00000000111100000000", --7
	"00000001111110000000", --8
	"00000011111111000000", --9
	"00001111111111110000", --10
	"00011111111111111000", --11
	"00111111111111111100", --12
	"01111111111111111110", --13
	"11111111111111111111", --14
	"11111111111111111111", --15
	"11110111111111101111", --16
	"11100011111111000111", --17
	"11000001111110000011", --18
	"10000000111100000001", --19
	"10000000011000000001" --20
);

constant enemy: ship_type:=(
	"00000111111111100000", --1 
	"00001111111111110000", --2
	"00111111111111111100", --3
	"00111111111111111100", --4
	"01111111111111111110", --5
	"01110011111111001110", --6
	"11110000111100001111", --7
	"11111000011000011111", --8
	"11111111111111111111", --9
	"11111111100111111111", --10
	"11111111000011111111", --11
	"01111111011011111110", --12
	"01111111111111111110", --13
	"00111111111111111100", --14
	"00111111111111111100", --15
	"00011001100110011000", --16
	"00011001100110011000", --17
	"00011001100110011000", --18
	"00011001100110011000", --19
	"00011001100110011000" --20
);

constant bonus: bonus_type:=(
	"0000110000", --1 
	"0001111000", --2
	"0011111100", --3
	"0011111100", --4
	"0011111100", --5
	"0011111100", --6
	"0111111110", --7
	"0111111110", --8
	"1111111111", --9
	"1111111111" --10
);

constant bullet: bullet_type:=(
	"0110",
	"1111",
	"1111",
	"0110"
);
   
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
procedure draw_start( signal R,G,B: out std_logic_vector; signal x,y: in integer);
--

end screens_package;

package body screens_package is

procedure draw_start(signal R,G,B: out std_logic_vector; signal x,y: in integer) is
variable line :std_logic_vector(0 to 151);
begin
if x>=50 and x<8*19+50 and y>=50 and y<50+16then
	line:=start(y-50);
	if(line(x-50)='1') then
		R<="1111";
		G<="1111";
		B<="1111";
	else
		R<="0000";
		G<="0000";
		B<="0000";
	end if;
else
	R<="0000";
	G<="0000";
	B<="0000";
end if;
end draw_start;

procedure draw_over(signal R,G,B: out std_logic_vector; signal x,y: in integer) is
variable line :std_logic_vector(0 to 8*9-1);
begin
if x>=50 and x<8*9+50 and y>=50 and y<50+16 then
	line:=over(y-50);
	if(line(x-50)='1') then
		R<="1111";
		G<="1111";
		B<="1111";
	else
		R<="0000";
		G<="0000";
		B<="0000";
	end if;
else
	R<="0000";
	G<="0000";
	B<="0000";
end if;
end draw_over;

procedure draw_player(signal R,G,B: out std_logic_vector; signal x,y,pl_x,pl_y: in integer) is
--variable line: std_logic_vector(0 to 19);
begin
	case (y-pl_y) is
		when 0 =>
			if(x-pl_x=10-1 and x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		when 1 =>
			if(x-pl_x=10-1 and x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		when 2=>
			if(x-pl_x=10-1 and x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		when 3 =>
			if(x-pl_x=10-1 and x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		when 4 =>
			if(x-pl_x=10-1 and x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
		when 5 =>
			if(x-pl_x=10-1 and x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;

		when 6 =>
			if(x-pl_x>8-1 and x-pl_x<13-1) then
			R<="1111";
			G<="0000";
			B<="0000";
		else
			R<="0000";
			G<="0000";
			B<="0000";
		end if;
		
		when 7 =>
			if(x-pl_x>7-1 and x-pl_x<14-1) then
			R<="1111";
			G<="0000";
			B<="0000";
		else
			R<="0000";
			G<="0000";
			B<="0000";
		end if;
		
		when 8 =>
			if(x-pl_x>6-1 and x-pl_x<15-1) then
			R<="1111";
			G<="0000";
			B<="0000";
		else
			R<="0000";
			G<="0000";
			B<="0000";
		end if;
		
		when 9 =>
			if(x-pl_x>4-1 and x-pl_x<17-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
		when 10 =>
			if(x-pl_x>3-1 and x-pl_x<18-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
		when 11 =>
			if(x-pl_x>2-1 and x-pl_x<19-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
		when 12 =>
			if(x-pl_x>1-1 and x-pl_x<20-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
		when 13 to 14 =>
				R<="1111";
				G<="0000";
				B<="0000";
				
		when 15=>
			if(x-pl_x=5-1 or x-pl_x=16-1) then
				R<="0000";
				G<="0000";
				B<="0000";
			else
				R<="1111";
				G<="0000";
				B<="0000";
		end if;
		
		when 16=>
			if((x-pl_x>=4-1 and x-pl_x<=6-1) or (x-pl_x>=15-1 and x-pl_x<=17-1)) then
				R<="0000";
				G<="0000";
				B<="0000";
			else
				R<="1111";
				G<="0000";
				B<="0000";
		end if;
		
		when 17=>
			if((x-pl_x>=3-1 and x-pl_x<=7-1) or (x-pl_x>=14-1 and x-pl_x<=18-1)) then
				R<="0000";
				G<="0000";
				B<="0000";
			else
				R<="1111";
				G<="0000";
				B<="0000";
		end if;
		
		when 18=>
			if(x-pl_x=1-1 or x-pl_x=20-1 or (x-pl_x>=9-1 and x-pl_x<=12-1)) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
		when 19=>
			if(x-pl_x=1-1 or x-pl_x=20-1 or x-pl_x=10-1 or x-pl_x=11-1) then
				R<="1111";
				G<="0000";
				B<="0000";
			else
				R<="0000";
				G<="0000";
				B<="0000";
		end if;
		
	end case;
		
--	if (y-pl_y<=5) then
--		if(x-pl_x=5 or x-pl_x=5) then
--			R<="1111";
--			G<="0000";
--			B<="0000";
--		else
--			R<="0000";
--			G<="0000";
--			B<="0000";
--		end if;
--	end if;
--line:=ship(y-pl_y);
--if(line(x-pl_x)='1') then
--	R<="1111";
--	G<="0000";
--	B<="0000";
--else
--	R<="0000";
--	G<="0000";
--	B<="0000";
--end if;

end draw_player;

procedure draw_enemy(signal R,G,B: out std_logic_vector; signal x,y,en_x,en_y: in integer;
signal en_red,en_green,en_blue: in std_logic_vector) is
variable line: std_logic_vector(0 to 19);
begin
line:=enemy(y-en_y);
if(line(x-en_x)='1' and (x-en_x)/=19) then
	R<=en_red;
	G<=en_green;
	B<=en_blue;
else
	R<="0000";
	G<="0000";
	B<="1000";
end if;
end draw_enemy;


procedure borders(signal R,G,B: out std_logic_vector; signal x,y: in integer) is
begin
	if y< 379+20 and (x>=140) and (x<=520) then
		R<="0000";
		G<="0000";
		B<="1000";
	elsif (y=379+20 or y=380+20) and (x>=140) and (x<=520) then
		R<="1111";
		G<="1111";
		B<="1111";
	else
		R<="0000";
		G<="0000";
		B<="0000";
	end if;
end borders;
end screens_package;