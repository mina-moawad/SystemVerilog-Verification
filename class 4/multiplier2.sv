module multiplier2 #(
	parameter int A_W = 8, 
	parameter int B_W = A_W,
	localparam int OUT_W = A_W + B_W)(
	input [A_W-1:0] a,
	input [A_W-1:0] b,
	output [OUT_W-1:0] out);

	assign out = a + b; 
endmodule : multiplier2