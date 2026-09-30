module top #(
	parameter P1 = 10,
	parameter P2 = 20)(
	);

	genvar i;
	generate
		if (p1 == 10) begin
			for (i = 0; i<3; i++)
				bot bot_inst ();
		end
		else if (p1 == 20) begin
			case (P2)
				10: bot_a bota_inst ();
				20: bot_b bota_inst ();
			endcase // P2
		end
	endgenerate
endmodule : top