module tb_top(
  input wire clk,
  input wire rst,
  output wire [31:0] pc,
  output wire retire,
  output wire test_done,
  output wire [31:0] registers [0:31]
);
  wire rdstrb;
  wire [31:0] instruction;
  wire dv;
  wire [31:0] address;
  wire [3:0] mask;
  wire sext;
  wire [31:0] write_val;
  wire rdwr;
  wire start;
  wire [31:0] read_val;
  wire ram_op_done;

  cpu cpu(
    .clk(clk),
    .rst(rst),
    .pc(pc),
    .rdstrb(rdstrb),
    .instruction(instruction),
    .dv(dv),
    .address(address),
    .mask(mask),
    .sext(sext),
    .write_val(write_val),
    .rdwr(rdwr),
    .start(start),
    .read_val(read_val),
    .ram_op_done(ram_op_done)
  );

  instruction_mem i_mem(
    .clk(clk),
    .address(pc),
    .rdstrb(rdstrb),
    .instruction(instruction),
    .dv(dv)
  );

  ram data_mem(
    .clk(clk),
    .rst(rst),
    .address(address),
    .mask(mask),
    .sext(sext),
    .write_val(write_val),
    .rdwr(rdwr),
    .start(start),
    .read_val(read_val),
    .done(ram_op_done)
  );

  assign retire = cpu.curr_state == 3'd4;
  assign test_done = retire && cpu.localinst == 32'h00000073;
  genvar index;
  generate
    for (index = 0; index < 32; index = index + 1) begin : register_outputs
      if (index == 0) begin
        assign registers[index] = 32'b0;
      end else begin
        assign registers[index] = cpu.register_file.rF[index];
      end
    end
  endgenerate
endmodule
