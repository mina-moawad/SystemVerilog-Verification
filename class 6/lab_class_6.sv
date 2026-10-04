class packet ;
	rand bit [31:0] data; 
	rand bit [7:0] address;
endclass 

virtual class comm_component ; // base class
	rand bit [31:0] data; 
	rand bit [7:0] address; 

	mailbox #(packet) mbx; 
	function new (mailbox #(packet) mbx);
		this.mbx = mbx; 
	endfunction : new

	pure virtual function void initialize ();
	pure virtual function void Display ();
	pure virtual task Run (); // 5ly balk hnaaa
endclass : comm_component



class transmitter extends comm_component; 
	function new (mailbox #(packet) mbx);
		super.new(mbx);
	endfunction

	function void initialize ();
		this.data = 0;
		this.address = 0;
	endfunction

	function void Display();
		$display("Address = %0h, data = %0h ",address, data);
	endfunction : Display

	task Run ();
		packet pkt; 
		repeat(3) begin
			pkt = new ();
		if (pkt.randomize()) begin
			this.data = pkt.data; 
			this.address = pkt.address;
			Display();
			mbx.put(pkt);
			//// DATA is in mailbox
		end
		end
		
	endtask : Run
endclass : transmitter

class receiver extends comm_component; 
	function new (mailbox #(packet) mbx);
		super.new(mbx);
	endfunction

	function void initialize ();
		this.data = 0;
		this.address = 0;
	endfunction

	function void Display();
		$display("Address = %0h, data = %0h ",address, data);
	endfunction : Display

	task Run ();
		packet pkt; 
		repeat (3) begin 
		pkt = new ();
		
		mbx.get(pkt);
		this.data = pkt.data; 
		this.address = pkt.address;
		Display();
	end 
	endtask : Run
endclass : receiver

module tb ();
	transmitter tx; 
	receiver rx; 
	mailbox #(packet) mbx; 

	initial begin
		mbx = new ();
		tx = new(mbx);
		rx = new(mbx);


		tx.initialize();
		rx.initialize(); 

		fork
			tx.Run(); 
			rx.Run();
		join

		$finish;
	end

endmodule : tb
