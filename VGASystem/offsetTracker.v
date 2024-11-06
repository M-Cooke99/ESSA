module offsetTracker(
    input wire vsync,
    output reg [9:0] offset
);



//always @(negedge wr_Enable)

always @(posedge vsync)
begin
	offset = (offset + 1)%800;
end

endmodule
