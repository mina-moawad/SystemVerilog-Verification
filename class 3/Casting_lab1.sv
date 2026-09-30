module Casting_lab1 ();

	bit [7:0] value_8bits = -14;
	bit [15:0] value_16bits;
	bit [15:0] implicit_out; 
	bit [15:0] explicit_out; 

	initial begin
		implicit_out = value_8bits; 
		explicit_out = 16'(value_8bits);

		$display("the main value is %0d and in binary is %0b ", value_8bits, value_8bits);
		$display("the implicit value is %0d and in binary is %0b ", implicit_out, implicit_out);
		$display("the explicit value is %0d and in binary is %0b ", explicit_out, explicit_out);
	end
endmodule : Casting_lab1