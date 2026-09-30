module simple_mem (
    input  logic       clk,
    input  logic       we,        // write enable
    input  logic [7:0] addr,      // 256 locations
    input  logic [7:0] wdata,
    output logic [7:0] rdata
);

    // 256 x 8-bit storage array
    logic [7:0] mem [0:255];

    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= wdata;   // synchronous write
        rdata <= mem[addr];       // synchronous read (returns old data on a same-address write)
    end

endmodule