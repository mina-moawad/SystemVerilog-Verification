module Producer_consumer ();
	typedef enum logic [1:0] {message, command, control} e_packet_type;

	typedef struct {
	int ID; 
	time sent_time; 
	e_packet_type packet_type;
	logic [31:0] data; 
	} s_packet; 

	mailbox mb = new();

	task automatic producer();
		s_packet pkt; 
		for (int i=0; i<10; i++)begin
			pkt.ID = $urandom_range(0,20);
			pkt.sent_time = $time();
			pkt.packet_type = e_packet_type'($urandom_range(0,2));
			pkt.data = $random();

			mb.put(pkt);
			$display("id=%0d, sent_time=%0t, data = %b", pkt.ID, pkt.sent_time, pkt.data);
		#10;
		end
	endtask

		task automatic consumer();
			s_packet pkt; 
			for (int i=0; i<10; i++) begin
				mb.get(pkt);
				$display("id=%0d, sent_time=%0t, data_type=%s, data=%b",pkt.ID, pkt.sent_time, pkt.packet_type.name(), pkt.data);
			end
			#5; 
	endtask

	initial begin
		fork
			producer();
			consumer();
		join 
		#15;
		$stop;
	end
endmodule : Producer_consumer


