module top;

  typedef enum {Message, Command, Control} e_type;


  class packet;
    rand int ID;
    time Sent_time;
    rand e_type packet_type;
    rand bit [31:0] data;

    function void display(string name);
      $display("[%0t ns] [%s] ID=%0d | Type=%s | Data=0x%0h | Sent_time=%0t", 
               $time, name, ID, packet_type.name(), data, Sent_time);
    endfunction
  endclass

  mailbox #(packet) mbx = new();

  task automatic producer();
    for (int i = 0; i < 5; i++) begin
      packet pkt = new();
      if (pkt.randomize()) begin
        pkt.Sent_time = $time;
        mbx.put(pkt);
        pkt.display("PRODUCER");
      end
      #10ns;
    end
  endtask

  task automatic consumer();
    for (int i = 0; i < 5; i++) begin
      packet pkt;
      mbx.get(pkt);
      pkt.display("CONSUMER");
      #5ns; 
    end
  endtask

  initial begin
    fork
      producer();
      consumer();
    join
    #20ns;
    $finish;
  end

endmodule