module AddrWriter(
    input [9:0] rowIn,       
    input [9:0] CollumnIn,   
    input [9:0] offset,      
    
    output reg [24-1:0] addr  // Calculated address output
);

parameter ROW_WIDTH = 13;
parameter COL_WIDTH = 9;
parameter BANK_WIDTH = 2;

parameter HADDR_WIDTH = BANK_WIDTH + ROW_WIDTH + COL_WIDTH;

always @(*)
begin
    addr = {2'b01, rowIn + offset, CollumnIn}; // Concatenating bank (2'b01), row + offset, and column
end

endmodule
