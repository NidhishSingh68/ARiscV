#pragma once
#include <cstdint>
#include <array>

static constexpr std::uint32_t RAM_SIZE = 1024*1024;

class ram{
  private:
  // 1Mb of instruction memory
  // Should be enough since FPGA does not even have 100Kb of RAM
    std::array<std::uint8_t,RAM_SIZE> RAM; 

  public:
    std::uint32_t read_uint8(std::uint32_t addr);
    std::uint32_t read_uint16(std::uint32_t addr);
    std::uint32_t read_uint32(std::uint32_t addr);
    std::uint32_t read_int8(std::uint32_t addr);
    std::uint32_t read_int16(std::uint32_t addr);

    void write_uint8(std::uint32_t addr, std::uint8_t value);
    void write_uint16(std::uint32_t addr, std::uint16_t value);
    void write_uint32(std::uint32_t addr, std::uint32_t value);
};
