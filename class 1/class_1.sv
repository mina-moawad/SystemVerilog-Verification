module class_1 ();

	typedef struct packed {
	logic [7:0] high;
	logic [4:0] low ;
	} s; 

	typedef struct packed {
	logic [5:0] x; 
	} bits_6_element;

	typedef struct {
	event my_event;
	real  my_real; 
	} element_unpacked;



	typedef struct  {
	string str;
	integer i ;
	byte b;
	bits_6_element y; 
	element_unpacked z;
	} top_pack;

	s my_packet;

	initial begin
		s my_packet = 13'b 1111_1010_0011_1;
		top_pack my_design;

		my_design = '{str: "systemverilog", i: 80, b: 6, y: 6'b100_000, z: '{my_event: null, my_real: 1.37}};

		$display("high bytes are %h", my_packet.high);
		$display("low bytes are %h", my_packet.low);

		$display("str is %s", my_design.str);
		$display("i is %d", my_design.i);
		$display("b is %d", my_design.b);
		$display("y is %b", my_design.y);
		$display("my real is %f", my_design.z.my_real);
	end
endmodule : class_1