module InputCycle(
	 input wire vsync,
	 input wire [15:0] inputNum,
    
	 output reg [15:0] data
    );

    always @(posedge vsync)
    begin
			data <= inputNum;
    end

endmodule