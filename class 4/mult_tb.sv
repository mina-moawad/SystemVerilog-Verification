module mult_tb ();
	logic [15:0] a;
	logic [15:0] b; 
	logic [16:0] out;
	logic [16:0] out_expected;

	multiplier2 #(.A_W(16)) m1 (a, b, out); 

	initial begin 
		a = 16'h ABC2;
		b = 16'h DEF1;
		out_expected = a + b;

		if (out_expected!=out)
			$display("Error");

		$display("a = %h, b=%h, out=%h, and out_expected=%h",a, b, out, out_expected);
	end
endmodule : mult_tb