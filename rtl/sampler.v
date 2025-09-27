//single bit sampler with 14 rings

(* DONT_TOUCH = "yes" *) //so vivado does not optimize
module sampler(
input	clk,
output	out
);

	wire s1, s2, s3, s4, s5, s6, s7, s8, s9;
	wire s10, s11, s12, s13, s14;

	ro ro1(.ctrl(clk), .out(s1);
	ro ro2(.ctrl(~clk), .out(s2);
	ro ro3(.ctrl(clk), .out(s3);
	ro ro4(.ctrl(~clk), .out(s4);
	ro ro5(.ctrl(clk), .out(s5);
	ro ro6(.ctrl(~clk), .out(s6);
	ro ro7(.ctrl(clk), .out(s7);
	ro ro8(.ctrl(~clk), .out(s8);
	ro ro9(.ctrl(clk), .out(s9);
	ro ro10(.ctrl(~clk), .out(s10);
	ro ro11(.ctrl(clk), .out(s11);
	ro ro12(.ctrl(~clk), .out(s12);
	ro ro13(.ctrl(clk), .out(s13);
	ro ro14(.ctrl(~clk), .out(s14);
	
	assign out = s1 ^ s2 ^ s3 ^ s4 ^ s5 ^ s6 ^ s7 ^ s8 ^ s9 ^ s10 ^ s11 ^ s12 ^ s13 ^ s14;

endmodule