class constraint_11 ;
	rand bit [31:0] address ;

	constraint c_num_ones { 
		$countones(address) == 10;
		
	}

	constraint c_adjacent_bits { 
		foreach(address[j]){
			if (j<0){
				address[j] & address [j-1] == 0;
				}
			}
		
	}
endclass : constraint_11