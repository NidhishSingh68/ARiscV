module uart_tx32
(
  input clk,
  input [31:0] data_in,
  input rstrb,
  input reset,

  output data_out,
  output tx_done
);

// Uart Driving Signals
wire [7:0] uart_data;
reg uart_rstrb;
wire uart_tx_done;

reg[1:0] curr_frame = 0;
reg [7:0] bytes [0:3];

uart_tx uart(
  .clk(clk),
  .data_in(uart_data),
  .rstrb(uart_rstrb),
  .reset(reset),
  .data_out(data_out),
  .tx_done(uart_tx_done)
);

assign uart_data = bytes[curr_frame];

always @(posedge clk) begin
  uart_rstrb <= 1'b0;
  if (rstrb) begin
    bytes[0] <= data_in[7:0];
    bytes[1] <= data_in[15:8];
    bytes[2] <= data_in[23:16];
    bytes[3] <= data_in[31:24];

    uart_rstrb <= 1'b1;
  end else if (uart_tx_done) begin
    if (curr_frame == 3) begin
      curr_frame <= 0;
    end else begin 
      curr_frame <= curr_frame + 1;
      uart_rstrb <= 1'b1;
    end
  end

end

assign tx_done = uart_tx_done && (curr_frame == 3);

endmodule
