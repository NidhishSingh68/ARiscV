#include "Vtb_top.h"
#include "verilated.h"

#include <cpu.hpp>
#include <imem.hpp>
#include <ram.hpp>

#include <cstdint>
#include <fstream>
#include <iostream>
#include <vector>

int main(int argc, char** argv) {
    VerilatedContext context;
    context.commandArgs(argc, argv);

    std::ifstream image_file("instructions.txt");
    if (!image_file) {
        std::cerr << "Could not open instructions.txt\n";
        return 1;
    }

    std::vector<std::uint32_t> instructions;
    std::uint32_t instruction;
    while (image_file >> std::hex >> instruction) {
        instructions.push_back(instruction);
    }
    if (instructions.empty()) {
        std::cerr << "instructions.txt contains no instructions\n";
        return 1;
    }

    Vtb_top top{&context};
    ram program_ram;
    imem instruction_mem;
    cpu reference(instruction_mem, program_ram);

    top.clk = 0;
    top.rst = 0;
    top.eval();
    top.clk = 1;
    top.eval();
    top.rst = 1;

    const std::size_t max_instructions = instructions.size();
    std::size_t retired = {};
    const std::size_t max_cycles = max_instructions * 100 + 100;
    for (std::size_t cycle = 0; cycle < max_cycles && retired < max_instructions; ++cycle) {
        top.clk = 0;
        top.eval();
        const bool retiring = top.retire;
        top.clk = 1;
        top.eval();

        if (!retiring) {
            continue;
        }

        const auto& before = reference.get_state();
        if ((before.pc & 3U) != 0 || before.pc / 4 >= instructions.size()) {
            std::cerr << "Reference PC is outside the assembled program: 0x"
                      << std::hex << before.pc << '\n';
            return 1;
        }
        reference.run(instructions[before.pc / 4]);
        const auto& expected = reference.get_state();
        if (top.pc != expected.pc) {
            std::cerr << "PC mismatch after instruction " << std::dec << retired
                      << ": RTL=0x" << std::hex << top.pc
                      << " reference=0x" << expected.pc << '\n';
            return 1;
        }
        for (std::size_t index = 0; index < expected.register_file.size(); ++index) {
            if (top.registers[index] != expected.register_file[index]) {
                std::cerr << "Register x" << std::dec << index
                          << " mismatch after instruction " << retired
                          << ": RTL=0x" << std::hex << top.registers[index]
                          << " reference=0x" << expected.register_file[index] << '\n';
                return 1;
            }
        }
        ++retired;
    }

    if (retired != max_instructions) {
        std::cerr << "Timed out after retiring " << retired << " of "
                  << max_instructions << " instructions\n";
        return 1;
    }

    std::cout << "Compared " << retired << " instructions successfully\n";
    return 0;
}
