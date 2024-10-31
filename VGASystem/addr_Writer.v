module addr_Writer(
    input wire [9:0] x,
 	 input wire [9:0] offset,

    output reg [HADDR_WIDTH-1:0] addr            
    );
	 
    // Parameter declarations within the module
    parameter ROW_WIDTH = 9;
    parameter COL_WIDTH = 9;
    parameter BANK_WIDTH = 2;
    parameter Bank = 1;
	 parameter Collumn = 1;
    parameter HADDR_WIDTH = BANK_WIDTH + ROW_WIDTH + COL_WIDTH;

    always @(*)
    begin
        addr = {Bank, x+offset, Collumn};
    end

endmodule
