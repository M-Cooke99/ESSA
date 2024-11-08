module inLineRegister(
	input wire enable,
	input wire[0:15] data,
	output reg[0:15] out
);
	always @(posedge enable)begin
        out = data;
	end
endmodule