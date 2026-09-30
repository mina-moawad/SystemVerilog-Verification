module Casting_lab3 ();

	typedef enum logic [1:0] {idle, start, send} state_t;
	state_t my_state; 
	int value = 2; 
	int back_value; 

	initial begin
		my_state = state_t'(value);
		$display(" the value is %d and cast to enum %s ", value, my_state);
		$display("######################################################",);



		back_value = int'(my_state);
		$display(" my_state value is %s and cast to integer which is %d ", my_state, back_value);
		$display("######################################################",);


		value = 3; 
		my_state = state_t'(value);
		$display(" the value is %d and cast to enum %S ", value, my_state.name());

	end
endmodule : Casting_lab3