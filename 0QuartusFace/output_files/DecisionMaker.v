module pixel_on_640x480(
    input wire [9:0] x,          // X coordinate for 640x480 screen (0 to 639)
    input wire [9:0] y,          // Y coordinate for 640x480 screen (0 to 479)
    input wire [15359:0] pixel_data_flat,  // Flat array storing the 128x120 grid
    output reg pixel_on          // Output signal indicating whether the pixel should be on or off
);

    // Function to compute the flat index for the 128x120 grid
    function [13:0] flat_index;
        input [6:0] x_128;  // Scaled x-coordinate (0 to 127)
        input [6:0] y_120;  // Scaled y-coordinate (0 to 119)
        begin
            flat_index = y_120 * 128 + x_128;  // Calculate the flat index
        end
    endfunction

    // Always block to determine if the pixel should be on
    always @(*) begin
        // Scale down the x and y coordinates to the 128x120 grid
        reg [6:0] x_128;  // Scaled down x-coordinate (0 to 127)
        reg [6:0] y_120;  // Scaled down y-coordinate (0 to 119)
        x_128 = x / 5;    // Scale down the x-coordinate by dividing by 5
        y_120 = y / 4;    // Scale down the y-coordinate by dividing by 4

        // Determine whether the pixel should be on or off using the scaled coordinates
        pixel_on = pixel_data_flat[flat_index(x_128, y_120)];
    end

endmodule
