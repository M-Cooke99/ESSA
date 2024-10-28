-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Wed Oct 27 11:20:33 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RecongniserLogic IS 
	PORT
	(
		X :  IN  STD_LOGIC;
		Y :  IN  STD_LOGIC;
		Clock :  IN  STD_LOGIC;
		State :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END RecongniserLogic;

ARCHITECTURE bdf_type OF RecongniserLogic IS 

COMPONENT pass
	PORT(In : IN STD_LOGIC;
		 Out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT dflip
	PORT(D : IN STD_LOGIC;
		 C : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 NOTQ : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	In :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	State_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '1';
SYNTHESIZED_WIRE_6 <= '0';



SYNTHESIZED_WIRE_1 <= In(5) AND In(6);


SYNTHESIZED_WIRE_3 <= In(0) AND In(6);


SYNTHESIZED_WIRE_10 <= In(5) AND In(0) AND In(3) AND In(7) AND In(9) AND SYNTHESIZED_WIRE_0;


SYNTHESIZED_WIRE_12 <= In(3) AND In(8);


SYNTHESIZED_WIRE_14 <= In(5) AND In(8);


SYNTHESIZED_WIRE_13 <= In(7) AND In(8);


SYNTHESIZED_WIRE_15 <= In(6) AND In(9);


SYNTHESIZED_WIRE_16 <= In(0) AND In(8);


SYNTHESIZED_WIRE_17 <= In(0) AND In(2) AND In(5);


SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2 OR SYNTHESIZED_WIRE_3 OR SYNTHESIZED_WIRE_4 OR SYNTHESIZED_WIRE_5 OR SYNTHESIZED_WIRE_6 OR SYNTHESIZED_WIRE_7 OR SYNTHESIZED_WIRE_8;


SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_9 OR SYNTHESIZED_WIRE_10 OR SYNTHESIZED_WIRE_11;


SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_12 OR SYNTHESIZED_WIRE_13 OR SYNTHESIZED_WIRE_14 OR SYNTHESIZED_WIRE_15 OR SYNTHESIZED_WIRE_16 OR SYNTHESIZED_WIRE_17;


SYNTHESIZED_WIRE_2 <= In(3) AND In(5) AND In(9);


In(7) <= NOT(In(6));



In(9) <= NOT(In(8));



SYNTHESIZED_WIRE_4 <= In(3) AND In(4) AND In(8);


b2v_inst30 : pass
PORT MAP(In => State_ALTERA_SYNTHESIZED(2),
		 Out => In(0));


b2v_inst31 : pass
PORT MAP(In => State_ALTERA_SYNTHESIZED(1),
		 Out => In(3));


b2v_inst32 : pass
PORT MAP(In => State_ALTERA_SYNTHESIZED(0),
		 Out => In(5));


b2v_inst33 : dflip
PORT MAP(D => SYNTHESIZED_WIRE_18,
		 C => Clock,
		 Q => State_ALTERA_SYNTHESIZED(0),
		 NOTQ => In(4));


b2v_inst34 : dflip
PORT MAP(D => SYNTHESIZED_WIRE_19,
		 C => Clock,
		 Q => State_ALTERA_SYNTHESIZED(1),
		 NOTQ => In(2));


b2v_inst35 : dflip
PORT MAP(D => SYNTHESIZED_WIRE_20,
		 C => Clock,
		 Q => State_ALTERA_SYNTHESIZED(2),
		 NOTQ => In(1));




SYNTHESIZED_WIRE_5 <= In(0) AND In(5) AND In(9);


SYNTHESIZED_WIRE_7 <= In(2) AND In(6) AND In(9);


SYNTHESIZED_WIRE_8 <= In(1) AND In(2) AND In(7) AND In(8);


SYNTHESIZED_WIRE_11 <= In(1) AND In(3) AND In(4) AND In(7);


SYNTHESIZED_WIRE_9 <= In(1) AND In(4) AND In(6) AND In(8);

State <= State_ALTERA_SYNTHESIZED;

In(6) <= X;
In(8) <= Y;
END bdf_type;