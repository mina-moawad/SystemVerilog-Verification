class constranints; 
	rand bit x; 
	rand bit [7:0] y;

	constraint c_imply {
		(x==1) -> (y ==0) ;
		
	}

	constraint c_dist_x {
		x dist {1:=50, 0:=50} ;		
	}
endclass : constranints

