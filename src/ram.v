/*
* This module handles reading and writing from FPGA's BSRAM
*/
module ram(
  input clk,
  input rst,
  input [31:0] address,

  /* 
  * SW/LW: 4'b1111 
  * SH/LWH: 4'b0011 
  * SB/LBH: 4'b0001 
  */
  input [3:0] mask,
  input sext, // If read_val should be sign extended. 1'b1: Yes, 1'b0: No (Only useful for Loads)
  input [31:0] write_val,
  input rdwr, // 1'b0: READ, 1'b1: write
  input start, // Pulsed by user to indicate beginning of a transaction

  output reg [31:0] read_val,
  output reg done // Pulsed for 1 clk cycle to notify that read/write operation has finished
);

localparam IDLE = 0;
localparam WAIT = 1;
localparam DONE = 2;

reg [1:0] curr_state = IDLE;
reg [1:0] mem_tx = 0; // Number of memory read/write tx that should happen (LW/SW: 4, LH/SH: 2, LB/SB: 1)
reg [1:0] cnt = 0; // Keeps track of tx that have happened
wire [7:0] byte_write_chunks[3:0];
assign byte_write_chunks[0] = write_val[7:0];
assign byte_write_chunks[1] = write_val[15:8];
assign byte_write_chunks[2] = write_val[23:16];
assign byte_write_chunks[3] = write_val[31:24]; 

reg [7:0] read_data[3:0];

reg oce,ce,reset,wre;
reg [7:0] din;
wire [7:0] dout;
reg [31:0] internal_address;

`ifndef VERILATOR
Gowin_SP_ram ram(
    .dout(dout), //output [7:0] dout
    .clk(clk), //input clk
    .oce(oce), //input oce
    .ce(ce), //input ce
    .reset(reset), //input reset
    .wre(wre), //input wre
    .ad(internal_address[16:0]), //input [16:0] ad
    .din(din) //input [7:0] din
);
`else 
reg [7:0] MEM[98304];

// Bypass Reads
assign dout = MEM[internal_address];

// Write model
always @(posedge clk) begin
  if (ce && wre) begin
    MEM[internal_address[16:0]] <= byte_write_chunks[cnt];
  end
end
`endif


// Output generation block
always @(*) begin
  read_val = {read_data[3],read_data[2],read_data[1],read_data[0]};
  // Sign extend only for MEM READS
  if (sext && !rdwr) begin
    // LH
    if (mask == 4'b0011) begin
      read_val = {{16{read_data[1][7]}},read_data[1],read_data[0]};
    end 
    // LB
    else if (mask == 4'b0001) begin
      read_val = {{24{read_data[0][7]}},read_data[0]};
    end 
  end
end

// Memory controller
always @(*) begin
  reset = 1'b0;
  done = 1'b0;
  wre = 1'b0;
  din = 8'b0;
  oce = 1'b0;
  ce = 1'b0;
  case (curr_state)
    IDLE: begin
      oce = 1'b0;
      ce = 1'b0;
    end
    WAIT: begin
      ce = 1'b1;
      oce = 1'b1; 
      if (rdwr) begin
        wre = 1'b1;
        oce = 1'b0;
        din = byte_write_chunks[cnt];
      end
    end
    DONE: begin
      oce = 1'b0;
      ce = 1'b0;
      done = 1'b1;
    end
  endcase
end

// Only perform read or writes in WAIT state
// Check if LOAD or STORE
//
// FOR LOADS:
// With the LOAD address, determine the number of READ transactions that need
// to happen (1,2,4 reads)
// Perform the calulated number of reads by simulatneously increasing the address
// Use the value of input sext to sign_extend the output
//
// FOR STORE:
// With the write address, determine the number of WRITE transactions that need
// to happen (1,2,4 writes)
// Perform the calulated number of write by simulatneously increasing the address
// Use the value of input sext to sign_extend the output
always @(posedge clk or negedge rst) begin
  if (!rst) begin
    curr_state <= IDLE;
  end else begin
    case (curr_state)
      IDLE: begin
        mem_tx <= 2'd0;
        cnt <= 2'b0;
        if (start) begin 
          curr_state <= WAIT;
          internal_address <= address;
          read_data[0] <= 8'b0;
          read_data[1] <= 8'b0;
          read_data[2] <= 8'b0;
          read_data[3] <= 8'b0;

          if (mask == 4'b1111) mem_tx <= 2'd3;
          else if (mask == 4'b0011) mem_tx <= 2'd1;
          else if (mask == 4'b0001) mem_tx <= 2'd0;
        end
        else begin 
          curr_state <= IDLE;
        end
      end
      WAIT: begin
        internal_address <= internal_address + 1'b1;
        cnt <= cnt + 1'b1;
        if (!rdwr) begin
          // LOADS
          read_data[cnt] <= dout; // Assume BSRAM instantiated in bypass mode
          if (cnt != mem_tx) curr_state <= WAIT;
          else curr_state <= DONE;
        end else begin
          // STORES
          if (mem_tx != cnt) curr_state <= WAIT;
          else curr_state <= DONE;
        end
      end
      DONE: begin
        curr_state <= IDLE;
      end
    endcase
  end
end

endmodule
