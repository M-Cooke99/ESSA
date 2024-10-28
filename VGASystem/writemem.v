module write_mem(
	input clk,
	input value[0:9],
	output offset
);

	always @(*)begin
	reg offset
	
	if (clk) begin
		offset++
		// Write bit offset,value[0:9] - 1 if > 0
		// Write bit offset,value[0:9]
		// Write bit offset,value[0:9] + 1
	end
	
	end
endmodule