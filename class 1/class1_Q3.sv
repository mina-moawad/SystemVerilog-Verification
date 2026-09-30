module class1_Q3 ();

	typedef struct {
	string s; 
	event my_event; 
	real my_real; 
	logic [2:0] pack_array;
	} Elements;

	initial begin
		Elements my_struct [string];
		Elements my_wild [*]; 
//********************************************************************************//
		my_struct["hi"] '{
		s: "say hi", my_event: null, my_real: 1.323, pack_array: 3'b100
		};

		my_struct["hey"] '{
		s: "say hey", my_event: null, my_real: 1.323, pack_array: 3'b100
		};
		
		my_struct["hello"] '{
		s: "say hello", my_event: null, my_real: 1.323, pack_array: 3'b100
		};

		foreach (my_struct[j]) begin
			$display("my_struct[%s] ==> str = %s, my_real = %f, pack_array = %b", j, my_struct[j].s, my_struct[j].my_real, my_struct[j].pack_array);
		end
//***********************************************************************************************************************************//
		my_struct[1] '{
		s: "say hi", my_event: null, my_real: 1.323, pack_array: 3'b100
		};

		my_struct[2] '{
		s: "say hey", my_event: null, my_real: 1.323, pack_array: 3'b100
		};
		
		my_struct[3] '{
		s: "say hello", my_event: null, my_real: 1.323, pack_array: 3'b100
		};

		foreach (my_struct[j]) begin
			$display("my_struct[%s] ==> str = %s, my_real = %f, pack_array = %b", j, my_struct[j].s, my_struct[j].my_real, my_struct[j].pack_array);
		end
//***********************************************************************************************************************************//
		
	end
endmodule : class1_Q3