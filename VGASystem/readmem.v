module read_mem(
	input clk,
	input wire[0:9] current_vertical,
	input wire[0:9] current_horizontal,
	input wire[0:9] offset,
	output reg out
);

	always @(posedge clk)begin
	
		out <= current_vertical[0] && current_horizontal[0];
		// Get bit from current_horizontal + offset % 800, current_horizontal[0:9]
		
	end
endmodule