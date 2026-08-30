module uart_tx
#(
  parameter BAUDRATE = 115200,
  parameter CLOCK_FREQ = 50000000
)
(
  input clk,
  input [7:0] data_in,
  input rstrb,
  input reset,
  
  output reg data_out,
  output reg tx_done
);

  localparam CYCLES_PER_BIT = 434;
  localparam UARTIDLE = 'b1;
  
  localparam IDLE = 0;
  localparam START_BIT = 1;
  localparam DATA_BITS = 2;
  localparam STOP_BIT = 3;
  localparam DONE = 4;

  reg [2:0] curr_state = IDLE;
  reg [2:0] next_state = IDLE;
  
  // Local Variables 
  reg [7:0] read_data = 0; // Store the read data in a local register
  reg [2:0] curr_bit = 0; // Index keeping track of current transmitted bit
  reg [$clog2(CYCLES_PER_BIT)-1:0] curr_cycle = 0; // Keeps track of cycles elapsed in current state 
  
  always @(*) begin
    if (reset) begin
      tx_done = 'b0;
      data_out = UARTIDLE;
      next_state = IDLE;

    end else begin
      case (curr_state)
        IDLE: begin
          tx_done = 'b0;
          data_out = UARTIDLE; // IDLE state for uart is 1
          if (rstrb) next_state = START_BIT;
          else next_state = IDLE;
        end
        START_BIT: begin
          tx_done = 'b0;
          data_out = 'b0;
          if (curr_cycle == CYCLES_PER_BIT - 1)
            next_state = DATA_BITS;
          else 
            next_state = START_BIT;
        end
        DATA_BITS: begin
          tx_done = 'b0;
          data_out = read_data[curr_bit];
          if (curr_bit == 7 && curr_cycle == CYCLES_PER_BIT - 1)
            next_state = STOP_BIT;
          else 
            next_state = DATA_BITS;
        end
        STOP_BIT: begin
          tx_done = 'b0;
          data_out = 'b1;
          if (curr_cycle == CYCLES_PER_BIT - 1)
            next_state = DONE;
          else 
            next_state = STOP_BIT;
        end
        DONE: begin
          tx_done = 'b1;
          data_out = UARTIDLE;
          next_state = IDLE;
        end
        default: begin 
          tx_done = 'b0;
          data_out = 'b1;
          next_state = IDLE;
        end
      endcase
    end
  end
  
  // State Transition Logic
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      curr_state <= IDLE;
    end else begin
      curr_state <= next_state;
    end
  end
  
  // Sequential Logic
  always @( posedge clk or posedge reset ) begin
    if (reset) begin
      curr_cycle <= 0;
      curr_bit <= 0;
    end else begin
      case (curr_state)
        IDLE: begin
          if (rstrb) read_data <= data_in;
        end
        START_BIT: begin
          if (curr_cycle == CYCLES_PER_BIT - 1)
            curr_cycle <= 0;
          else
            curr_cycle <= curr_cycle + 1;
        end
        DATA_BITS: begin
          // Update curr_bit every CYCLES_PER_BIT clk cycles uptill 7
          if (curr_bit == 7 && curr_cycle == CYCLES_PER_BIT - 1) begin
            curr_bit <= 0;
            curr_cycle <= 0;
          end else begin
            if (curr_cycle == CYCLES_PER_BIT - 1) begin
              curr_bit <= curr_bit + 1;
              curr_cycle <= 0;
            end else
              curr_cycle <= curr_cycle + 1;
            end
        end
        STOP_BIT: begin
          if (curr_cycle == CYCLES_PER_BIT - 1) curr_cycle <= 0;
          else curr_cycle <= curr_cycle + 1;
        end
        default: ;
      endcase
    end
  end

endmodule
