module readBytes(
    input wire clk,
    input wire [15:0] data,
    
    output reg pixel_on
);

reg [15:0] storedData;     // 16-bit register to hold data
reg [3:0] counter;         // 4-bit counter to count up to 15

always @(posedge clk) begin
    counter <= counter + 1;  // Increment counter
    
    if (counter == 0) begin
        storedData <= data;  // Load new data when counter is 0
    end
    
    pixel_on <= storedData[counter];  // Set pixel_on based on storedData and counter
end

endmodule
