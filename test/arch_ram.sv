module ram (
  input clk,
  input rst,
  input [31:0] address,
  input [3:0] mask,
  input sext,
  input [31:0] write_val,
  input rdwr,
  input start,
  output reg [31:0] read_val,
  output wire done
);
  localparam IDLE = 2'd0;
  localparam WAIT = 2'd1;
  localparam DONE = 2'd2;

  reg [1:0] state = IDLE;
  reg [7:0] memory [0:1048575];
  reg [31:0] request_address;
  reg [3:0] request_mask;
  reg request_sext;
  reg [31:0] request_write_val;
  reg request_rdwr;
  integer byte_index;
  reg [31:0] value;

  assign done = (state == DONE);

  initial begin
    read_val = 32'b0;
    $readmemh("memory.hex", memory);
  end

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      state <= IDLE;
    end else begin
      case (state)
        IDLE: begin
          if (start) begin
            request_address <= address;
            request_mask <= mask;
            request_sext <= sext;
            request_write_val <= write_val;
            request_rdwr <= rdwr;
            state <= WAIT;
          end
        end
        WAIT: begin
          if (request_rdwr) begin
            for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1) begin
              if (request_mask[byte_index])
                memory[request_address + byte_index] <= request_write_val[byte_index * 8 +: 8];
            end
          end else begin
            value = 32'b0;
            for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1) begin
              if (request_mask[byte_index])
                value[byte_index * 8 +: 8] = memory[request_address + byte_index];
            end
            if (request_sext && request_mask == 4'b0001)
              read_val <= {{24{value[7]}}, value[7:0]};
            else if (request_sext && request_mask == 4'b0011)
              read_val <= {{16{value[15]}}, value[15:0]};
            else
              read_val <= value;
          end
          state <= DONE;
        end
        DONE: state <= IDLE;
        default: state <= IDLE;
      endcase
    end
  end
endmodule
