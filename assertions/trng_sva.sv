`define state trng_tb.my_trng.state
`define out_full trng_tb.my_trng.out_full
`define counter trng_tb.my_trng.counter
`define clk_gate trng_tb.my_trng.clk_gate


module trng_sva #(
parameter P = 256'hffffffff00000001000000000000000000000000ffffffffffffffffffffffff
)(
input				clk,
input				rst_n,
input				en,
input				rd_en,
input				addr,
output	[31:0]		out,
output				rdy
);

	localparam	[1:0]	IDLE 	= 2'b00;
	localparam	[1:0]	START 	= 2'b01;
	localparam	[1:0]	RUN 	= 2'b10;
	localparam	[1:0]	FINISH 	= 2'b11;

	property check_reset;
		@(posedge clk)
			(!rst_n |-> ##1 (`out_full == 0 && `clk_gate == 0 && `counter == 0 && `state == IDLE && rdy == 1));
	endproperty


endmodule