module class4_Q1 #(
	parameter WIDTH = 8,
	parameter ADDR_WIDTH = 8
	);
	(input  logic       clk,
    input  logic       we,        // write enable
    input  logic [ADDR_WIDTH-1:0] addr,      // 256 locations
    input  logic [WIDTH-1:0] wdata,
    output logic [WIDTH-1:0] rdata
	)

	localparam MEM_DEPTH = (2**ADDR_WIDTH);

	logic [WIDTH-1:0] mem [0:MEM_DEPTH-1];

    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= wdata;   // synchronous write
        rdata <= mem[addr];       // synchronous read (returns old data on a same-address write)
    end

endmodule