#pragma once
#include <cstdint>

enum class OPCODE_T : std::uint8_t {
  LUI  = 0b00110111,
  AUIPC = 0b00010111,
  JAL = 0b01101111,
  JALR = 0b01100111,
  BRANCH = 0b01100011,
  LOAD = 0b00000011,
  STORE = 0b00100011,
  ITYPE = 0b00010011,
  RTYPE = 0b00110011
};
