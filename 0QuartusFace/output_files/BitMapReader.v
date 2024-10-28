module BitmapValue (
    
    input [9:0] x,                          // 10-bit x coordinate (can go up to 1023, but we'll limit it to 640)
    input [8:0] y,                          // 9-bit y coordinate (can go up to 511, but we'll limit it to 480)
	 
	 input [0:326399] bitmap_array, // Flat array, assuming 8-bit values per pixel
    output reg pixel_on            // Output pixel value
);

always @(*) begin
    // Check bounds to avoid accessing invalid memory
    if (x < 640 && y < 480)
        pixel_on = bitmap_array[y * 640 + x]; // Calculate the linear index
    else
        pixel_on = 0; // Return 0 if coordinates are out of bounds
end

endmodule 
