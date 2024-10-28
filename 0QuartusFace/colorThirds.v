module color_Thirds(
    input wire [9:0] x,
    input wire [9:0] y,
    input wire pixel_on,
	 
    output reg red_Out,
	 output reg green_Out,
	 output reg blue_Out
    );


		
    always @(*)
    begin
	 // [R,G,B]
	 // Red    [255,51,51] 
	 // Yellow [255,255,51]
	 // Green  [51,255,51]

	if (pixel_on == 1) begin
	
		  if(y > 320)begin
				// make output Red
				red_Out = 1; 
				green_Out = 0; 
				blue_Out = 0; 
		  end else if (y > 160) begin
				// make output Yellow
				red_Out = 1; green_Out = 1; blue_Out = 0; 
		   end else begin
				// make output Green
				red_Out = 0; green_Out = 1; blue_Out = 0;
			end
		    
   end else red_Out = 0; green_Out = 0; blue_Out = 0; 
end
endmodule