module read_mem(
	input current_vertical[0:9],
	input current_horizontal[0:9],
	input offset[0:9],
	output bit
);

	always @(*)begin
	
		// Get bit from current_horizontal + offset % 800, current_horizontal[0:9]
		assign bit = 0;
		
	end
endmodule