module rd_enaber(
    input wire wr_enable,
    input wire clk,
    output reg rd_enable	 
    );

    always @(*)
    begin
        if (wr_enable == 1)
            rd_enable = 0;
        else
            rd_enable = clk;
    end
endmodule
