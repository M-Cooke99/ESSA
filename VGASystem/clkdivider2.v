module clkdivhomemade(
	input wire clk,
	output reg outputclk
	
);

reg [18:0] count;

always @(posedge clk) begin
count = (count + 1)%420000;

	if (count == 1) begin
			outputclk = 1'b0;
		end


	if (count == 419999) begin
			outputclk = 1'b1;
		end
end
endmodule