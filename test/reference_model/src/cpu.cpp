#include <iostream>
#include <cpu.hpp>
#include <opcodes.hpp>
#include <helpers.hpp>
#include <instructions.hpp>

cpu::cpu(imem& instruction_mem, ram& program_ram) : instruction_mem(instruction_mem), program_ram(program_ram) {
  state.pc = 0;
  state.register_file.fill(0);
}

std::uint32_t cpu::fetch(){
  return instruction_mem.fetch(state.pc);
}

void cpu::run(std::uint32_t inst_word){
  std::uint8_t opcode = inst_word & 0x0000007F;
  if (opcode == 0x0F) {
    state.pc += 4;
    return;
  }
  OPCODE_T inst_opcode = static_cast<OPCODE_T>(opcode);
  std::unique_ptr<instruction> inst;

  switch (inst_opcode){
    case OPCODE_T::LUI:
      inst = get_lui(inst_word);
      break;
    case OPCODE_T::AUIPC:
      inst = get_auipc(inst_word);
      break;
    case OPCODE_T::JAL:
      inst = get_jal(inst_word);
      break;
    case OPCODE_T::JALR:
      inst = get_jalr(inst_word);
      break;
    case OPCODE_T::BRANCH:
      inst = get_branch(inst_word);
      break;
    case OPCODE_T::LOAD:
      inst = get_load(inst_word);
      break;
    case OPCODE_T::STORE:
      inst = get_store(inst_word);
      break;
    case OPCODE_T::ITYPE:
      inst = get_itype(inst_word);
      break;
    case OPCODE_T::RTYPE:
      inst = get_rtype(inst_word);
      break;
    default: 
      // TODO: Add fault handling for malformed instructions
      std::cout << "Invalid Instruction!! Skipping" << std::endl;
      return;
  }

  inst->execute(program_ram, state);
}

const cpu_state& cpu::get_state() const {
  return state;
}
