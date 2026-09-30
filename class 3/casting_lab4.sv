module casting_lab4 ();
	typedef logic [31:0] unit32;

	typedef struct packed{
		logic [7:0] opcode;
		logic [7:0] source_reg;
		logic [7:0] destination_reg;
		logic [7:0] immediate;
	} instruction_t; 

	int value; 
	logic [31:0] backed_value; 
	instruction_t inst_pack;

	initial begin

		value = 32'hABCD4321; 
		inst_pack = instruction_t '(value);

		$display(" the value is %0h and cast to opcode=%h, source_reg=%h, destination_reg=%h, immediate=%h", value, inst_pack.opcode, inst_pack.source_reg, inst_pack.destination_reg, inst_pack.immediate);
		$display("#########################################################################################################################",);
		
		inst_pack.opcode = 8'h12;
		inst_pack.source_reg = 8'h34;
		inst_pack.destination_reg = 8'hDC;
		inst_pack.immediate = 8'hBA;
		backed_value = unit32 ' (inst_pack);
		$display(" the backed value is %h", backed_value);


		
	end
endmodule : casting_lab4