// Wire dv is pulsed for a single clock cycle to indicate data valid
module memory (
  input clk, // clock
  input[11:0] address, // Read Address
  input rdstrb, // Pulsed by user to start read operation
  output [31:0] data, // Output data
  output reg dv // data line is valid
);

reg oce,ce,reset,wre;
reg [31:0] din;

Gowin_SP instruction_ram(
    .dout(data), //output [31:0] dout
    .clk(clk), //input clk
    .oce(oce), //input oce
    .ce(ce), //input ce
    .reset(reset), //input reset
    .wre(wre), //input wre
    .ad(local_add), //input [11:0] ad
    .din(din) //input [31:0] din
);

localparam IDLE = 0;
localparam READ_WAIT = 1;
localparam OUTPUT = 2;

reg[1:0] curr_state = IDLE;
reg[1:0] next_state = IDLE;
reg [11:0] local_add; // Cache the address

reg cycle_count = 0;

always @(posedge clk) begin
  case (curr_state)

    IDLE: begin
      if (rdstrb) begin
        local_add <= address;
        curr_state <= READ_WAIT;
      end else curr_state <= IDLE;
    end
    READ_WAIT: begin
      if (cycle_count) begin 
        curr_state <= OUTPUT;
      end else curr_state <= READ_WAIT;
      cycle_count <= !cycle_count;
    end
    OUTPUT: begin
      if (rdstrb) begin
        local_add <= address;
        curr_state <= READ_WAIT;
      end else begin 
        curr_state <= IDLE;
      end
    end
  endcase
end

// Generate output and dram signals 
always @(*) begin
  reset = 'b0;
  wre = 'b0;
  case (curr_state)
    IDLE: begin
      oce = 'b0;
      ce = 'b0;
      dv = 'b0;
    end
    READ_WAIT: begin
      oce = 'b1;
      ce = 'b1;
      dv = 'b0;
    end
    OUTPUT: begin
      oce = 'b1;
      ce = 'b1;
      dv = 'b1;
    end
    default: begin
      oce = 'b0;
      ce = 'b0;
      dv = 'b0;
    end
  endcase
end

endmodule
