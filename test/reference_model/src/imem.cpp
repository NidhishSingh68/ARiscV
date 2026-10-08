#include <imem.hpp>
#include <algorithm>

void imem::load_image(const std::vector<std::uint8_t>& image){
  IMEM.fill(0);
  std::copy_n(image.begin(), std::min(image.size(), IMEM.size()), IMEM.begin());
}

std::uint32_t imem::fetch(std::uint32_t pc){
  std::uint32_t byte0 = IMEM[pc];
  std::uint32_t byte1 = IMEM[pc+1];
  std::uint32_t byte2 = IMEM[pc+2];
  std::uint32_t byte3 = IMEM[pc+3];

  std::uint32_t inst = (byte3 << 24) | (byte2 << 16) | (byte1 << 8) | (byte0);
  return inst;
}
