module tb_reg_n ();
	logic clk; 
	logic reset; 
	logic enable; 
	logic [3:0] d_4, q_4; 
	logic [7:0] d_8, q_8;
	logic [15:0] d_16, q_16;
	logic [15:0] d, q;

	// reg_n #(4) m1 (clk, reset, enable, d_4, q_4);
	// reg_n #(8) m2 (clk, reset, enable, d_8, q_8);
	// reg_n #(.WIDTH(16)) m3 (clk, reset, enable, d_16, q_16);

	reg_n m4 (clk, reset, enable, d, q);
	defparam m4.WIDTH = 16; 
endmodule : tb_reg_n