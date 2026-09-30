interface arbiter_if (input bit clk);

	bit rst;
	logic [1:0] request; 
	logic [1:0] grant;

	modport dut (output grant, input request, rst, clk);

	modport tb  (output rst, request, input grant, clk);

endinterface : arbiter_if
