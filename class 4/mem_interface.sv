module mem_interface #(
	parameter WIDTH = 8,
	parameter ADDRESS = 8,
	parameter type T = logic [7:0]
	//type T = logic [7:0]
	)(

	input T address,
	input [WIDTH-1:0] data_in, 
	input write_en, 
	output T data_out);

endmodule : mem_interface