module vga_driver(
    input wire clk,         // 25 MHz clock input
    input wire rst,         // Asynchronous reset input
    input wire pixel_on,    // Signal to turn pixel on (1) or off (0)
    output wire hsync,      // Horizontal sync signal
    output wire vsync,      // Vertical sync signal
    output wire video_on,   // Video enable signal (active when in display region)
    output wire pixel_out,  // Output signal to control the pixel (on/off)
    output wire [9:0] x,    // Current pixel X coordinate
    output wire [9:0] y     // Current pixel Y coordinate
    );

// VGA 640x480 @ 60Hz Timing Constants
localparam H_DISPLAY       = 640;  // Horizontal display area
localparam H_FRONT_PORCH   = 16;   // Horizontal front porch
localparam H_SYNC_PULSE    = 96;   // Horizontal sync pulse
localparam H_BACK_PORCH    = 48;   // Horizontal back porch
localparam H_TOTAL         = 800;  // Total horizontal time

localparam V_DISPLAY       = 480;  // Vertical display area
localparam V_FRONT_PORCH   = 10;   // Vertical front porch
localparam V_SYNC_PULSE    = 2;    // Vertical sync pulse
localparam V_BACK_PORCH    = 33;   // Vertical back porch
localparam V_TOTAL         = 525;  // Total vertical time

// Horizontal Counter (X)
reg [9:0] h_count;
always @(posedge clk or posedge rst)
begin
    if (rst)
        h_count <= 0;
    else if (h_count == H_TOTAL - 1)
        h_count <= 0;
    else
        h_count <= h_count + 1;
end

// Vertical Counter (Y)
reg [9:0] v_count;
always @(posedge clk or posedge rst)
begin
    if (rst)
        v_count <= 0;
    else if (h_count == H_TOTAL - 1)
    begin
        if (v_count == V_TOTAL - 1)
            v_count <= 0;
        else
            v_count <= v_count + 1;
    end
end

// Horizontal Sync Signal
assign hsync = (h_count >= (H_DISPLAY + H_FRONT_PORCH)) && 
               (h_count < (H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE));

// Vertical Sync Signal
assign vsync = (v_count >= (V_DISPLAY + V_FRONT_PORCH)) && 
               (v_count < (V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE));

// Video On Signal (active during the display region)
assign video_on = (h_count < H_DISPLAY) && (v_count < V_DISPLAY);

// Output current pixel position
assign x = (h_count < H_DISPLAY) ? h_count : 10'b0;
assign y = (v_count < V_DISPLAY) ? v_count : 10'b0;

// Pixel Output Control
// Only enable pixel output if within the display region (video_on is high)
// and if the `pixel_on` signal is active (1).
assign pixel_out = video_on && pixel_on;

endmodule
