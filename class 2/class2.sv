module class2 ();
	task sum_avg (input int array[10], output int  sum, output real average);
		
		sum = 0;
		
		foreach (array[j]) begin
			sum += array[j];
		end

		average = (sum/10);
endtask 
//*************************************************************************************//
function automatic int factorial (input int N);
	static int  out = 1;
	for (int i = 1; i <= N; i++) begin
		out = out * i;  
	end
	return out; 
endfunction : factorial
//*************************************************************************************//
function byte reverse (input logic [7:0] data);
	static logic [7:0] reversed_data = 0;
	for (int i = 7; i>=0; i--)begin
		reversed_data [i] = data [7-i];
	end
	return reversed_data;
endfunction
//*************************************************************************************//
function int count (input logic [31:0] in);
	static int ones = 0; 
	for (int i = 0; i<32; i++) begin // built in function $countones
		if (in[i] == 1)
			ones = ones + 1; 
	end
	return ones; 
endfunction
//*************************************************************************************//
function void max_and_min ();

	int arr[20];
	static int max = arr[0]; 
	static int min = arr[0];

	foreach (arr[j]) begin
		arr[j] = $random();
	end

	foreach (arr[j]) begin
		if (arr[j]>max)
			max = arr[j];
		if (arr[j]<min) 
			min = arr[j];
	end
	$display("elements of the array are %p",arr);
endfunction
//*************************************************************************************//
function void random_queue ();
	static int Q[$];
	static int even = 0; 
	static int odd  = 0; 
	static int neg  = 0;

	for (int i=15; i>=0; i--) begin
		Q.push_front($random());
	end

	for (int j=0; j<16; j++) begin
		if (Q[j]<0)
			neg = neg + 1; 
		if (Q[j] % 2 == 0) // check last bit if 1 ==> output is odd, else output is even
			even ++; 
		else 
			odd ++ ;
	end
	$display("the elements of the queue are ",Q);
	$display("the number of even=%0d, odd=%0d, neg=%0d ",even, odd, neg);
endfunction
//*************************************************************************************//
initial begin

	static int array[10] = '{1,2,3,4,5,6,7,8,9,10};
	static int sum; 
	static real average;
	int N = 5; 

	static logic [7:0] data = 8'hA3;

	static logic [31:0] in = 32'hABCD1234;

	sum_avg(array, sum, average);
	$display("the sum = %d, average = %f",sum, average);
	///////////////////////////////////////////////////
	 
	//factorial(N);
	$display("The factorial of 5 is %d ",factorial(N));
	///////////////////////////////////////////////////
	
	//reverse (data);
	$display(" The data is %b, and the reversed data is %b", data, reverse(data));
	///////////////////////////////////////////////////
	
	//count (in);
	$display("the number of ones are %0d \n", count(in));
	///////////////////////////////////////////////////
	max_and_min();
	random_queue();
	///////////////////////////////////////////////////

end
endmodule : class2
