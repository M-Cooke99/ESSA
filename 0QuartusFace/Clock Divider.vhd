module clock_divider(
    input wire clk_in,      // 50 MHz input clock
    input wire rst,         // Asynchronous reset
    output reg clk_out      // 25 MHz output clock
    );

// Register to toggle the clock
reg toggle;

// Clock divider by 2
always @(posedge clk_in or posedge rst)
begin
    if (rst)
    begin
        clk_out <= 0;
        toggle <= 0;
    end
    else
    begin
        toggle <= ~toggle;  // Toggle every clock cycle
        clk_out <= toggle;  // clk_out toggles at half the frequency of clk_in
    end
end

endmodule
