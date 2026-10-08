#include <helpers.hpp>

std::unique_ptr<instruction> get_lui(std::uint32_t instruction){
  std::unique_ptr<LUI> inst = std::make_unique<LUI>();
  std::uint32_t imm = instruction & 0xFFFFF000;
  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;
  inst->imm = imm;
  inst->rd = rd;
  return inst;
}

std::unique_ptr<instruction> get_auipc(std::uint32_t instruction){
  std::unique_ptr<AUIPC> inst = std::make_unique<AUIPC>();
  std::uint32_t imm = instruction & 0xFFFFF000;
  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;
  inst->imm = imm;
  inst->rd = rd;
  return inst;
}

std::unique_ptr<instruction> get_jal(std::uint32_t instruction){
  std::unique_ptr<JAL> inst = std::make_unique<JAL>();
  std::uint32_t  imm = 0;
  std::uint32_t imm_19_12 = (instruction >> J_TYPE_IMM_19_12) & 0xFF; 
  std::uint32_t imm_11 = (instruction >> J_TYPE_IMM_11) & 1U;
  std::uint32_t imm_10_1 = (instruction >> J_TYPE_IMM_10_1) & 0x3FF;
  std::uint32_t imm_20 = ((std::int32_t)instruction) >> J_TYPE_IMM_20;
  imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1);

  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;
  inst->imm = imm;
  inst->rd = rd;
  return inst;
}

std::unique_ptr<instruction> get_jalr(std::uint32_t instruction){
  std::unique_ptr<JALR> inst = std::make_unique<JALR>();

  std::uint32_t imm = ((std::int32_t)instruction >> I_TYPE_IMM_SHAMT);
  std::uint8_t rs1 = (instruction >> RS1_SHAMT) & REG_MASK;
  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;

  inst->rs1 = rs1;
  inst->rd = rd;
  inst->imm = imm;
  return inst;
}

std::unique_ptr<instruction> get_branch(std::uint32_t instruction){
  std::uint8_t func3 = (instruction >> FUNC3_SHAMT) & FUNC3_MASK;
  std::uint8_t rs1 = (instruction >> RS1_SHAMT) & REG_MASK;
  std::uint8_t rs2 = (instruction >> RS2_SHAMT) & REG_MASK;
  std::uint32_t imm {};

  std::uint32_t imm4_1 = (instruction >> B_TYPE_IMM_4_1) & 0xF;
  std::uint32_t imm10_5 = (instruction >> B_TYPE_IMM_10_5) & 0x3F;
  std::uint32_t imm11 = (instruction >> B_TYPE_IMM_11) & 1U;
  std::uint32_t imm12 = ((std::int32_t)instruction >> B_TYPE_IMM_12) & 1U;

  imm = ((imm12 << 12) | (imm11 << 11) | (imm10_5 << 5) | (imm4_1 << 1));
  std::unique_ptr<btype> inst = nullptr;

  if (func3 == 0) {
    inst = std::make_unique<BEQ>();
  } else if (func3 == 1){
    inst = std::make_unique<BNE>();
  } else if (func3 == 4) {
    inst = std::make_unique<BLT>();
  } else if (func3 == 5) {
    inst = std::make_unique<BGE>();
  } else if (func3 == 6) {
    inst = std::make_unique<BLTU>();
  } else if (func3 == 7) {
    inst = std::make_unique<BGEU>();
  }

  inst->imm = imm;
  inst->rs1 = rs1;
  inst->rs2 = rs2;
  return inst;
}

std::unique_ptr<instruction> get_load(std::uint32_t instruction){
  std::uint8_t func3 = (instruction >> FUNC3_SHAMT) & FUNC3_MASK;
  std::uint8_t rs1 = (instruction >> RS1_SHAMT) & REG_MASK;
  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;
  std::uint32_t imm = ((std::int32_t)instruction >> I_TYPE_IMM_SHAMT);

  std::unique_ptr<itype> inst = nullptr;

  if (func3 == 0) {
    inst = std::make_unique<LB>();
  } else if (func3 == 1){
    inst = std::make_unique<LH>();
  } else if (func3 == 2) {
    inst = std::make_unique<LW>();
  } else if (func3 == 4) {
    inst = std::make_unique<LBU>();
  } else if (func3 == 5) {
    inst = std::make_unique<LHU>();
  }

  inst->imm = imm;
  inst->rs1 = rs1;
  inst->rd = rd;
  return inst;
}

