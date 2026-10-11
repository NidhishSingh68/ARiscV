module soc
(
  input clk,
  input rst,

  // Uart lines
  input uart_rx,
  output led,
  output uart_tx
);

// LED peripheral
reg led_reg = 1'b0;
reg periph_write_done = 1'b0;
assign led = led_reg;

wire [31:0] pc;

wire rdstrb;
wire [31:0] instruction;
wire dv;

wire [31:0] ram_address;
wire [3:0] mask;
wire sext;

wire [31:0] write_val;
wire rdwr;
wire start;

wire [31:0] read_val;
wire ram_op_done;

cpu cpu (
  .clk(clk),
  .rst(rst),
  
  // Instruction Mem Interface
  .pc(pc),
  .rdstrb(rdstrb),
  .instruction(instruction),
  .dv(dv),

  // Ram Interface
  .address(ram_address),
  .mask(mask),
  .sext(sext),
  .write_val(write_val),
  .rdwr(rdwr),
  .start(start),
  
  .read_val(read_val),
  .ram_op_done(ram_op_done | periph_write_done)
);

instruction_mem imem(
  .clk(clk),
  .address(pc),
  .rdstrb(rdstrb),
  .instruction(instruction),
  .dv(dv)
);

always @(posedge clk) begin
  if (ram_address[17] && rdwr && start) begin
    led_reg <= write_val[0];
    periph_write_done <= 1'b1;
  end else periph_write_done <= 1'b0;
end

ram ram(
  .clk(clk),
  .rst(rst),
  .address(ram_address),

  .mask(mask),
  .sext(sext),
  .write_val(write_val),
  .rdwr(rdwr),
  .start(start && !ram_address[17]),

  .read_val(read_val),
  .done(ram_op_done)
);

endmodule
