module pixel_pattern2(
    input wire [9:0] x,
    input wire [9:0] y,
    output reg pixel_on            
    );

    always @(*)
    begin
        // Top-left quadrant (x < 320 and y < 240) or bottom-right quadrant (x >= 320 and y >= 240)
        if (y<240) begin
            pixel_on = 1;  // Turn on the pixel
				
        end else begin
            pixel_on = 0;  // Turn off the pixel
		end
    end

endmodule