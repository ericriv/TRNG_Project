//ring oscilator for instantiation in sampler

(* DONT_TOUCH = "yes" *) //so vivado does not optimize
module ro (
input	ctrl
output	out
);


	wire n1, n2, n3, n4, n5, n6, n7, n8;
	wire n9, n10, n11, n12, n13, n14;
	
	
	
	initial begin  //initial statement for testbench simulation
	n1 = 1;
	end
	
	assign n1 = (ctrl) ? ~n14 : n14; //ctrl high adds a 14th inverter
	assign n2 = ~n1;
	assign n3 = ~n2;
	assign n4 = ~n3;
	assign n5 = ~n4;
	assign n6 = ~n5;
	assign n7 = ~n6;
	assign n8 = ~n7;
	assign n9 = ~n8;
	assign n10 = ~n9;
	assign n11 = ~n10;
	assign n12 = ~n11;
	assign n13 = ~n12;
	assign n14 = ~n13;
	
	assign out = n14;
endmodule