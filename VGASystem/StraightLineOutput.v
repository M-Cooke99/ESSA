module StraightLineOutput (
    input wire clk,
    output reg [15:0] line_output // 10 bits to cover the range 0-680
);

initial begin
    line_output = 10'd0; // Start from 0
end

always @(posedge clk) begin
    if (line_output < 680) begin
        line_output <= line_output + 1; // Increment output by 1 each clock cycle
    end else begin
        line_output <= 10'd0; // Reset to 0 when reaching 680
    end
end

endmodule
