program test (arbiter_if.tb arb_if);

	initial begin
		arb_if.rst = 1;
		arb_if.request = 0;
		repeat(2)@(posedge arb_if.clk); // wait for 2 cycles

		arb_if.rst = 0;
		@(posedge arb_if.clk);

		arb_if.request = 2'b01; 
		@(posedge arb_if.clk);
		if (grant == 1)
			$display("first case pass request = %0b ,and grant is %0b", arb_if.request, arb_if.grant);
			else 
			$display("Error in the first case"); 
	end
endmodule