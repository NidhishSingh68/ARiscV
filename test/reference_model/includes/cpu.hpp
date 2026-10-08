#pragma once
#include <cstdint>
#include <array>
#include <imem.hpp>
#include <ram.hpp>

// The state of CPU
struct cpu_state {
  std::uint32_t pc;
  std::array<std::uint32_t, 32> register_file;
};

class cpu {
  private:
    cpu_state state;
    imem& instruction_mem;
    ram& program_ram;
  public:
    cpu(imem& instruction_mem, ram& program_ram);
    ~cpu() = default;
    std::uint32_t fetch();
    void run(std::uint32_t instruction);
    const cpu_state& get_state() const;
};