std::unique_ptr<instruction> get_store(std::uint32_t instruction){
  std::uint8_t func3 = (instruction >> FUNC3_SHAMT) & FUNC3_MASK;
  std::uint8_t rs1 = (instruction >> RS1_SHAMT) & REG_MASK;
  std::uint8_t rs2 = (instruction >> RS2_SHAMT) & REG_MASK;

  std::uint32_t imm4_0 = (instruction >> S_TYPE_IMM_4_0_SHAMT) & 0x1F;
  std::uint32_t imm11_5 = ((std::int32_t)instruction >> S_TYPE_IMM_11_5_SHAMT) & 0x7F;

  std::uint32_t imm = (imm11_5 << 5) | (imm4_0);

  std::unique_ptr<stype> inst = nullptr;

  if (func3 == 0) {
    inst = std::make_unique<SB>();
  } else if (func3 == 1){
    inst = std::make_unique<SH>();
  } else if (func3 == 2) {
    inst = std::make_unique<SW>();
  }

  inst->imm = imm;
  inst->rs1 = rs1;
  inst->rs2 = rs2;
  return inst;
}

std::unique_ptr<instruction> get_itype(std::uint32_t instruction){
  std::uint8_t func3 = (instruction >> FUNC3_SHAMT) & FUNC3_MASK;
  std::uint8_t func7 = (instruction >> FUNC7_SHAMT) & FUNC7_MASK;
  func7 = func7 >> 2; // Lower 2 bits of Func7 are not needed

  std::uint8_t rs1 = (instruction >> RS1_SHAMT) & REG_MASK;
  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;
  std::uint32_t imm = ((std::int32_t)instruction >> I_TYPE_IMM_SHAMT);

  std::unique_ptr<itype> inst = nullptr;

  if (func3 == 0) {
    inst = std::make_unique<ADDI>();
  } else if (func3 == 2){
    inst = std::make_unique<SLTI>();
  } else if (func3 == 3) {
    inst = std::make_unique<SLTUI>();
  } else if (func3 == 4) {
    inst = std::make_unique<XORI>();
  } else if (func3 == 6) {
    inst = std::make_unique<ORI>();
  } else if (func3 == 7) {
    inst = std::make_unique<ANDI>();
  } else if (func3 == 1 && func7 == 0) {
    inst = std::make_unique<SLLI>();
  } else if (func3 == 5 && func7 == 0) {
    inst = std::make_unique<SRLI>();
  } else if (func3 == 5 && func7 != 0) {
    inst = std::make_unique<SRAI>();
  }

  inst->imm = imm;
  inst->rs1 = rs1;
  inst->rd = rd;

  return inst;

}

std::unique_ptr<instruction> get_rtype(std::uint32_t instruction){
  std::uint8_t func3 = (instruction >> FUNC3_SHAMT) & FUNC3_MASK;
  std::uint8_t func7 = (instruction >> FUNC7_SHAMT) & FUNC7_MASK;
  func7 = func7 >> 2; // Lower 2 bits of Func7 are not needed

  std::uint8_t rs1 = (instruction >> RS1_SHAMT) & REG_MASK;
  std::uint8_t rs2 = (instruction >> RS2_SHAMT) & REG_MASK;
  std::uint8_t rd = (instruction >> RD_SHAMT) & REG_MASK;

  std::unique_ptr<rtype> inst = nullptr;

  if (func3 == 0) {
    inst = std::make_unique<ADD>();
  } else if (func3 == 2){
    inst = std::make_unique<SLT>();
  } else if (func3 == 3) {
    inst = std::make_unique<SLTU>();
  } else if (func3 == 4) {
    inst = std::make_unique<XOR>();
  } else if (func3 == 6) {
    inst = std::make_unique<OR>();
  } else if (func3 == 7) {
    inst = std::make_unique<AND>();
  } else if (func3 == 1 && func7 == 0) {
    inst = std::make_unique<SLL>();
  } else if (func3 == 5 && func7 == 0) {
    inst = std::make_unique<SRL>();
  } else if (func3 == 5 && func7 != 0) {
    inst = std::make_unique<SRA>();
  }

  inst->rs1 = rs1;
  inst->rs2 = rs2;
  inst->rd = rd;

  return inst;
}
