//32 instantiations of the sampler

(* DONT_TOUCH = "yes" *) //so vivado does not optimize
module sampler_16(
input			clk,
output [15:0]	out
);


	sampler samp0(.clk(clk), .out(out[0]));
	sampler samp1(.clk(clk), .out(out[1]));
	sampler samp2(.clk(clk), .out(out[2]));
	sampler samp3(.clk(clk), .out(out[3]));
	sampler samp4(.clk(clk), .out(out[4]));
	sampler samp5(.clk(clk), .out(out[5]));
	sampler samp6(.clk(clk), .out(out[6]));
	sampler samp7(.clk(clk), .out(out[7]));
	sampler samp8(.clk(clk), .out(out[8]));
	sampler samp9(.clk(clk), .out(out[9]));
	sampler samp10(.clk(clk), .out(out[10]));
	sampler samp11(.clk(clk), .out(out[11]));
	sampler samp12(.clk(clk), .out(out[12]));
	sampler samp13(.clk(clk), .out(out[13]));
	sampler samp14(.clk(clk), .out(out[14]));
	sampler samp15(.clk(clk), .out(out[15]));


endmodule