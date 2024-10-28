module pixel_pattern(
    input wire [9:0] x,            // Current pixel X coordinate (0 to 639)
    input wire [9:0] y,            // Current pixel Y coordinate (0 to 479)
    output reg pixel_on            // Output: pixel on (1) or off (0)
    );

    always @(*)
    begin
        // Top-left quadrant (x < 320 and y < 240) or bottom-right quadrant (x >= 320 and y >= 240)
        if ((x < 320 && y < 240) || (x >= 320 && y >= 240))
            pixel_on = 1;  // Turn on the pixel
        else
            pixel_on = 0;  // Turn off the pixel
    end

endmodule