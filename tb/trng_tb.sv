

module trng_tb;

	localparam P = 256'hffffffff00000001000000000000000000000000ffffffffffffffffffffffff;

	logic				clk;
	logic				rst_n;
	logic				en;
	logic				rd_en;
	logic				addr;
	
	wire	[31:0]		out;
	wire				rdy;
	
	trng #(P) my_trng(.clk, .rst_n, .en, .rd_en, .addr, .out, .rdy);
	
	bind trng trng_sva #(P) my_trng_bind(.clk, .rst_n, .en, .rd_en, .addr, .out, .rdy);
	
	
	initial begin
	clk = 0;
	addr = 0;
	rst_n = 1;
	en = 0;
	rd_en = 0;
		
	#20
	$stop;
	end 

	always
	#5 clk = ~clk;
	
endmodule