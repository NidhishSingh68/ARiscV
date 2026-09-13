// Wire dv is pulsed for a single clock cycle to indicate data valid
module instruction_mem (
  input clk, // clock
  input[13:0] address, // Read Address
  input rdstrb, // Pulsed by user to start read operation
  output [31:0] instruction, // Output data
  output reg dv // data line is valid
);

reg oce,ce,reset,wre;
reg [7:0] din;
wire [7:0] data;
reg [13:0] internal_addr = 0;

`ifndef VERILATOR
Gowin_SP instruction_ram(
    .dout(data), //output [7:0] dout
    .clk(clk), //input clk
    .oce(oce), //input oce
    .ce(ce), //input ce
    .reset(reset), //input reset
    .wre(wre), //input wre
    .ad(internal_addr), //input [13:0] ad
    .din(din) //input [31:0] din
);
`else 
  reg [7:0] MEM[16384];
  reg [7:0] local_read;
  assign data = local_read;

  always @(posedge clk) begin
    if (ce & oce) local_read <= MEM[internal_addr];
  end
`endif

// TODO: Remove the start state, we never enter it
localparam IDLE = 0;
localparam START = 1;
localparam WAIT = 2;
localparam OUTPUT = 3;

reg[1:0] curr_state = IDLE;
reg [1:0] cnt = 0;
reg [7:0] instruction_bytes [3:0];

assign instruction = {instruction_bytes[3],instruction_bytes[2],instruction_bytes[1],instruction_bytes[0]};
always @(posedge clk) begin
  case (curr_state)
    IDLE: begin
      if (rdstrb) begin
        curr_state <= WAIT;
        internal_addr <= address;
      end else curr_state <= IDLE;
    end
    START: begin
      curr_state <= WAIT;
    end
    WAIT: begin
      instruction_bytes[cnt] <= data;
      if (cnt == 3) begin
        curr_state <= OUTPUT;
        cnt <= 2'b0;
      end else begin
        curr_state <= WAIT;
        internal_addr <= internal_addr + 1'b1;
        cnt <= cnt + 1'b1;
      end
    end
    OUTPUT: begin
        curr_state <= IDLE;
    end
  endcase
end

// Generate output and dram signals 
always @(*) begin
  reset = 'b0;
  wre = 'b0;
  oce = 'b0;
  ce = 'b0;
  dv = 'b0;
  case (curr_state)
    IDLE: begin
      oce = 'b0;
      ce = 'b0;
    end
    START: begin
      oce = 'b1;
      ce = 'b1;
    end
    WAIT: begin
      oce = 'b1;
      ce = 'b1;
      dv = 'b0;
    end
    OUTPUT: begin
      oce = 'b0;
      ce = 'b0;
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
