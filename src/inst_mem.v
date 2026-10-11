// Wire dv is pulsed for a single clock cycle to indicate data valid
module instruction_mem (
  input clk, // clock
  input[31:0] address, // Read Address
  input rdstrb, // Pulsed by user to start read operation
  output [31:0] instruction, // Output data
  output reg dv // data line is valid
);

reg oce,ce,reset,wre;
reg [7:0] din; // Do not support writes to instruction mem therefore, left unconncted
wire [7:0] data;
reg [31:0] internal_addr = 0;

// IP Core generated in bypass mode
`ifndef VERILATOR
 // Gowin_SP_Imem instruction_ram(
     // .dout(data), //output [7:0] dout
     // .clk(clk), //input clk
     // .oce(oce), //input oce
     // .ce(ce), //input ce
     // .reset(reset), //input reset
     // .wre(wre), //input wre
     // .ad(internal_addr[13:0]), //input [13:0] ad
     // .din(din) //input [31:0] din
 // );
 
  reg [7:0] MEM[16384:0] /* synthesis syn_ramstyle="block_ram" */;

  initial begin
    $readmemh("../memory/memory.mi", MEM);
  end

`else 
  reg [7:0] MEM[102399:0]; // 100Kb
  reg [7:0] data_sim;

  always @(*) begin
    if (ce && oce) begin
      data_sim = MEM[internal_addr];
    end else data_sim = 'b0;
  end

assign data = data_sim;

initial begin
  $readmemh("memory.hex", MEM);
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
      instruction_bytes[cnt] <= MEM[internal_addr];
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

always @(*) begin
  dv = 'b0;
  if (curr_state == OUTPUT) begin
    dv <= 1'b1;
  end
end

endmodule
