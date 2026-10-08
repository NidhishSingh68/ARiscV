#include <cpu.hpp>
#include <imem.hpp>
#include <ram.hpp>


int main(){
  ram program_ram;
  imem instruction_mem;

  cpu cpu(instruction_mem,program_ram);
}
