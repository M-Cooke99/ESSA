module write_mem(
	input clk,
	input wire[8:0] value, // This is 9 bits
	output reg[9:0] offset
);
	always @(posedge clk) begin
		offset <= offset + 1;
		// Write bit offset,value[0:9] - 1 if > 0
		// Write bit offset,value[0:9]
		// Write bit offset,value[0:9] + 1
	end

endmodule