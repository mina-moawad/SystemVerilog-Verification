class trans();
	rand bit error; 

	constraint c_error_on { error dist {
	0:= 90, 1:= 10
	};
	}
endclass


class summations ();
	rand bit [2:0] a; 
	rand bit [2:0] b;
	rand bit [2:0] c;

	constraint c_values { a inside {[1:40]};
						  b inside {[1:40]};
						  c inside {[1:40]};
	
	}

	constraint c_unique { unique {a,b,c};
		
	}

	constraint c_sum { (a+b+c) < 100;
		
	}