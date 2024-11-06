module OutputModule (
    input wire clk,
    input wire [479:0] StorageBytes,
    input wire finished,
	 
	 output reg [9:0] rowOut,
    output reg [15:0] outputbytes
);

reg [8:0] chunk_index;

always @(posedge clk) begin
    if (finished) begin
        if (chunk_index < 480) begin
            outputbytes <= StorageBytes[chunk_index +: 16]; // Take a 16-bit chunk
            chunk_index <= chunk_index + 16; // Move to the next 16-bit chunk
				rowOut = chunk_index << 4;
        end else begin
            chunk_index <= 0; // Reset index after processing all chunks
        end
    end
end

endmodule
