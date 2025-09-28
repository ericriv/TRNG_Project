//ring oscilator for instantiation in sampler

(* DONT_TOUCH = "yes" *) //so vivado does not optimize
module ro_sim (
input	ctrl,
output	out
);

	reg		out_reg;
	
	initial
		out_reg = 0;
	
	always @(posedge ctrl)
		out_reg <= ~out_reg;
	
	assign out = out_reg;
	
endmodule