class packet;
	rand bit [31:0] addr; 
	rand bit [31:0] data; 
	rand bit [7:0] len;

	function new (bit [31:0] addr = 0, bit [31:0] data = 0, bit [7:0] len = 0);
		this.addr = addr; 
		this.data = data; 
		this.len = len; 
		endfunction : new

		function void print(string name = "lab_2_question_1");
			$display("addr = %0h, data = %0h, len = %0h", addr, data, len);
		endfunction : print

		function packet copy ();
			copy = new ();
			copy.addr = addr; 
			copy.data = data; 
			copy.len  = len;
		endfunction
	endclass : packet


module tb_top ();

	packet pkt1; 
	packet pkt2;
	packet pkt3;

	initial begin
		pkt1 = new (32'hABCD_5678, 32'h1234_5678, 8'hC);
		pkt2 = pkt1;
		pkt3 = pkt1.copy();


		$display("initial values of the packets are .......",);
		pkt1.print("pkt1");
		pkt2.print("pkt2");
		pkt3.print("pkt3");

		// lets change address 
		pkt1.addr = 32'hFFFF_FFF0;

		$display("packets after changing the address",);
		pkt1.print("pkt1");
		pkt2.print("pkt2");
		pkt3.print("pkt3");
	end
endmodule : tb_top