class transaction;
	rand bit is_write;
	rand bit [7:0] len; 

	constraint c_len { (is_write) -> (len inside {[4:16]});
					   (! is_write) -> (len == 1);
		
	}

endclass : transaction


class transaction_2;
	typedef enum logic [1:0] {READ, WRITE, BURST} e_cmd;

	rand e_cmd cmd; 
	rand bit [7:0] len; 

	constraint c_cmd_len_change { 
	if (cmd == WRITE) 
		{len == 1;}
	else if (cmd == READ)
		{len inside{[1:4]};}
	else if (cmd == BURST) 
		{len inside {[8:32]};
		len % 4 == 0;
	}	
	}
endclass
