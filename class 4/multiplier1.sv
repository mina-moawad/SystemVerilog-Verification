module multiplier1 #(
	parameter int A_W = 8, 
	parameter int B_W = 8,
	localparam int OUT_W = A_W + B_W)(
	input [A_W-1:0] a, b,
	output [A_W:0] out);

	assign out = a + b; 
endmodule : multiplier1