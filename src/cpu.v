module cpu (
  input clk,

  output done
  // Add memory Interface
);

// Instruction Memory Interace
reg [31:0] pc;
reg rdstrb;
reg [31:0] instruction;
reg dv;

inst_mem i_mem(
  .clk(clk),
  .address(pc[11:0]),
  .rdstrb(rdstrb),
  .data(instruction),
  .dv(dv)
);

localparam INSTRUCTION_FETCH = 0;
localparam INSTRUCTION_DECODE = 1;
localparam INSTRUCTION_EXECUTE = 2;
localparam INSTRUCTION_EXECUTE = 3;

reg [1:0] curr_state = INSTRUCTION_FETCH;
assign rdstrb = (curr_state == INSTRUCTION_FETCH && dv == 1'b0);

always @(posedge clk) begin
  case (curr_state)
    INSTRUCTION_FETCH: begin
      if (dv) curr_state <= INSTRUCTION_DECODE;
      else curr_state <= INSTRUCTION_FETCH;
    end
    INSTRUCTION_DECODE: begin
      curr_state <= INSTRUCTION_EXECUTE;
    end
    INSTRUCTION_EXECUTE: begin
      curr_state <= INSTRUCTION_WB;
    end
    INSTRUCTION_WB: begin
      curr_state <= INSTRUCTION_FETCH;
    end
  endcase
end

// Decode Stage 
wire opcode[6:0] = instruction[6:0];
wire rd[4:0] = instruction[11:7];
wire func3[2:0] = instruction[14:12];
wire rs1[4:0] = instruction[19:15];
wire rs2[4:0] = instruction[24:20];
wire func7[6:0] = instruction[31:25];
wire i_imm[31:0] = $signed(instruction[31:20]);
wire s_imm[31:0] = $signed({instrucion[31:25],instruction[11:7]});
wire b_imm[31:0] = $signed({instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0});
wire u_imm[31:0] = $signed({instruction[31:12],12'b0});
wire j_imm[31:0] = $signed({instruction[31],instruction[19:12],instruction[20],instruction[30:21],1'b0});

wire alu_reg = (opcode == 'b0110011);
wire alu_imm = (opcode == 'b0010011);
wire is_jal = (opcode == 'b1101111);
wire is_jalr = (opcode == 'b1100111);
wire is_lui = (opcode == 'b0110111);
wire is_auipc = (opcode == 'b0010111);
wire is_branch = (opcode == 'b1100011);
wire is_load = (opcode == 'b0000011);
wire is_store = (opcode == 'b0100011);

reg reg_write = 1'b0;
reg [31:0] write_data = 'b0;

wire [31:0] ors1;
wire [31:0] ors2;

regFile register_file(
  .clk(clk),
  .irs1(rs1),
  .irs2(rs2),
  .regWrite(reg_write),
  .idata(write_data),
  .rd(rd),

  .ors1(ors1),
  .ors2(ors2)
);
  
reg [31:0] rs1_value;
reg [31:0] rs2_value;
always @(posedge clk) begin
  if (curr_state == INSTRUCTION_EXECUTE) begin
    rs1_value <= ors1; 
    rs2_value <= ors2;
  end
end

// Execute Stage
wire [31:0] alu_inp1 = rs1_value;
wire [31:0] alu_inp2 = ( alu_imm ? i_imm : rs2_value);
wire [31:0] alu_out;

wire [32:0] extended_alu_inp1 = {1'b0,alu_inp1};
wire [32:0] extended_alu_inp2 = {1'b0,alu_inp2};
wire [32:0] extended_alu_minus = alu_inp1 - alu_inp2;

always @(*) begin
  case (func3)
    'b000: alu_out = ( func7[5] ? extended_alu_minus[31:0] : alu_inp1 + alu_inp2 ); // Add & Sub
    'b001: alu_out = (alu_inp1 << alu_inp2[4:0]);
    'b010: alu_out = (alu_inp1 < alu_inp2 ? 32'b1 : 32'b0); // Slt
    'b011: alu_out = (extended_alu_minus[32] ? 32'b1 : 32'b0); // Sltu
    'b100: alu_out = (alu_inp1 ^ alu_inp2); // Xor
    'b101: alu_out = $signed(alu_in1}) >>> alu_inp2[4:0]; // Srl & Sra TODO: Check if this works
    'b110: alu_out = alu_inp1 | alu_inp2;
    'b111: alu_out = alu_inp1 & alu_inp2;
  endcase
end

endmodule
