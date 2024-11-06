module memChunks(
    input wire clk,
    input wire [479:0] StorageBytes, // 480-bit storage for simplicity
	 
	 output reg [15:0] outputData ,
	 inout reg wr_Enable
);

integer i;
integer j;

//always @(negedge wr_Enable)

always @(posedge clk)
begin
	for (i = 0; i < 480; i = i + 16) begin 
        outputData <= StorageBytes[i +: 16]; // Take a 16-bit chunk from StorageBytes
        wr_Enable <= 1'b1; // Enable write for each chunk
   end
end

endmodule
