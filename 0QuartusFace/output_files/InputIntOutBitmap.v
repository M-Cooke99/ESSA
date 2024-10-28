module array_shift_128x120_flat(
    input wire clk,                 // System clock
    input wire rst_n,               // Active-low reset
    input wire [6:0] y_in,          // Input integer specifying the y-coordinate (0 to 119)
    input wire shift_enable,        // Shift enable signal
    output reg [127:0] y_out,       // Outputs the values of the x coordinates for the given y
    output reg [15359:0] pixel_data_out // Output the entire flat array
);

    // Declare a 1D flat array of 15,360 bits to simulate 128x120 2D array
    reg [15359:0] pixel_data_flat;

    integer i, k;

    // Compute the flat index for the 128x120 grid
    function [13:0] flat_index;
        input [6:0] x_128;  // Scaled x-coordinate (0 to 127)
        input [6:0] y_120;  // Scaled y-coordinate (0 to 119)
        begin
            flat_index = y_120 * 128 + x_128;  // Calculate the flat index
        end
    endfunction

    // Sequential logic to shift the array and insert the new value
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset each row in the array
            for (i = 0; i < 120; i = i + 1) begin  // Loop over each row
                for (k = 0; k < 128; k = k + 1) begin  // Loop over each column (128 bits per row)
                    pixel_data_flat[flat_index(k, i)] <= 0;
                end
            end
        end
        else if (shift_enable) begin
            // Shift the x coordinates for all rows
            for (i = 0; i < 120; i = i + 1) begin
                // Get the starting index of the row in the flat array
                for (k = 127; k > 0; k = k - 1) begin
                    pixel_data_flat[flat_index(k, i)] <= pixel_data_flat[flat_index(k - 1, i)];
                end

                // Insert '1' at the new first x-coordinate (if row matches y_in)
                if (i == y_in) begin
                    pixel_data_flat[flat_index(0, i)] <= 1;
                end
                else begin
                    pixel_data_flat[flat_index(0, i)] <= 0;  // Set the first x-coordinate to 0 for other rows
                end
            end
        end
    end

    // Output the values of the x-coordinates at the given y-coordinate
    always @(*) begin
        // Use flat_index to access the starting point of the row
        for (k = 0; k < 128; k = k + 1) begin
            y_out[k] = pixel_data_flat[flat_index(k, y_in)];
        end
    end

    // Output the entire flat array
    always @(*) begin
        pixel_data_out = pixel_data_flat;  // Assign the entire array to the output
    end

endmodule
