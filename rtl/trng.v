//256-bit true random number generator 
//mod p
//accessed in 32-bit words

module trng #(
parameter P = 0xffffffff00000001000000000000000000000000ffffffffffffffffffffffff
)(
input				clk,
input				rst_n,
input				en,
input				addr,
output	[31:0]		out,
output				rdy
);

	reg	[255:0]	out_full;
	reg	[15:0]	samp_out;
	
	reg [31:0] MEMORY [0:7];
	
	
	always @(posedge clk) begin
	
		
	
	end 



endmodule 