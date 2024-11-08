-- Copyright (C) 2024  Intel Corporation. All rights reserved.
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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/28/2024 12:17:30"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          VGASystem
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY VGASystem_vhd_vec_tst IS
END VGASystem_vhd_vec_tst;
ARCHITECTURE VGASystem_arch OF VGASystem_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL Hsync : STD_LOGIC;
SIGNAL out : STD_LOGIC;
SIGNAL out_B : STD_LOGIC;
SIGNAL out_G : STD_LOGIC;
SIGNAL out_R : STD_LOGIC;
SIGNAL RST : STD_LOGIC;
SIGNAL VALUE : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL Vsync : STD_LOGIC;
COMPONENT VGASystem
	PORT (
	CLK : IN STD_LOGIC;
	Hsync : OUT STD_LOGIC;
	\out\ : OUT STD_LOGIC;
	out_B : OUT STD_LOGIC;
	out_G : OUT STD_LOGIC;
	out_R : OUT STD_LOGIC;
	RST : IN STD_LOGIC;
	VALUE : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	Vsync : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : VGASystem
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	Hsync => Hsync,
	\out\ => out,
	out_B => out_B,
	out_G => out_G,
	out_R => out_R,
	RST => RST,
	VALUE => VALUE,
	Vsync => Vsync
	);
-- VALUE[8]
t_prcs_VALUE_8: PROCESS
BEGIN
	VALUE(8) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_8;
-- VALUE[7]
t_prcs_VALUE_7: PROCESS
BEGIN
	VALUE(7) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_7;
-- VALUE[6]
t_prcs_VALUE_6: PROCESS
BEGIN
	VALUE(6) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_6;
-- VALUE[5]
t_prcs_VALUE_5: PROCESS
BEGIN
	VALUE(5) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_5;
-- VALUE[4]
t_prcs_VALUE_4: PROCESS
BEGIN
	VALUE(4) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_4;
-- VALUE[3]
t_prcs_VALUE_3: PROCESS
BEGIN
	VALUE(3) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_3;
-- VALUE[2]
t_prcs_VALUE_2: PROCESS
BEGIN
	VALUE(2) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_2;
-- VALUE[1]
t_prcs_VALUE_1: PROCESS
BEGIN
	VALUE(1) <= '0';
WAIT;
END PROCESS t_prcs_VALUE_1;
-- VALUE[0]
t_prcs_VALUE_0: PROCESS
BEGIN
	VALUE(0) <= '1';
WAIT;
END PROCESS t_prcs_VALUE_0;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;
END VGASystem_arch;
