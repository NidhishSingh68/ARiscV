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
reg[31:0] mem_address = 0;
reg mem_rstrb = 1'b0;
wire dv;
wire [31:0] mem_out;
reg [3:0] mask;
reg sext;
reg [31:0] write_val;
reg rdwr; 
reg start;
wire [31:0] read_val;
wire done;

ram mem_ram(
  .clk(clk),
  .rst(rst),
  .address(mem_address),
  .mask(mask),
  
  .sext(sext),
  .write_val(write_val),
  .rdwr(rdwr),
  .start(start),

  .read_val(read_val),
  .done(done)
);

localparam WRITE = 0;
localparam READ = 1;
localparam TRANSMIT = 2;

reg [1:0] curr_state = WRITE;
reg is_reading = 0;
reg is_writing = 0;
reg is_transmitting = 0;

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    curr_state <= WRITE;
    is_reading <= 1'b0;
    mem_rstrb <= 1'b0;
    is_transmitting <= 1'b0;
    uart_rstrb <= 1'b0;
    mem_address <= 'b0;
    mask <= 4'b0;
    sext <= 1'b0;
    write_val <= 'b0;
    rdwr <= 'b0;
    start <= 'b0;
  end else begin
    case (curr_state)

      // Write to memory
      WRITE: begin
        if ( !is_writing ) begin
          is_writing <= 1'b1;
          start <= 1'b1;
          write_val <= "Uart";
          mask <= 'b1111;
          rdwr <= 'b1; // Writes
          mem_address <= 'b0;
        end else start <= 1'b0;
        if (done) begin
          curr_state <= READ;
          is_writing <= 0;
        end 
      end

      READ: begin
        if ( !is_reading ) begin
          mem_address <= 'b0;
          is_writing <= 1'b1;
          start <= 1'b1;
          mask <= 'b1111;
          rdwr <= 'b0; // READ
        end else mem_rstrb <= 1'b0;
        if (done) begin
          mem_read_data <= read_val;
          curr_state <= TRANSMIT;
          is_writing <= 0;
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
