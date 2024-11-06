module StorageBytes(
    input wire vsync,
    input wire clk,
    input wire [15:0] data,
    
	 output reg [9:0]  Write_row,
    output reg [15:0] outputbytes,
	 output reg finished
);
integer i;

reg [479:0] StorageBytes; // 480-bit storage

always @(posedge vsync)
begin
    finished <= 1'b0; 
    for (i = 0; i < 480; i = i + 1) begin
        StorageBytes[i] <= 1'b0; // Clear all bits in StorageBytes
    end

    StorageBytes[data] <= 1'b1; // Set the specific index to 1
    finished <= 1'b1; 
end

reg [8:0] chunk_index; 

always @(posedge clk)
begin
    if (finished == 1) begin
        if (chunk_index < 480) begin
            outputbytes <= StorageBytes[chunk_index +: 16]; // Take a 16-bit chunk
            chunk_index <= chunk_index + 16; // Move to the next 16-bit chunk
        end else begin
            chunk_index <= 0; // Reset index when all chunks are processed
				finished <= 1'b1;
        end
    end
end

endmodule
