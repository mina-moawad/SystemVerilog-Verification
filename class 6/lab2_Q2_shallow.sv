class header; 
	int id; 
endclass : header


class packet; 
	int data; 
	header h; 

	function new ();
		h = new();
		data = 32'h1234_1234;
	endfunction : new

module tb_shallow ();

	packet pkt1; 
	packet pkt2;

	initial begin
		pkt1 = new();
		pkt1.data = 5;
		pkt2 = new pkt1;
		pkt2.data = 9;
		pkt2.h.id = 8; 

	end

endmodule : tb_shallow