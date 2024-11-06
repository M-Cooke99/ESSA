module StorageModule (
    input wire vsync,
    input wire [15:0] data,
    output reg [479:0] StorageBytes,
    output reg finished
);
integer i;

always @(posedge vsync) begin
    finished <= 1'b0; 

    // Clear all bits in StorageBytes
    for (i = 0; i < 480; i = i + 1) begin
        StorageBytes[i] <= 1'b0;
    end

    // Set specific bit based on data index if within range
    if (data < 480) begin
        StorageBytes[data] <= 1'b1;
    end
    finished <= 1'b1; 
end

endmodule
