#include <ram.hpp>

std::uint32_t ram::read_uint8(std::uint32_t addr){
  std::uint32_t byte0 = RAM[addr];
  return byte0;
}

std::uint32_t ram::read_uint16(std::uint32_t addr){
  std::uint32_t byte0 = RAM[addr];
  std::uint32_t byte1 = RAM[addr+1];
  std::uint32_t half_word = (byte1 << 8) | byte0;
  return half_word;
}

std::uint32_t ram::read_uint32(std::uint32_t addr){
  std::uint32_t byte0 = RAM[addr];
  std::uint32_t byte1 = RAM[addr+1];
  std::uint32_t byte2 = RAM[addr+2];
  std::uint32_t byte3 = RAM[addr+3];

  std::uint32_t word = (byte3 << 24) | (byte2 << 16) | (byte1 << 8) | (byte0);
  return word;
}

std::uint32_t ram::read_int8(std::uint32_t addr){
  std::uint32_t byte0 = (std::int8_t)RAM[addr];
  return byte0;
}

std::uint32_t ram::read_int16(std::uint32_t addr){
  std::int32_t byte0 = (std::int8_t)RAM[addr];
  std::int32_t byte1 = (std::int8_t)RAM[addr+1];
  std::uint32_t half_word = (byte1 << 8) | byte0;
  return half_word;
}

void ram::write_uint8(std::uint32_t addr, std::uint8_t value){
  RAM[addr] = value;
}

void ram::write_uint16(std::uint32_t addr, std::uint16_t value){
  RAM[addr] = (value);
  RAM[addr+1] = (value >> 8);
}

void ram::write_uint32(std::uint32_t addr, std::uint32_t value){
  RAM[addr] = (value);
  RAM[addr+1] = (value >> 8);
  RAM[addr+2] = (value >> 16);
  RAM[addr+3] = (value >> 24);
}
