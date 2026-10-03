class Packet;
rand bit[31:0] addr;
constraint c_addr { addr inside {[0:100]};}
endclass

module tb ();
	Packet pkt = new();

	initial begin
	pkt.c_addr.constraint_mode(0);

	if (pkt.randomize() with {addr>200;}) begin
		$display("success as addr = %0d", addr);
	end
	else 
		$display("failed as addr = %0d", addr);
end 
endmodule : tb