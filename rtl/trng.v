//256-bit true random number generator 
//mod p
//accessed in 32-bit words

module trng #(
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

	reg	[255:0]	out_full;
	reg	[15:0]	samp_out;
	reg [3:0]	counter;
	reg	[1:0]	state;
	reg			clk_gate;
	reg			rdy_reg;
	reg	[31:0]	out_reg;
	
	reg [31:0]	MEMORY [0:7];
	
	
	sampler_16 my_sampler(.clk(clk & clk_gate), .out(samp_out));
	
	
	always @(posedge clk or negedge rst_n) begin
	
		if(!rst_n) begin
			out_full <= 256'b0;
			rdy_reg <= 1;
			counter <= 0;
			clk_gate <= 0;
			state <= IDLE;
		end
		
		else begin
			case(state)
				IDLE: begin
					if(en) begin
						rdy_reg <= 0;
						clk_gate <= 1;
						state <= START;
					end
				end
				
				START: begin	//throw away the first 4 values
					if(counter == 3) begin
						counter <= 0;
						state <= RUN;
					end
					
					else
						counter <= counter + 1;
				end
				
				RUN: begin
					if(counter == 15) begin
						counter <= 0;
						state <= FINISH;
					end
					
					else begin
						out_full <= {out_full[239:0], samp_out};
						counter <= counter + 1;
					end
				end
				
				FINISH: begin
					{MEMORY[7], MEMORY[6], MEMORY[5], MEMORY[4], MEMORY[3], MEMORY[2], MEMORY[1], MEMORY[0]} = out_full;
					rdy_reg <= 1;
					clk_gate <= 0;
					state <= IDLE;
				end
				
				default: ;
			
			
			endcase
		end
	end 
	
	
	always @(posedge clk) begin
		if(rd_en && rdy)
			out_reg <= MEMORY[addr];
	end

	assign rdy = rdy_reg;
	assign out = out_reg;

endmodule 