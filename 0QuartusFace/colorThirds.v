module color_Thirds(
    input wire [9:0] x,
    input wire [9:0] y,
    input wire pixel_on,
	 
    output reg red_Out,
    output reg green_Out,
    output reg blue_Out
);

always @(*)
begin
    if (pixel_on == 1) begin
        if (y > 320) begin
            // Make output Red
            red_Out = 1; 
            green_Out = 0; 
            blue_Out = 0; 
        end else if (y > 160) begin
            // Make output Yellow
            red_Out = 1; 
            green_Out = 1; 
            blue_Out = 0; 
        end else begin
            // Make output Green
            red_Out = 0; 
            green_Out = 1; 
            blue_Out = 0;
        end
    end else begin
        // Reset all outputs when pixel_on is 0
        red_Out = 0; 
        green_Out = 0; 
        blue_Out = 0; 
    end
end

endmodule
