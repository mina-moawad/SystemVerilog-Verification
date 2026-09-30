module casting_lab6 ();

	int array[] = '{20, 200, 2000, 20000};
	byte unsigned value; 
	int cast_return; 

	initial begin
		foreach (array[j]) begin
			cast_return = $cast (value, array[j]);
			if (cast_return)
				$display("success as value is %0d and array element is %p", value, array[j]);
			else 
				$display("failed as value is %0d and array element is %p", value, array[j]);
		end
	end

endmodule : casting_lab6