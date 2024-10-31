module Offset(
    input wire vsync,
	 
    input wire [9:0] In_Offset,
    output reg [9:0] Out_Offset
);



always @(posedge vsync) begin
    Out_Offset <= ((In_Offset + 1)%800) ;
end

endmodule
