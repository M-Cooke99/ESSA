// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed Oct 27 11:42:11 2021"

module RecongniserLogicVerilog(
	W,
	X,
	Y,
	Z,
	Clock,
	State
);


input wire	W;
input wire	X;
input wire	Y;
input wire	Z;
input wire	Clock;
output wire	[2:0] State;

wire	[13:0] In;
reg	[2:0] State_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;

Pass	b2v_inst30(
	.In(State_ALTERA_SYNTHESIZED[2]),
	.Out(In[0]));

assign	In[1] =  ~State_ALTERA_SYNTHESIZED[2];
	
Pass	b2v_inst31(
	.In(State_ALTERA_SYNTHESIZED[1]),
	.Out(In[2]));
	
assign	In[3] =  ~State_ALTERA_SYNTHESIZED[1];


Pass	b2v_inst32(
	.In(State_ALTERA_SYNTHESIZED[0]),
	.Out(In[4]));
	
assign	In[5] =  ~State_ALTERA_SYNTHESIZED[0];

assign	In[6] = W;

assign	In[7] =  ~In[6];

assign	In[8] = X;

assign	In[9] =  ~In[8];

assign	In[10] = Y;

assign	In[11] =  ~In[10];

assign	In[12] = Z;

assign	In[13] =  ~In[12];

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14 | SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_3 = In[2] & In[6] & In[9] & In[11] & In[13];

assign	SYNTHESIZED_WIRE_4 = In[0] & In[12];

assign	SYNTHESIZED_WIRE_5 = In[0] & In[10];

assign	SYNTHESIZED_WIRE_6 = In[0] & In[8];

assign	SYNTHESIZED_WIRE_7 = In[0] & In[6];

assign	SYNTHESIZED_WIRE_8 = In[1] & In[4] & In[7] & In[9] & In[10] & In[13];

assign	SYNTHESIZED_WIRE_9 = In[2] & In[5] & In[8];

assign	SYNTHESIZED_WIRE_10 = In[2] & In[12];

assign	SYNTHESIZED_WIRE_11 = In[2] & In[10];

assign	SYNTHESIZED_WIRE_12 = In[2] & In[6];

assign	SYNTHESIZED_WIRE_13 = In[5] & In[7] & In[9] & In[11] & In[12];

assign	SYNTHESIZED_WIRE_14 = In[4] & In[10] & In[12];

assign	SYNTHESIZED_WIRE_15 = In[3] & In[4] & In[6];

assign	SYNTHESIZED_WIRE_16 = In[2] & In[4] & In[10];

assign	SYNTHESIZED_WIRE_17 = In[4] & In[6] & In[12];

assign	SYNTHESIZED_WIRE_18 = In[0] & In[4] & In[10];

assign	SYNTHESIZED_WIRE_19 = In[4] & In[8];

always@(posedge Clock)
begin
	State_ALTERA_SYNTHESIZED[2] <= State_ALTERA_SYNTHESIZED[2] ^ SYNTHESIZED_WIRE_2;
end


always@(posedge Clock)
begin
	State_ALTERA_SYNTHESIZED[1] <= State_ALTERA_SYNTHESIZED[1] ^ SYNTHESIZED_WIRE_1;
end


always@(posedge Clock)
begin
	State_ALTERA_SYNTHESIZED[0] <= State_ALTERA_SYNTHESIZED[0] ^ SYNTHESIZED_WIRE_0;
end

assign	State = State_ALTERA_SYNTHESIZED;

endmodule
