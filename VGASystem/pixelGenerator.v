module addr_Writer(
    input wire [15:0] data,
    input wire [9:0] offset,
    output reg pixelOn
);

    reg [9:0] x, y;   // Define x and y as registers


    always @(*) begin
        // Loop through x and y values
        for (x = 0; x < 800; x = x + 1) begin
            for (y = 0; y < 525; y = y + 1) begin


                // Set pixelOn based on the blank condition
                if () begin
                    pixelOn = 1; // Example action when blank is true
                end else begin
                    pixelOn = 0; // Example action when blank is false
                end
            end
        end
    end

endmodule
