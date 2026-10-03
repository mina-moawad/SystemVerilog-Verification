class dynamic_1 ;
	rand bit [7:0] array [];
	constraint c_arr { array.size() inside {[5:10]};	
	unique {array};}

	

endclass : dynamic_1

class dynamic_2 ; 
	rand bit [3:0] arr [8];

	constraint c_fixed_array { 
	arr[0] == 0;
	foreach(arr[j]) {
		if (j>0){
			arr[j] != arr[j-1];
		}
	}
		
	}

endclass : dynamic_2
