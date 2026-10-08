#include <instructions.hpp>

void instruction::execute(ram &program_ram, cpu_state &cpu_state){
// Do nothing
}

void ADD::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];

  if (rd != 0) cpu_state.register_file[rd] = rs1_val + rs2_val;
  
  cpu_state.pc = cpu_state.pc + 4;
}

void SUB::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];

  if (rd != 0) cpu_state.register_file[rd] = rs1_val - rs2_val;
  
  cpu_state.pc = cpu_state.pc + 4;
}

void SLL::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];

  rs2_val = rs2_val & 0x1F;
  if (rd != 0) cpu_state.register_file[rd] = rs1_val << rs2_val;
    
  cpu_state.pc = cpu_state.pc + 4;
}

void SLT::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  if (rd != 0) cpu_state.register_file[rd] = ((std::int32_t)rs1_val < (std::int32_t) rs2_val) ? 1U : 0U;
    
  cpu_state.pc = cpu_state.pc + 4;
}

void SLTU::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  if (rd != 0) cpu_state.register_file[rd] = (rs1_val < rs2_val) ? 1U : 0U;
    
  cpu_state.pc = cpu_state.pc + 4;
}

void XOR::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  if (rd != 0) cpu_state.register_file[rd] = (rs1_val ^ rs2_val);
  cpu_state.pc = cpu_state.pc + 4;
}

void SRL::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  rs2_val = rs2_val & 0x1F;
  if (rd != 0) cpu_state.register_file[rd] = rs1_val >> rs2_val;
  cpu_state.pc = cpu_state.pc + 4;
}

void SRA::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  rs2_val = rs2_val & 0x1F;
  if (rd != 0) cpu_state.register_file[rd] = (std::int32_t)rs1_val >> rs2_val;
  cpu_state.pc = cpu_state.pc + 4;
}

void OR::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  if (rd != 0) cpu_state.register_file[rd] = rs1_val | rs2_val;
  cpu_state.pc = cpu_state.pc + 4;
}

void AND::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  if (rd != 0) cpu_state.register_file[rd] = rs1_val & rs2_val;
  cpu_state.pc = cpu_state.pc + 4;
}

void ADDI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  if (rd != 0) cpu_state.register_file[rd] = rs1_val + imm; 
  cpu_state.pc = cpu_state.pc + 4;
}

void SLLI::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];

  imm = imm & 0x1F;
  if (rd != 0) cpu_state.register_file[rd] = rs1_val << imm;
  cpu_state.pc = cpu_state.pc + 4;
}

void SLTI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  if (rd != 0) cpu_state.register_file[rd] = ((std::int32_t)rs1_val < (std::int32_t) imm) ? 1U : 0U;
  cpu_state.pc = cpu_state.pc + 4;
}

void SLTUI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  if (rd != 0) cpu_state.register_file[rd] = (rs1_val < imm) ? 1U : 0U;
  cpu_state.pc = cpu_state.pc + 4;
}

void XORI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  if (rd != 0) cpu_state.register_file[rd] = (rs1_val ^ imm);
  cpu_state.pc = cpu_state.pc + 4;
}

void SRLI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  imm = imm & 0x1F;
  if (rd != 0) cpu_state.register_file[rd] = rs1_val >> imm;
  cpu_state.pc = cpu_state.pc + 4;
}

void SRAI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  imm = imm & 0x1F;
  if (rd != 0) cpu_state.register_file[rd] = (std::int32_t)rs1_val >> imm;
  cpu_state.pc = cpu_state.pc + 4;
}

void ORI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  if (rd != 0) cpu_state.register_file[rd] = rs1_val | imm;
  cpu_state.pc = cpu_state.pc + 4;
}

void ANDI::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  if (rd != 0) cpu_state.register_file[rd] = rs1_val & imm;
  cpu_state.pc = cpu_state.pc + 4;
}

void JALR::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  
  if (rd != 0) cpu_state.register_file[rd] = cpu_state.pc + 4;
  cpu_state.pc = cpu_state.register_file[rs1] + (imm & ~1);
}

