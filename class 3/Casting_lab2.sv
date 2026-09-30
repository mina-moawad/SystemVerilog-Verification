module Casting_lab2 ();

	typedef bit [7:0] unit8;
	typedef bit [63:0] unit64;
	
	bit [31:0] value = 32'hABCD4321; 
	bit [7:0] value_8bits;
	bit [63:0] value_64bits;

	initial begin 
		$display("the main value is %0h and in binary is %0b ", value, value);
		$display("###########################################################",);

		value_8bits = unit8 '(value); // bit 16'(value)
		$display("the 8 bits value is %0h and in binary is %0b ", value_8bits, value_8bits);
		$display("###########################################################",);
		
		value_64bits = unit64 '(value);
		$display("the 64 bits value is %h and in binary is %0b ", value_64bits, value_64bits);	
		$display("###########################################################",);

	end 
endmodule : Casting_lab2
