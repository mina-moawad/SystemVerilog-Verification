module class1_Q2 ();

	bit [32:0] packed_array; 

	initial begin
		packed_array = 40;

		$display("the whole array is %d", packed_array);
		$display("value for 3 to 0 is %b", packed_array[3:0]);
		$display("value of bit [9] is %b",packed_array[9]);
	end
endmodule : class1_Q2