void LB::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t addr = rs1_val + imm;
  std::uint32_t byte = program_ram.read_int8(addr);

  if (rd != 0) cpu_state.register_file[rd] = byte;
  cpu_state.pc = cpu_state.pc + 4;
}

void LH::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t addr = rs1_val + imm;
  std::uint32_t half = program_ram.read_int16(addr);

  if (rd != 0) cpu_state.register_file[rd] = half;
  cpu_state.pc = cpu_state.pc + 4;
}

void LW::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t addr = rs1_val + imm;
  std::uint32_t word = program_ram.read_uint32(addr);

  if (rd != 0) cpu_state.register_file[rd] = word;
  cpu_state.pc = cpu_state.pc + 4;
}

void LBU::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t addr = rs1_val + imm;
  std::uint32_t byte = program_ram.read_uint8(addr);

  if (rd != 0) cpu_state.register_file[rd] = byte;
  cpu_state.pc = cpu_state.pc + 4;
}

void LHU::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t addr = rs1_val + imm;
  std::uint32_t half = program_ram.read_uint16(addr);

  if (rd != 0) cpu_state.register_file[rd] = half;
  cpu_state.pc = cpu_state.pc + 4;
}

void SB::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];

  std::uint32_t addr = rs1_val + imm;
  std::uint8_t write_val = rs2_val;

  program_ram.write_uint8(addr,write_val);
  cpu_state.pc = cpu_state.pc + 4;
}

void SH::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];

  std::uint32_t addr = rs1_val + imm;
  std::uint16_t write_val = rs2_val;

  program_ram.write_uint8(addr,write_val);
  cpu_state.pc = cpu_state.pc + 4;
}

void SW::execute(ram& program_ram, cpu_state& cpu_state){
  
  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];

  std::uint32_t addr = rs1_val + imm;
  std::uint32_t write_val = rs2_val;

  program_ram.write_uint8(addr,write_val);
  cpu_state.pc = cpu_state.pc + 4;
}

void BEQ::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  cpu_state.pc = ((rs1_val == rs2_val) ? cpu_state.pc + imm : cpu_state.pc + 4);
}

void BNE::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  cpu_state.pc = ((rs1_val != rs2_val) ? cpu_state.pc + imm : cpu_state.pc + 4);
}

void BLT::execute(ram& program_ram, cpu_state& cpu_state){

  std::int32_t rs1_val = cpu_state.register_file[rs1];
  std::int32_t rs2_val = cpu_state.register_file[rs2];
  
  cpu_state.pc = ((rs1_val < rs2_val) ? cpu_state.pc + imm : cpu_state.pc + 4);
}

void BGE::execute(ram& program_ram, cpu_state& cpu_state){

  std::int32_t rs1_val = cpu_state.register_file[rs1];
  std::int32_t rs2_val = cpu_state.register_file[rs2];
  
  cpu_state.pc = ((rs1_val >= rs2_val) ? cpu_state.pc + imm : cpu_state.pc + 4);
}

void BLTU::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  cpu_state.pc = ((rs1_val < rs2_val) ? cpu_state.pc + imm : cpu_state.pc + 4);
}

void BGEU::execute(ram& program_ram, cpu_state& cpu_state){

  std::uint32_t rs1_val = cpu_state.register_file[rs1];
  std::uint32_t rs2_val = cpu_state.register_file[rs2];
  
  cpu_state.pc = ((rs1_val >= rs2_val) ? cpu_state.pc + imm : cpu_state.pc + 4);
}

void JAL::execute(ram& program_ram, cpu_state& cpu_state){
  
  if (rd != 0) cpu_state.register_file[rd] = cpu_state.pc + 4;
  cpu_state.pc += imm;
}

void AUIPC::execute(ram& program_ram, cpu_state& cpu_state){
  if (rd != 0) cpu_state.register_file[rd] = cpu_state.pc + imm;
  cpu_state.pc = cpu_state.pc + 4;
}

void LUI::execute(ram& program_ram, cpu_state& cpu_state){
  if (rd != 0) cpu_state.register_file[rd] = imm;
  cpu_state.pc = cpu_state.pc + 4;
}
