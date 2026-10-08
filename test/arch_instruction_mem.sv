module instruction_mem (
  input clk,
  input [31:0] address,
  input rdstrb,
  output reg [31:0] instruction,
  output reg dv
);
  reg [7:0] memory [0:1048575];
  reg pending = 1'b0;

  initial begin
    dv = 1'b0;
    instruction = 32'b0;
    $readmemh("memory.hex", memory);
  end

  always @(posedge clk) begin
    if (pending) begin
      pending <= 1'b0;
      dv <= 1'b0;
    end else if (rdstrb) begin
      instruction <= {memory[address + 3], memory[address + 2],
                      memory[address + 1], memory[address]};
      pending <= 1'b1;
      dv <= 1'b1;
    end else begin
      dv <= 1'b0;
    end
  end
endmodule
