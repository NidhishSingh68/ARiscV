#pragma once

#include <cstdint>
#include <array>
#include <vector>

static constexpr int IMEM_SIZE = 1024*1024;

class imem{
  private:
    std::array<std::uint8_t,IMEM_SIZE> IMEM; // 1Mb of instruction memory
  public:
    std::uint32_t fetch(std::uint32_t pc);
    void load_image(const std::vector<std::uint8_t>& image);
};
