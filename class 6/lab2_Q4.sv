class Singleton; 
	
	local static Singleton inst; 

	local function new ();
	$display("ay 7aga");
endfunction : new

static function Singleton get ();
	if (inst == null)
		inst = new ();

	return inst; 
endfunction

endclass 

module tb_Singleton  ();

	Singleton x, y; 

	initial begin
		//x = new();
		x = Singleton::get();


		y = Singleton::get();

		if (x==y)
			$display("success");
		else 
			$display("failed");
	end
endmodule : tb_Singleton