#pragma once

#include <imem.hpp>
#include <ram.hpp>
#include <cpu.hpp>

class emulator{
private:
  imem instruction_memory;
  ram program_ram;
  cpu cpu;
public:
  void run();
};
