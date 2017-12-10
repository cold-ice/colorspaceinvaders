--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:20 06/29/2015
-- Design Name:   
-- Module Name:   C:/Users/korisnik/Documents/CA ASSIGNMENT/game_new_june/testing_random.vhd
-- Project Name:  game_new_june
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.math_real.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY testing_random IS
END testing_random;
 
ARCHITECTURE behavior OF testing_random IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_module
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         R : OUT  std_logic_vector(3 downto 0);
         G : OUT  std_logic_vector(3 downto 0);
         B : OUT  std_logic_vector(3 downto 0);
         H : OUT  std_logic;
         V : OUT  std_logic;
         Up : IN  std_logic;
         Down : IN  std_logic;
         Right : IN  std_logic;
         Left : IN  std_logic;
         tw_make : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal Up : std_logic := '0';
   signal Down : std_logic := '0';
   signal Right : std_logic := '0';
   signal Left : std_logic := '0';
   signal tw_make : std_logic := '0';

 	--Outputs
   signal R : std_logic_vector(3 downto 0);
   signal G : std_logic_vector(3 downto 0);
   signal B : std_logic_vector(3 downto 0);
   signal H : std_logic;
   signal V : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_module PORT MAP (
          clock => clock,
          reset => reset,
          R => R,
          G => G,
          B => B,
          H => H,
          V => V,
          Up => Up,
          Down => Down,
          Right => Right,
          Left => Left,
          tw_make => tw_make
        );

PROCESS
  VARIABLE seed1, seed2: positive; -- Seed and state values for random generator
  VARIABLE rand: real;-- Random real-number value in range 0 to 1.0
  VARIABLE int_rand: integer;
BEGIN
	wait for clock_period/2;
    UNIFORM(seed1, seed2, rand);
	 rand:=rand*2.99;
	 int_rand := INTEGER(FLOOR(rand));
END process;	 

END;
