module bitshift(
input wire [9:0] in ,
output reg [9:0] out  
);


always @(*) begin
	out = in >> 4;
end
endmodule