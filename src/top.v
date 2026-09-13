module top
#(parameter CLK_FREQ=50000000) // 50 MHZ
(
  input clk,
  input rst,

  // Uart lines
  input uart_rx,
  output uart_tx
);

// Uart Signals
reg[31:0] uart_data_in;

reg uart_rstrb;
wire uart_tx_done;

reg [31:0] mem_read_data;
uart_tx32 tx(
  .clk(clk),
  .data_in(uart_data_in),
  .rstrb(uart_rstrb),
  .reset(rst),
  .data_out(uart_tx),
  .tx_done(uart_tx_done)
);

// Memory Signals
reg[13:0] mem_address = 0;
reg mem_rstrb = 1'b0;
wire dv;
wire [31:0] mem_out;

instruction_mem ram(
  .clk(clk),
  .address(mem_address),
  .rdstrb(mem_rstrb),
  .instruction(mem_out),
  .dv(dv)
);

localparam READ = 0;
localparam TRANSMIT = 1;

reg curr_state = READ;
reg is_reading = 0;
reg is_transmitting = 0;

always @(posedge clk or negedge rst) begin

  if (!rst) begin
    curr_state <= READ;
    is_reading <= 1'b0;
    mem_rstrb <= 1'b0;
    is_transmitting <= 1'b0;
    uart_rstrb <= 1'b0;
    mem_address <= 'b0;
  end else begin
    case (curr_state)

      // Read from memory
      READ: begin
        if ( !is_reading ) begin
          is_reading <= 1'b1;
          mem_rstrb <= 1'b1;
        end else mem_rstrb <= 1'b0;
        if (dv) begin
          curr_state <= TRANSMIT;
          mem_read_data <= mem_out;
          mem_address <= mem_address; // + 3'd4;
          is_reading <= 0;
        end 
      end

      // Transmit over uart
      TRANSMIT: begin

        // Begin Transmission
        if ( !is_transmitting ) begin
          uart_rstrb <= 1'b1; 
          is_transmitting <= 1'b1;
          uart_data_in <= mem_read_data; 
        end else begin
          uart_rstrb <= 1'b0;
        end
        
        // Wait for Transmission to complete
        if ( is_transmitting && uart_tx_done ) begin
            curr_state <= READ;
            is_transmitting <= 1'b0;
        end else begin
          curr_state <= TRANSMIT;
        end
        
      end
    endcase
  end
end

endmodule
