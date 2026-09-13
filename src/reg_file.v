module regFile(
  input clk,
  input wire[4:0] irs1,
  input wire[4:0] irs2,
  input wire regWrite,
  input wire[31:0] idata,
  input wire [4:0] rd,

  output wire[31:0] ors1,
  output wire[31:0] ors2
);
  
reg[31:0] rF[31:0];

// Writes on positive edge
always @(posedge clk) begin
  if (regWrite == 1'b1) begin
    rF[{{27{1'b0}},rd[4:0]}] <= idata;
  end
end

assign ors1 = (irs1 == 0) ? 0 : rF[irs1];
assign ors2 = (irs2 == 0) ? 0 : rF[irs2];

endmodule;
