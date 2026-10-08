module cpu (
  input clk,
  input rst,
  
  // Instruction Mem Interface
  output reg[31:0] pc,
  output reg rdstrb,
  input reg [31:0] instruction,
  input reg dv,

  // Ram Interface
  output [31:0] address,
  output reg [3:0] mask,
  output reg sext,
  output [31:0] write_val,
  output rdwr,
  output start,
  
  input [31:0] read_val,
  input ram_op_done

);

localparam INSTRUCTION_FETCH = 0;
localparam INSTRUCTION_DECODE = 1;
localparam INSTRUCTION_EXECUTE = 2;
localparam INSTRUCTION_MEM = 3;
localparam INSTRUCTION_WB = 4;

reg [2:0] curr_state = INSTRUCTION_FETCH;
assign rdstrb = (curr_state == INSTRUCTION_FETCH && dv == 1'b0);

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    curr_state <= INSTRUCTION_FETCH;
  end else begin
    case (curr_state)
      INSTRUCTION_FETCH: begin
        if (dv) curr_state <= INSTRUCTION_DECODE;
        else curr_state <= INSTRUCTION_FETCH;
      end
      INSTRUCTION_DECODE: begin
        curr_state <= INSTRUCTION_EXECUTE;
      end
      INSTRUCTION_EXECUTE: begin
        if (is_mem_op ) curr_state <= INSTRUCTION_MEM;
        else curr_state <= INSTRUCTION_WB;
      end
      INSTRUCTION_MEM: begin
        if (ram_op_done) curr_state <= INSTRUCTION_WB;
        else curr_state <= INSTRUCTION_MEM;
      end
      INSTRUCTION_WB: begin
        curr_state <= INSTRUCTION_FETCH;
      end
    endcase
  end
end
wire [31:0] auipc;

reg [31:0] localinst;
always @(posedge clk or negedge rst) begin
  if (!rst) begin
    localinst <= 32'b0;
  end else if (curr_state == INSTRUCTION_FETCH && dv) localinst <= instruction;
end

// Decode Stage 
wire [6:0] opcode = localinst[6:0];
wire [4:0] rd = localinst[11:7];
wire [2:0] func3 = localinst[14:12];
wire [4:0] rs1 = localinst[19:15];
wire [4:0] rs2 = localinst[24:20];
wire [6:0] func7 = localinst[31:25];
wire [31:0] i_imm = $signed({{20{localinst[31]}},localinst[31:20]});
wire [31:0] s_imm = $signed({{20{localinst[31]}},localinst[31:25],localinst[11:7]});
wire [31:0] b_imm = $signed({{20{localinst[31]}},localinst[7],localinst[30:25],localinst[11:8],1'b0});
wire [31:0] u_imm = $signed({localinst[31:12],12'b0});
wire [31:0] j_imm = $signed({{12{localinst[31]}},localinst[19:12],localinst[20],localinst[30:21],1'b0});
wire [31:0] logical_next_inst_address = pc+32'd4;
wire [31:0] alupc_res = pc + u_imm;

wire alu_reg = (opcode == 'b0110011);
wire alu_imm = (opcode == 'b0010011);
wire is_jal = (opcode == 'b1101111);
wire is_jalr = (opcode == 'b1100111);
wire is_lui = (opcode == 'b0110111);
wire is_auipc = (opcode == 'b0010111);
wire is_branch = (opcode == 'b1100011);
wire is_load = (opcode == 'b0000011);
wire is_store = (opcode == 'b0100011);

wire regfile_wb = ( alu_reg | alu_imm | is_jal | is_jalr | is_lui | is_auipc | is_load );

wire is_mem_op = (is_load || is_store);

wire reg_write = (curr_state == INSTRUCTION_WB) && regfile_wb;
// Write back data which is the input to the Register File
wire [31:0] write_data = ( (is_jal || is_jalr) ? logical_next_inst_address :
                          (is_load ? mem_read_val :
                          (is_auipc ? alupc_res : (is_lui ? u_imm : alu_out))));

wire [31:0] ors1;
wire [31:0] ors2;

// Execute stage inputs
wire [31:0] alu_inp1 = rs1_value;
wire [31:0] alu_inp2 = ( alu_imm ? i_imm : rs2_value);
reg [31:0] alu_out;

wire [32:0] extended_alu_inp1 = {1'b0,alu_inp1};
wire [32:0] extended_alu_inp2 = {1'b0,alu_inp2};
wire [32:0] extended_alu_minus = alu_inp1 - alu_inp2;

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
always @(posedge clk or negedge rst) begin
  if (!rst) begin
    rs1_value <= 32'b0;
    rs2_value <= 32'b0;
  end else if (curr_state == INSTRUCTION_DECODE) begin
    rs1_value <= ors1; 
    rs2_value <= ors2;
  end
end

wire [32:0] srl_sra_out = $signed({(func7[5] & alu_inp1[31]),alu_inp1}) >>> alu_inp2[4:0];

// Execute Stage
always @(*) begin
  case (func3)
    'b000: alu_out = (alu_reg && func7[5] ? extended_alu_minus[31:0] : alu_inp1 + alu_inp2); // Add & Sub
    'b001: alu_out = (alu_inp1 << alu_inp2[4:0]);
    'b010: alu_out = ($signed(alu_inp1) < $signed(alu_inp2) ? 32'b1 : 32'b0); // Slt
    'b011: alu_out = (extended_alu_minus[32] ? 32'b1 : 32'b0); // Sltu
    'b100: alu_out = (alu_inp1 ^ alu_inp2); // Xor
    'b101: alu_out = srl_sra_out[31:0]; // Srl & Sra TODO: Check if this works
    'b110: alu_out = alu_inp1 | alu_inp2;
    'b111: alu_out = alu_inp1 & alu_inp2;
  endcase
end

wire is_zero =  (extended_alu_minus[31:0] == 32'b0);
wire is_lt = ($signed(alu_inp1) < $signed(alu_inp2)); // TODO: Can be optimized
wire is_ltu = extended_alu_minus[32];

// Inputs for the MEM stage
wire [31:0] mem_addr_offset = (is_load ? i_imm : s_imm);
assign address = rs1_value + mem_addr_offset;

always @(*) begin
    sext = 1'b1;
    mask = 4'b0000; // Invlalid default mask
  case (func3)
    3'b000: begin
      mask = 4'b0001; // LB/SB
    end
    3'b001: begin
      mask = 4'b0011; // LH/SH
    end
    3'b010: begin
      mask = 4'b1111; // LW/SW
    end
    3'b100: begin
      // LBU
      mask = 4'b0001;
      sext = 1'b0;
    end
    3'b101: begin
      // LHU 
      mask = 4'b0011;
      sext = 1'b0;
    end
  endcase
end

assign rdwr = (is_store); // If is_store 1'b1: Write, otherwise read
assign start = (curr_state == INSTRUCTION_EXECUTE && is_mem_op);
assign write_val = rs2_value;

reg [31:0] mem_read_val;
always @(posedge clk or negedge rst) begin
  if (!rst) begin
    mem_read_val <= 'b0;
  end else begin
    if (curr_state == INSTRUCTION_MEM && ram_op_done) begin
      mem_read_val <= read_val;
    end
  end
end

// Write Back Stage
reg takebranch;
always @(*) begin
  case (func3)
    'b000: takebranch = is_zero;
    'b001: takebranch = ~is_zero;
    'b100: takebranch = is_lt;
    'b101: takebranch = ((~is_lt) || (is_zero));
    'b110: takebranch = is_ltu;
    'b111: takebranch = ((~is_ltu) || (is_zero));
    default: takebranch = 1'b0;
  endcase
end

wire [31:0] next_pc = ((is_branch && takebranch) ? pc+b_imm :
                       (is_jal ? pc+j_imm :
                       (is_jalr ? ((rs1_value+i_imm) & 32'hffff_fffe) : logical_next_inst_address)));
always @(posedge clk or negedge rst) begin
  if (!rst) begin
    pc <= 32'b0;
  end else begin
    if (curr_state == INSTRUCTION_WB) begin
      pc <= next_pc;
    end 
  end
end

endmodule
